// ignore_for_file: long-parameter-list

import 'package:chopper/chopper.dart';

import '../api/order.dart';
import '../api/sort.dart';
import '../extensions/unix_date_time_extension.dart';
import '../models/answer.dart';
import '../models/question.dart';
import '../models/item_list.dart';
import '../models/site.dart';

part 'stack_exchange_service.chopper.dart';

@ChopperApi()
abstract class StackExchangeService extends ChopperService {
  static StackExchangeService create([ChopperClient? client]) =>
      _$StackExchangeService(client);

  Future<Response<ItemList<Question>>> search({
    // the StackExchange site to search
    required String siteId,
    // a free form text parameter, will match all question properties based on an undocumented algorithm.
    required String query,
    // true to return only questions with accepted answers, false to return only those without. Omit to elide constraint.
    bool? accepted,
    // the minimum number of answers returned questions must have.
    int? answers,
    // text which must appear in returned questions' bodies.
    String? body,
    // true to return only closed questions, false to return only open ones. Omit to elide constraint.
    bool? closed,
    // true to return only questions migrated away from a site, false to return only those not. Omit to elide constraint.
    bool? migrated,
    // true to return only questions with post notices, false to return only those without. Omit to elide constraint.
    bool? notice,
    // a semicolon delimited list of tags, none of which will be present on returned questions.
    Set<String>? notTagged,
    // a semicolon delimited list of tags, of which at least one will be present on all returned questions.
    Set<String>? tagged,
    // text which must appear in returned questions' titles.
    String? title,
    // the id of the user who must own the questions returned.
    int? ownerId,
    // a url which must be contained in a post, may include a wildcard.
    Uri? url,
    // the minimum number of views returned questions must have.
    int? views,
    // true to return only community wiki questions, false to return only non-community wiki ones. Omit to elide constraint.
    bool? wiki,
    DateTime? fromDate,
    DateTime? toDate,
    int page = 1,
    int pageSize = 100,
    Sort sort = Sort.relevance,
    Order order = Order.desc,
  }) =>
      _search(
        siteId: siteId,
        query: query,
        accepted: accepted,
        answers: answers,
        body: body,
        closed: closed,
        migrated: migrated,
        notice: notice,
        notTagged: notTagged?.join(';'),
        tagged: tagged?.join(';'),
        title: title,
        ownerId: ownerId,
        url: url,
        views: views,
        wiki: wiki,
        fromDate: fromDate?.secondsSinceEpoch,
        toDate: toDate?.secondsSinceEpoch,
        page: page,
        pageSize: pageSize,
        sort: sort,
        order: order,
      );

  @Get(path: 'search/advanced')
  Future<Response<ItemList<Question>>> _search({
    @Query('site') required String siteId,
    @Query('q') required String query,
    @Query('accepted') bool? accepted,
    @Query('answers') int? answers,
    @Query('body') String? body,
    @Query('closed') bool? closed,
    @Query('migrated') bool? migrated,
    @Query('notice') bool? notice,
    @Query('nottagged') String? notTagged,
    @Query('tagged') String? tagged,
    @Query('title') String? title,
    @Query('user') int? ownerId,
    @Query('url') Uri? url,
    @Query('views') int? views,
    @Query('wiki') bool? wiki,
    @Query('fromdate') int? fromDate,
    @Query('todate') int? toDate,
    @Query('page') int page = 1,
    @Query('pagesize') int pageSize = 100,
    @Query('sort') Sort? sort,
    @Query('order') Order? order,
  });

  Future<Response<ItemList<Answer>>> getAnswers({
    // can contain up to 100 ids
    required Set<int> ids,
    DateTime? fromDate,
    DateTime? toDate,
    int page = 1,
    int pageSize = 100,
    Sort? sort,
    Order? order,
  }) =>
      _getAnswers(
        ids: ids.map((int id) => id.toString()).join(';'),
        fromDate: fromDate?.secondsSinceEpoch,
        toDate: toDate?.secondsSinceEpoch,
        page: page,
        pageSize: pageSize,
        sort: sort,
        order: order,
      );

  @Get(path: 'answers/{ids}')
  Future<Response<ItemList<Answer>>> _getAnswers({
    @Path('ids') required String ids,
    @Query('fromdate') int? fromDate,
    @Query('todate') int? toDate,
    @Query('page') int page = 1,
    @Query('pagesize') int pageSize = 100,
    @Query('sort') Sort? sort,
    @Query('order') Order? order,
  });

  @Get(path: 'sites')
  Future<Response<ItemList<Site>>> getSites({
    @Query('page') int page = 1,
    @Query('pagesize') int pageSize = 100,
  });
}
