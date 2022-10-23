// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_site.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

mixin _$RelatedSiteAutoequalMixin on EquatableMixin {
  @override
  List<Object?> get props =>
      _$RelatedSiteAutoequal(this as RelatedSite)._autoequalProps;
}

extension _$RelatedSiteAutoequal on RelatedSite {
  List<Object?> get _autoequalProps => [id, name, siteUrl, relation];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedSite _$RelatedSiteFromJson(Map<String, dynamic> json) => RelatedSite(
      id: json['api_site_parameter'] as String?,
      name: json['name'] as String,
      siteUrl: Uri.parse(json['site_url'] as String),
      relation: json['relation'] as String,
    );

Map<String, dynamic> _$RelatedSiteToJson(RelatedSite instance) =>
    <String, dynamic>{
      'api_site_parameter': instance.id,
      'name': instance.name,
      'site_url': instance.siteUrl.toString(),
      'relation': instance.relation,
    };
