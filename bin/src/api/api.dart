import 'dart:io' show ContentType, HttpClient, HttpHeaders;

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http show BaseClient;
import 'package:http/io_client.dart' as io show IOClient;
import 'package:http/retry.dart' show RetryClient;

import '../env/env.dart';
import '../models/answer.dart';
import '../models/question.dart';
import '../models/related_site.dart';
import '../models/site.dart';
import '../models/user.dart';
import '../services/stack_exchange_service.dart';
import 'credentials_interceptor.dart';
import 'json_serializable_converter.dart';

class Api {
  Api({http.BaseClient? baseClient}) {
    _client = _buildClient(baseClient);
  }

  StackExchangeService get service =>
      _client.getService<StackExchangeService>();

  late final ChopperClient _client;

  static final List<ChopperService> _services = [
    StackExchangeService.create(),
  ];

  static const JsonConverter _converter = JsonSerializableConverter({
    Answer: Answer.fromJson,
    Question: Question.fromJson,
    RelatedSite: RelatedSite.fromJson,
    Site: Site.fromJson,
    User: User.fromJson,
  });

  ChopperClient _buildClient([http.BaseClient? baseClient]) => ChopperClient(
        client: baseClient ?? _defaultBaseClient,
        baseUrl: Env.stackExchangeBaseUrl,
        interceptors: [
          (Request request) => applyHeaders(
                request,
                {
                  HttpHeaders.acceptHeader: ContentType.json.mimeType,
                  HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
                },
                override: true,
              ),
          CredentialsInterceptor(),
          CurlInterceptor(),
        ],
        converter: _converter,
        errorConverter: _converter,
        services: _services,
      );

  http.BaseClient get _defaultBaseClient => RetryClient(
        io.IOClient(
          HttpClient()..connectionTimeout = const Duration(seconds: 30),
        ),
      );
}
