import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/site_topology_entity.dart';

SiteTopologyEntity $SiteTopologyEntityFromJson(Map<String, dynamic> json) {
  final SiteTopologyEntity siteTopologyEntity = SiteTopologyEntity();
  final SiteTopologyPv? pv = jsonConvert.convert<SiteTopologyPv>(json['pv']);
  if (pv != null) {
    siteTopologyEntity.pv = pv;
  }
  final SiteTopologyStorage? storage = jsonConvert.convert<SiteTopologyStorage>(
      json['storage']);
  if (storage != null) {
    siteTopologyEntity.storage = storage;
  }
  final SiteTopologyLoad? load = jsonConvert.convert<SiteTopologyLoad>(
      json['load']);
  if (load != null) {
    siteTopologyEntity.load = load;
  }
  final SiteTopologyPcs? pcs = jsonConvert.convert<SiteTopologyPcs>(
      json['pcs']);
  if (pcs != null) {
    siteTopologyEntity.pcs = pcs;
  }
  final SiteTopologyGrid? grid = jsonConvert.convert<SiteTopologyGrid>(
      json['grid']);
  if (grid != null) {
    siteTopologyEntity.grid = grid;
  }
  final List<SiteTopologyLine>? line = (json['line'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<SiteTopologyLine>(e) as SiteTopologyLine)
      .toList();
  if (line != null) {
    siteTopologyEntity.line = line;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    siteTopologyEntity.siteId = siteId;
  }
  final int? did = jsonConvert.convert<int>(json['did']);
  if (did != null) {
    siteTopologyEntity.did = did;
  }
  final bool? hasPv = jsonConvert.convert<bool>(json['hasPv']);
  if (hasPv != null) {
    siteTopologyEntity.hasPv = hasPv;
  }
  return siteTopologyEntity;
}

Map<String, dynamic> $SiteTopologyEntityToJson(SiteTopologyEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pv'] = entity.pv?.toJson();
  data['storage'] = entity.storage?.toJson();
  data['load'] = entity.load?.toJson();
  data['pcs'] = entity.pcs?.toJson();
  data['grid'] = entity.grid?.toJson();
  data['line'] = entity.line?.map((v) => v.toJson()).toList();
  data['siteId'] = entity.siteId;
  data['did'] = entity.did;
  data['hasPv'] = entity.hasPv;
  return data;
}

extension SiteTopologyEntityExtension on SiteTopologyEntity {
  SiteTopologyEntity copyWith({
    SiteTopologyPv? pv,
    SiteTopologyStorage? storage,
    SiteTopologyLoad? load,
    SiteTopologyPcs? pcs,
    SiteTopologyGrid? grid,
    List<SiteTopologyLine>? line,
    int? siteId,
    int? did,
    bool? hasPv,
  }) {
    return SiteTopologyEntity()
      ..pv = pv ?? this.pv
      ..storage = storage ?? this.storage
      ..load = load ?? this.load
      ..pcs = pcs ?? this.pcs
      ..grid = grid ?? this.grid
      ..line = line ?? this.line
      ..siteId = siteId ?? this.siteId
      ..did = did ?? this.did
      ..hasPv = hasPv ?? this.hasPv;
  }
}

SiteTopologyPv $SiteTopologyPvFromJson(Map<String, dynamic> json) {
  final SiteTopologyPv siteTopologyPv = SiteTopologyPv();
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    siteTopologyPv.power = power;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    siteTopologyPv.code = code;
  }
  final double? soc = jsonConvert.convert<double>(json['soc']);
  if (soc != null) {
    siteTopologyPv.soc = soc;
  }
  return siteTopologyPv;
}

Map<String, dynamic> $SiteTopologyPvToJson(SiteTopologyPv entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['power'] = entity.power;
  data['code'] = entity.code;
  data['soc'] = entity.soc;
  return data;
}

extension SiteTopologyPvExtension on SiteTopologyPv {
  SiteTopologyPv copyWith({
    double? power,
    String? code,
    double? soc,
  }) {
    return SiteTopologyPv()
      ..power = power ?? this.power
      ..code = code ?? this.code
      ..soc = soc ?? this.soc;
  }
}

SiteTopologyStorage $SiteTopologyStorageFromJson(Map<String, dynamic> json) {
  final SiteTopologyStorage siteTopologyStorage = SiteTopologyStorage();
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    siteTopologyStorage.power = power;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    siteTopologyStorage.code = code;
  }
  final double? soc = jsonConvert.convert<double>(json['soc']);
  if (soc != null) {
    siteTopologyStorage.soc = soc;
  }
  return siteTopologyStorage;
}

