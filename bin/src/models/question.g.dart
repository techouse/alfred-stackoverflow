// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

mixin _$QuestionAutoequalMixin on EquatableMixin {
  @override
  List<Object?> get props =>
      _$QuestionAutoequal(this as Question)._autoequalProps;
}

extension _$QuestionAutoequal on Question {
  List<Object?> get _autoequalProps => [
        id,
        title,
        link,
        isAnswered,
        acceptedAnswerId,
        viewCount,
        answerCount,
        score,
        tags,
        lastActivityDate,
        lastEditDate,
        creationDate,
        contentLicense
      ];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['question_id'] as int,
      title: json['title'] as String,
      link: Uri.parse(json['link'] as String),
      isAnswered: json['is_answered'] as bool,
      acceptedAnswerId: json['accepted_answer_id'] as int?,
      viewCount: json['view_count'] as int,
      answerCount: json['answer_count'] as int,
      score: json['score'] as int,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      lastActivityDate: DateTimeUnixTimestampConverter.instance
          .fromJson(json['last_activity_date'] as int?),
      lastEditDate: DateTimeUnixTimestampConverter.instance
          .fromJson(json['last_edit_date'] as int?),
      creationDate: DateTimeUnixTimestampConverter.instance
          .fromJson(json['creation_date'] as int?),
      contentLicense: json['content_license'] as String?,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question_id': instance.id,
      'title': instance.title,
      'link': instance.link.toString(),
      'is_answered': instance.isAnswered,
      'accepted_answer_id': instance.acceptedAnswerId,
      'view_count': instance.viewCount,
      'answer_count': instance.answerCount,
      'score': instance.score,
      'tags': instance.tags,
      'last_activity_date': DateTimeUnixTimestampConverter.instance
          .toJson(instance.lastActivityDate),
      'last_edit_date':
          DateTimeUnixTimestampConverter.instance.toJson(instance.lastEditDate),
      'creation_date':
          DateTimeUnixTimestampConverter.instance.toJson(instance.creationDate),
      'content_license': instance.contentLicense,
    };
