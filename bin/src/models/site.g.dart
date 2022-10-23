// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

mixin _$SiteAutoequalMixin on EquatableMixin {
  @override
  List<Object?> get props => _$SiteAutoequal(this as Site)._autoequalProps;
}

extension _$SiteAutoequal on Site {
  List<Object?> get _autoequalProps => [
        id,
        siteType,
        name,
        logoUrl,
        siteUrl,
        audience,
        iconUrl,
        faviconUrl,
        highResolutionIconUrl,
        siteState,
        openBetaDate,
        launchDate,
        markdownExtensions,
        relatedSites,
        styling,
        aliases
      ];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Site _$SiteFromJson(Map<String, dynamic> json) => Site(
      id: json['api_site_parameter'] as String,
      siteType: json['site_type'] as String,
      name: json['name'] as String,
      logoUrl: Uri.parse(json['logo_url'] as String),
      siteUrl: Uri.parse(json['site_url'] as String),
      audience: json['audience'] as String,
      iconUrl: Uri.parse(json['icon_url'] as String),
      faviconUrl: Uri.parse(json['favicon_url'] as String),
      highResolutionIconUrl:
          Uri.parse(json['high_resolution_icon_url'] as String),
      siteState: json['site_state'] as String,
      openBetaDate: DateTimeUnixTimestampConverter.instance
          .fromJson(json['open_beta_date'] as int?),
      launchDate: DateTimeUnixTimestampConverter.instance
          .fromJson(json['launch_date'] as int?),
      markdownExtensions: (json['markdown_extensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      relatedSites: (json['related_sites'] as List<dynamic>?)
          ?.map((e) => RelatedSite.fromJson(e as Map<String, dynamic>))
          .toList(),
      styling: (json['styling'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      aliases: (json['aliases'] as List<dynamic>?)
          ?.map((e) => Uri.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$SiteToJson(Site instance) => <String, dynamic>{
      'api_site_parameter': instance.id,
      'site_type': instance.siteType,
      'name': instance.name,
      'logo_url': instance.logoUrl.toString(),
      'site_url': instance.siteUrl.toString(),
      'audience': instance.audience,
      'icon_url': instance.iconUrl.toString(),
      'favicon_url': instance.faviconUrl.toString(),
      'high_resolution_icon_url': instance.highResolutionIconUrl.toString(),
      'site_state': instance.siteState,
      'open_beta_date':
          DateTimeUnixTimestampConverter.instance.toJson(instance.openBetaDate),
      'launch_date':
          DateTimeUnixTimestampConverter.instance.toJson(instance.launchDate),
      'markdown_extensions': instance.markdownExtensions,
      'related_sites': instance.relatedSites?.map((e) => e.toJson()).toList(),
      'styling': instance.styling,
      'aliases': instance.aliases?.map((e) => e.toString()).toList(),
    };