Map<String, dynamic> $SiteTopologyStorageToJson(SiteTopologyStorage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['power'] = entity.power;
  data['code'] = entity.code;
  data['soc'] = entity.soc;
  return data;
}

extension SiteTopologyStorageExtension on SiteTopologyStorage {
  SiteTopologyStorage copyWith({
    double? power,
    String? code,
    double? soc,
  }) {
    return SiteTopologyStorage()
      ..power = power ?? this.power
      ..code = code ?? this.code
      ..soc = soc ?? this.soc;
  }
}

SiteTopologyLoad $SiteTopologyLoadFromJson(Map<String, dynamic> json) {
  final SiteTopologyLoad siteTopologyLoad = SiteTopologyLoad();
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    siteTopologyLoad.power = power;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    siteTopologyLoad.code = code;
  }
  final double? soc = jsonConvert.convert<double>(json['soc']);
  if (soc != null) {
    siteTopologyLoad.soc = soc;
  }
  return siteTopologyLoad;
}

Map<String, dynamic> $SiteTopologyLoadToJson(SiteTopologyLoad entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['power'] = entity.power;
  data['code'] = entity.code;
  data['soc'] = entity.soc;
  return data;
}

extension SiteTopologyLoadExtension on SiteTopologyLoad {
  SiteTopologyLoad copyWith({
    double? power,
    String? code,
    double? soc,
  }) {
    return SiteTopologyLoad()
      ..power = power ?? this.power
      ..code = code ?? this.code
      ..soc = soc ?? this.soc;
  }
}

SiteTopologyPcs $SiteTopologyPcsFromJson(Map<String, dynamic> json) {
  final SiteTopologyPcs siteTopologyPcs = SiteTopologyPcs();
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    siteTopologyPcs.power = power;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    siteTopologyPcs.code = code;
  }
  final double? soc = jsonConvert.convert<double>(json['soc']);
  if (soc != null) {
    siteTopologyPcs.soc = soc;
  }
  return siteTopologyPcs;
}

Map<String, dynamic> $SiteTopologyPcsToJson(SiteTopologyPcs entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['power'] = entity.power;
  data['code'] = entity.code;
  data['soc'] = entity.soc;
  return data;
}

extension SiteTopologyPcsExtension on SiteTopologyPcs {
  SiteTopologyPcs copyWith({
    double? power,
    String? code,
    double? soc,
  }) {
    return SiteTopologyPcs()
      ..power = power ?? this.power
      ..code = code ?? this.code
      ..soc = soc ?? this.soc;
  }
}

SiteTopologyGrid $SiteTopologyGridFromJson(Map<String, dynamic> json) {
  final SiteTopologyGrid siteTopologyGrid = SiteTopologyGrid();
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    siteTopologyGrid.power = power;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    siteTopologyGrid.code = code;
  }
  final double? soc = jsonConvert.convert<double>(json['soc']);
  if (soc != null) {
    siteTopologyGrid.soc = soc;
  }
  return siteTopologyGrid;
}

Map<String, dynamic> $SiteTopologyGridToJson(SiteTopologyGrid entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['power'] = entity.power;
  data['code'] = entity.code;
  data['soc'] = entity.soc;
  return data;
}

extension SiteTopologyGridExtension on SiteTopologyGrid {
  SiteTopologyGrid copyWith({
    double? power,
    String? code,
    double? soc,
  }) {
    return SiteTopologyGrid()
      ..power = power ?? this.power
      ..code = code ?? this.code
      ..soc = soc ?? this.soc;
  }
}

SiteTopologyLine $SiteTopologyLineFromJson(Map<String, dynamic> json) {
  final SiteTopologyLine siteTopologyLine = SiteTopologyLine();
  final String? from = jsonConvert.convert<String>(json['from']);
  if (from != null) {
    siteTopologyLine.from = from;
  }
  final String? to = jsonConvert.convert<String>(json['to']);
  if (to != null) {
    siteTopologyLine.to = to;
  }
  return siteTopologyLine;
}

Map<String, dynamic> $SiteTopologyLineToJson(SiteTopologyLine entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['from'] = entity.from;
  data['to'] = entity.to;
  return data;
}

extension SiteTopologyLineExtension on SiteTopologyLine {
  SiteTopologyLine copyWith({
    String? from,
    String? to,
  }) {
    return SiteTopologyLine()
      ..from = from ?? this.from
      ..to = to ?? this.to;
  }
}