// ignore_for_file: long-parameter-list

import 'dart:convert' show jsonDecode;
import 'package:http/http.dart' as http show get, ClientException, Response;

import 'order.dart';
import 'sort.dart';
import '../env/env.dart';
import '../extensions/unix_date_time_extension.dart';
import '../models/item_list.dart';
import '../models/question.dart';

class StackExchangeService {
  /// Read more https://api.stackexchange.com/docs/advanced-search
  static Future<ItemList<Question>> search({
    required String siteId,
    required String query,
    bool? accepted,
    int? answers,
    String? body,
    bool? closed,
    bool? migrated,
    bool? notice,
    Set<String>? notTagged,
    Set<String>? tagged,
    String? title,
    int? ownerId,
    Uri? url,
    int? views,
    bool? wiki,
    DateTime? fromDate,
    DateTime? toDate,
    int page = 1,
    int pageSize = 100,
    Sort sort = Sort.relevance,
    Order order = Order.desc,
  }) =>
      _search(
        {
          'site': siteId,
          'q': query,
          'accepted': accepted,
          'answers': answers,
          'body': body,
          'closed': closed,
          'migrated': migrated,
          'notice': notice,
          'nottagged': notTagged?.join(';'),
          'tagged': tagged?.join(';'),
          'title': title,
          'user': ownerId,
          'url': url,
          'views': views,
          'wiki': wiki,
          'fromdate': fromDate?.secondsSinceEpoch,
          'todate': toDate?.secondsSinceEpoch,
          'page': page,
          'pagesize': pageSize,
          'sort': sort,
          'order': order,
        }..removeWhere((String key, dynamic value) => value == null),
      );

  static Future<ItemList<Question>> _search(Map<String, dynamic> params) async {
    final Uri url = Uri.https(
      'api.stackexchange.com',
      '${Env.stackExchangeApiVersion}/search/advanced',
      {
        ...params,
        'key': Env.stackExchangeApiKey,
        'client_id': Env.stackExchangeClientId,
      }.map(
        (String key, dynamic value) => MapEntry(
          key,
          value?.toString(),
        ),
      ),
    );

    final http.Response response = await http.get(url);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isNotEmpty) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        return json.containsKey('items') && json['items'] is Iterable
            ? ItemList<Question>(
                <Question>[
                  for (final item in json['items'] as List)
                    Question.fromJson(item as Map<String, dynamic>),
                ],
                hasMore: json['has_more'] as bool? ?? false,
                quotaMax: json['quota_max'] as int? ?? 0,
                quotaRemaining: json['quota_remaining'] as int? ?? 0,
              )
            : ItemList<Question>.empty();
      }

      return ItemList<Question>.empty();
    } else {
      if (response.body.isNotEmpty) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        throw http.ClientException(
          json['error_message'] ?? 'Failed to load data',
          url,
        );
      }

      throw http.ClientException('Failed to load data', url);
    }
  }
}
