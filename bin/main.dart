// ignore_for_file: long-method

import 'dart:io' show exitCode, stdout;

import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:args/args.dart';
import 'package:cli_script/cli_script.dart';
import 'package:collection/collection.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http show ClientException;
import 'package:stash/stash_api.dart';

import 'src/env/env.dart';
import 'src/extensions/string_helpers.dart';
import 'src/models/item_list.dart';
import 'src/models/question.dart';
import 'src/api/stack_exchange_service.dart';

part 'main_helpers.dart';

bool _verbose = false;
bool _update = false;

void main(List<String> arguments) {
  wrapMain(() async {
    try {
      exitCode = 0;

      _workflow.clearItems();

      final ArgParser parser = ArgParser()
        ..addOption('query', abbr: 'q', defaultsTo: '')
        ..addOption('delay', abbr: 'd', defaultsTo: '0')
        ..addFlag('verbose', abbr: 'v', defaultsTo: false)
        ..addFlag('update', abbr: 'u', defaultsTo: false);
      final ArgResults args = parser.parse(arguments);

      int? delay = int.tryParse(args['delay']);
      if (delay != null && delay > 0) {
        await Future.delayed(Duration(milliseconds: delay));
      }

      _update = args['update'];
      if (_update) {
        stdout.writeln('Updating workflow...');

        return await _updater.update();
      }

      _verbose = args['verbose'];

      final List<String> query =
          args['query'].replaceAll(RegExp(r'\s+'), ' ').trim().split(' ');

      final Set<String> tags = (query
              .where((String el) => el.startsWith('.'))
              .map((String el) => el.substring(1))
              .toList()
            ..sort())
          .toSet();

      final String queryString = query
          .whereNot((String el) => el.startsWith('.'))
          .join(' ')
          .trim()
          .toLowerCase();

      if (_verbose) stdout.writeln('Query: "$queryString"');

      if (queryString.isEmpty) {
        _showPlaceholder();
      } else {
        _workflow.cacheKey = tags.isNotEmpty
            ? '${queryString}_${tags.join('.').md5hex}'
            : queryString;
        if (await _workflow.getItems() == null) {
          await _performSearch(query: queryString, tags: tags);
        }
      }
    } on FormatException catch (err) {
      exitCode = 2;
      _workflow.addItem(AlfredItem(title: err.toString()));
    } catch (err) {
      exitCode = 1;
      _workflow.addItem(AlfredItem(title: err.toString()));
      if (_verbose) rethrow;
    } finally {
      if (!_update) {
        if (await _updater.updateAvailable()) {
          _workflow.run(addToBeginning: updateItem);
        } else {
          _workflow.run();
        }
      }
    }
  });
}
