import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../api/datetime_unix_timestamp_converter.dart';

part 'question.g.dart';

@autoequalMixin
@JsonSerializable()
@DateTimeUnixTimestampConverter.instance
class Question with EquatableMixin, _$QuestionAutoequalMixin {
  const Question({
    required this.id,
    required this.title,
    required this.link,
    required this.isAnswered,
    this.acceptedAnswerId,
    required this.viewCount,
    required this.answerCount,
    required this.score,
    required this.tags,
    this.lastActivityDate,
    this.lastEditDate,
    this.creationDate,
    this.contentLicense,
  });

  @JsonKey(name: 'question_id')
  final int id;
  final String title;
  final Uri link;
  final bool isAnswered;
  final int? acceptedAnswerId;
  final int viewCount;
  final int answerCount;
  final int score;
  final List<String> tags;
  final DateTime? lastActivityDate;
  final DateTime? lastEditDate;
  final DateTime? creationDate;
  final String? contentLicense;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
