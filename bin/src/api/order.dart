import 'package:json_annotation/json_annotation.dart';

enum Order {
  @JsonValue('asc')
  asc,
  @JsonValue('desc')
  desc;

  @override
  String toString() => name;
}
