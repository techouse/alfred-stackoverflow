import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'related_site.g.dart';

@autoequalMixin
@JsonSerializable()
class RelatedSite with EquatableMixin, _$RelatedSiteAutoequalMixin {
  const RelatedSite({
    this.id,
    required this.name,
    required this.siteUrl,
    required this.relation,
  });

  @JsonKey(name: 'api_site_parameter')
  final String? id;
  final String name;
  final Uri siteUrl;
  final String relation;

  factory RelatedSite.fromJson(Map<String, dynamic> json) =>
      _$RelatedSiteFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedSiteToJson(this);
}
