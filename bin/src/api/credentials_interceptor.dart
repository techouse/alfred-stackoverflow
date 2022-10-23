import 'dart:async' show FutureOr;

import 'package:chopper/chopper.dart';

import '../env/env.dart';

class CredentialsInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) =>
      request.method == HttpMethod.Get
          ? request.copyWith(parameters: {
              ...request.parameters,
              'key': Env.stackExchangeApiKey,
              'client_id': Env.stackExchangeClientId,
            })
          : request;
}
