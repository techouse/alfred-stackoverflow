import 'dart:async' show FutureOr;

import 'package:chopper/chopper.dart';

import '../models/item_list.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  const JsonSerializableConverter(this.factories);

  final Map<Type, JsonFactory> factories;

  T? _decodeMap<T>(Map<String, dynamic> values) {
    final JsonFactory? jsonFactory = factories[T];

    return jsonFactory != null && jsonFactory is JsonFactory<T>
        ? jsonFactory(values)
        : null;
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();

  dynamic _decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity as List);
    }

    if (entity is Map) {
      if (entity.containsKey('items') && entity['items'] is Iterable) {
        return ItemList<T>(
          _decodeList<T>(entity['items'] as List),
          hasMore: entity['has_more'],
          quotaMax: entity['quota_max'],
          quotaRemaining: entity['quota_remaining'],
        );
      }

      if (entity.containsKey('item')) {
        return _decodeMap<T>(entity['item']);
      }

      return _decodeMap<T>(entity as Map<String, dynamic>);
    }

    return entity;
  }

  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
    Response response,
  ) async {
    // use [JsonConverter] to decode json
    final Response jsonRes = await super.convertResponse(response);

    return jsonRes.copyWith<ResultType>(body: _decode<Item>(jsonRes.body));
  }
}
