// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

mixin _$UserAutoequalMixin on EquatableMixin {
  @override
  List<Object?> get props => _$UserAutoequal(this as User)._autoequalProps;
}

extension _$UserAutoequal on User {
  List<Object?> get _autoequalProps =>
      [id, accountId, name, userType, reputation, profileImage, link];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['user_id'] as int?,
      accountId: json['account_id'] as int?,
      name: json['display_name'] as String?,
      userType: json['user_type'] as String?,
      reputation: json['reputation'] as int?,
      profileImage: json['profile_image'] == null
          ? null
          : Uri.parse(json['profile_image'] as String),
      link: json['link'] == null ? null : Uri.parse(json['link'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.id,
      'account_id': instance.accountId,
      'display_name': instance.name,
      'user_type': instance.userType,
      'reputation': instance.reputation,
      'profile_image': instance.profileImage?.toString(),
      'link': instance.link?.toString(),
    };
