import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/core/model/site_info_card_entity.dart';

SiteInfoCardEntity $SiteInfoCardEntityFromJson(Map<String, dynamic> json) {
  final SiteInfoCardEntity siteInfoCardEntity = SiteInfoCardEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    siteInfoCardEntity.id = id;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    siteInfoCardEntity.icon = icon;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    siteInfoCardEntity.value = value;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    siteInfoCardEntity.unit = unit;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    siteInfoCardEntity.title = title;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    siteInfoCardEntity.image = image;
  }
  return siteInfoCardEntity;
}

Map<String, dynamic> $SiteInfoCardEntityToJson(SiteInfoCardEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['icon'] = entity.icon;
  data['value'] = entity.value;
  data['unit'] = entity.unit;
  data['title'] = entity.title;
  data['image'] = entity.image;
  return data;
}

extension SiteInfoCardEntityExtension on SiteInfoCardEntity {
  SiteInfoCardEntity copyWith({
    int? id,
    String? icon,
    String? value,
    String? unit,
    String? title,
    String? image,
  }) {
    return SiteInfoCardEntity()
      ..id = id ?? this.id
      ..icon = icon ?? this.icon
      ..value = value ?? this.value
      ..unit = unit ?? this.unit
      ..title = title ?? this.title
      ..image = image ?? this.image;
  }
}