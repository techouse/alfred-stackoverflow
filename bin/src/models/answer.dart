import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../api/datetime_unix_timestamp_converter.dart';
import 'user.dart';

part 'answer.g.dart';

@autoequalMixin
@JsonSerializable(explicitToJson: true)
@DateTimeUnixTimestampConverter.instance
class Answer with EquatableMixin, _$AnswerAutoequalMixin {
  const Answer({
    required this.id,
    required this.isAccepted,
    required this.owner,
    required this.score,
    required this.questionId,
    this.lastActivityDate,
    this.lastEditDate,
    this.creationDate,
    this.contentLicense,
  });

  @JsonKey(name: 'answer_id')
  final int id;
  final bool isAccepted;
  final User owner;
  final int score;
  final int questionId;
  final DateTime? lastActivityDate;
  final DateTime? lastEditDate;
  final DateTime? creationDate;
  final String? contentLicense;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
