import 'package:json_annotation/json_annotation.dart';

import '../extensions/unix_date_time_extension.dart';

class DateTimeUnixTimestampConverter implements JsonConverter<DateTime?, int?> {
  const DateTimeUnixTimestampConverter();

  static const instance = DateTimeUnixTimestampConverter();

  @override
  DateTime? fromJson(int? unixTimestamp) => unixTimestamp != null
      ? DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000, isUtc: true)
      : null;

  @override
  int? toJson(DateTime? dateTime) => dateTime?.secondsSinceEpoch;
}
