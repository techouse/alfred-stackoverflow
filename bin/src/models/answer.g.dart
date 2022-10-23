// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

mixin _$AnswerAutoequalMixin on EquatableMixin {
  @override
  List<Object?> get props => _$AnswerAutoequal(this as Answer)._autoequalProps;
}

extension _$AnswerAutoequal on Answer {
  List<Object?> get _autoequalProps => [
        id,
        isAccepted,
        owner,
        score,
        questionId,
        lastActivityDate,
        lastEditDate,
        creationDate,
        contentLicense
      ];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      id: json['answer_id'] as int,
      isAccepted: json['is_accepted'] as bool,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      score: json['score'] as int,
      questionId: json['question_id'] as int,
      lastActivityDate: DateTimeUnixTimestampConverter.instance
          .fromJson(json['last_activity_date'] as int?),
      lastEditDate: DateTimeUnixTimestampConverter.instance
          .fromJson(json['last_edit_date'] as int?),
      creationDate: DateTimeUnixTimestampConverter.instance
          .fromJson(json['creation_date'] as int?),
      contentLicense: json['content_license'] as String?,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'answer_id': instance.id,
      'is_accepted': instance.isAccepted,
      'owner': instance.owner.toJson(),
      'score': instance.score,
      'question_id': instance.questionId,
      'last_activity_date': DateTimeUnixTimestampConverter.instance
          .toJson(instance.lastActivityDate),
      'last_edit_date':
          DateTimeUnixTimestampConverter.instance.toJson(instance.lastEditDate),
      'creation_date':
          DateTimeUnixTimestampConverter.instance.toJson(instance.creationDate),
      'content_license': instance.contentLicense,
    };
