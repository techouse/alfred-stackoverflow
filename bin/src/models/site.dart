import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../api/datetime_unix_timestamp_converter.dart';
import 'related_site.dart';

part 'site.g.dart';

@autoequalMixin
@JsonSerializable(explicitToJson: true)
@DateTimeUnixTimestampConverter.instance
class Site with EquatableMixin, _$SiteAutoequalMixin {
  const Site({
    required this.id,
    required this.siteType,
    required this.name,
    required this.logoUrl,
    required this.siteUrl,
    required this.audience,
    required this.iconUrl,
    required this.faviconUrl,
    required this.highResolutionIconUrl,
    required this.siteState,
    this.openBetaDate,
    this.launchDate,
    this.markdownExtensions,
    this.relatedSites,
    this.styling,
    this.aliases,
  });

  @JsonKey(name: 'api_site_parameter')
  final String id;
  final String siteType;
  final String name;
  final Uri logoUrl;
  final Uri siteUrl;
  final String audience;
  final Uri iconUrl;
  final Uri faviconUrl;
  final Uri highResolutionIconUrl;
  final String siteState;
  final DateTime? openBetaDate;
  final DateTime? launchDate;
  final List<String>? markdownExtensions;
  final List<RelatedSite>? relatedSites;
  final Map<String, String>? styling;
  final List<Uri>? aliases;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);

  Map<String, dynamic> toJson() => _$SiteToJson(this);
}
