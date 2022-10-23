import 'package:json_annotation/json_annotation.dart';

enum Sort {
  @JsonValue('activity')
  activity, // last_activity_date
  @JsonValue('creation')
  creation, // creation_date
  @JsonValue('votes')
  votes, // score
  @JsonValue('relevance')
  relevance; // matches the relevance tab on the site itself

  @override
  String toString() => name;
}
