import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/site_topology_entity.g.dart';

export 'package:cescpro/generated/json/site_topology_entity.g.dart';

@JsonSerializable()
class SiteTopologyEntity {
  SiteTopologyPv? pv; //光伏
  SiteTopologyStorage? storage;
  SiteTopologyLoad? load; //负载
  SiteTopologyPcs? pcs;
  SiteTopologyGrid? grid; //电网
  List<SiteTopologyLine>? line;
  int? siteId;
  int? did; //设备id
  bool? hasPv; //是否有光伏

  SiteTopologyEntity();

  factory SiteTopologyEntity.fromJson(Map<String, dynamic> json) =>
      $SiteTopologyEntityFromJson(json);

  Map<String, dynamic> toJson() => $SiteTopologyEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SiteTopologyPv {
  double? power;
  String? code;
  double? soc;

  SiteTopologyPv();

  factory SiteTopologyPv.fromJson(Map<String, dynamic> json) =>
      $SiteTopologyPvFromJson(json);

  Map<String, dynamic> toJson() => $SiteTopologyPvToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SiteTopologyStorage {
  double? power;
  String? code;
  double? soc;

  SiteTopologyStorage();

  factory SiteTopologyStorage.fromJson(Map<String, dynamic> json) =>
      $SiteTopologyStorageFromJson(json);

  Map<String, dynamic> toJson() => $SiteTopologyStorageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SiteTopologyLoad {
  double? power;
  String? code;
  double? soc;

  SiteTopologyLoad();

  factory SiteTopologyLoad.fromJson(Map<String, dynamic> json) =>
      $SiteTopologyLoadFromJson(json);

  Map<String, dynamic> toJson() => $SiteTopologyLoadToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SiteTopologyPcs {
  double? power;
  String? code;
  double? soc;

  SiteTopologyPcs();

  factory SiteTopologyPcs.fromJson(Map<String, dynamic> json) =>
      $SiteTopologyPcsFromJson(json);

  Map<String, dynamic> toJson() => $SiteTopologyPcsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SiteTopologyGrid {
  double? power;
  String? code;
  double? soc;

  SiteTopologyGrid();

  factory SiteTopologyGrid.fromJson(Map<String, dynamic> json) =>
      $SiteTopologyGridFromJson(json);

  Map<String, dynamic> toJson() => $SiteTopologyGridToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SiteTopologyLine {
  String? from;
  String? to;

  SiteTopologyLine();

  factory SiteTopologyLine.fromJson(Map<String, dynamic> json) =>
      $SiteTopologyLineFromJson(json);

  Map<String, dynamic> toJson() => $SiteTopologyLineToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
