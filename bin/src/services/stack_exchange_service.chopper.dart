// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_exchange_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$StackExchangeService extends StackExchangeService {
  _$StackExchangeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = StackExchangeService;

  @override
  Future<Response<ItemList<Question>>> _search({
    required String siteId,
    required String query,
    bool? accepted,
    int? answers,
    String? body,
    bool? closed,
    bool? migrated,
    bool? notice,
    String? notTagged,
    String? tagged,
    String? title,
    int? ownerId,
    Uri? url,
    int? views,
    bool? wiki,
    int? fromDate,
    int? toDate,
    int page = 1,
    int pageSize = 100,
    Sort? sort,
    Order? order,
  }) {
    final String $url = 'search/advanced';
    final Map<String, dynamic> $params = <String, dynamic>{
      'site': siteId,
      'q': query,
      'accepted': accepted,
      'answers': answers,
      'body': body,
      'closed': closed,
      'migrated': migrated,
      'notice': notice,
      'nottagged': notTagged,
      'tagged': tagged,
      'title': title,
      'user': ownerId,
      'url': url,
      'views': views,
      'wiki': wiki,
      'fromdate': fromDate,
      'todate': toDate,
      'page': page,
      'pagesize': pageSize,
      'sort': sort,
      'order': order,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ItemList<Question>, Question>($request);
  }

  @override
  Future<Response<ItemList<Answer>>> _getAnswers({
    required String ids,
    int? fromDate,
    int? toDate,
    int page = 1,
    int pageSize = 100,
    Sort? sort,
    Order? order,
  }) {
    final String $url = 'answers/${ids}';
    final Map<String, dynamic> $params = <String, dynamic>{
      'fromdate': fromDate,
      'todate': toDate,
      'page': page,
      'pagesize': pageSize,
      'sort': sort,
      'order': order,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ItemList<Answer>, Answer>($request);
  }

  @override
  Future<Response<ItemList<Site>>> getSites({
    int page = 1,
    int pageSize = 100,
  }) {
    final String $url = 'sites';
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'pagesize': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ItemList<Site>, Site>($request);
  }
}
