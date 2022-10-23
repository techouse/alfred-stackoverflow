import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@autoequalMixin
@JsonSerializable()
class User with EquatableMixin, _$UserAutoequalMixin {
  const User({
    this.id,
    this.accountId,
    this.name,
    this.userType,
    this.reputation,
    this.profileImage,
    this.link,
  });

  @JsonKey(name: 'user_id')
  final int? id;
  final int? accountId;
  @JsonKey(name: 'display_name')
  final String? name;
  final String? userType;
  final int? reputation;
  final Uri? profileImage;
  final Uri? link;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
