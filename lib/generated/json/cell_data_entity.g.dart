import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/cell_data_entity.dart';
import 'dart:math';


CellDataEntity $CellDataEntityFromJson(Map<String, dynamic> json) {
  final CellDataEntity cellDataEntity = CellDataEntity();
  final int? arrNo = jsonConvert.convert<int>(json['arrNo']);
  if (arrNo != null) {
    cellDataEntity.arrNo = arrNo;
  }
  final int? devNo = jsonConvert.convert<int>(json['devNo']);
  if (devNo != null) {
    cellDataEntity.devNo = devNo;
  }
  final int? packNo = jsonConvert.convert<int>(json['packNo']);
  if (packNo != null) {
    cellDataEntity.packNo = packNo;
  }
  final int? offest = jsonConvert.convert<int>(json['offest']);
  if (offest != null) {
    cellDataEntity.offest = offest;
  }
  final List<CellDataCells>? cells = (json['cells'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CellDataCells>(e) as CellDataCells)
      .toList();
  if (cells != null) {
    cellDataEntity.cells = cells;
  }
  return cellDataEntity;
}

Map<String, dynamic> $CellDataEntityToJson(CellDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['arrNo'] = entity.arrNo;
  data['devNo'] = entity.devNo;
  data['packNo'] = entity.packNo;
  data['offest'] = entity.offest;
  data['cells'] = entity.cells?.map((v) => v.toJson()).toList();
  return data;
}

extension CellDataEntityExtension on CellDataEntity {
  CellDataEntity copyWith({
    int? arrNo,
    int? devNo,
    int? packNo,
    int? offest,
    List<CellDataCells>? cells,
  }) {
    return CellDataEntity()
      ..arrNo = arrNo ?? this.arrNo
      ..devNo = devNo ?? this.devNo
      ..packNo = packNo ?? this.packNo
      ..offest = offest ?? this.offest
      ..cells = cells ?? this.cells;
  }
}

CellDataCells $CellDataCellsFromJson(Map<String, dynamic> json) {
  final CellDataCells cellDataCells = CellDataCells();
  final int? no = jsonConvert.convert<int>(json['no']);
  if (no != null) {
    cellDataCells.no = no;
  }
  final int? soc = jsonConvert.convert<int>(json['soc']);
  if (soc != null) {
    cellDataCells.soc = soc;
  }
  final double? voltage = jsonConvert.convert<double>(json['voltage']);
  if (voltage != null) {
    cellDataCells.voltage = voltage;
  }
  final double? temp = jsonConvert.convert<double>(json['temp']);
  if (temp != null) {
    cellDataCells.temp = temp;
  }
  return cellDataCells;
}

Map<String, dynamic> $CellDataCellsToJson(CellDataCells entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['no'] = entity.no;
  data['soc'] = entity.soc;
  data['voltage'] = entity.voltage;
  data['temp'] = entity.temp;
  return data;
}

extension CellDataCellsExtension on CellDataCells {
  CellDataCells copyWith({
    int? no,
    int? soc,
    double? voltage,
    double? temp,
  }) {
    return CellDataCells()
      ..no = no ?? this.no
      ..soc = soc ?? this.soc
      ..voltage = voltage ?? this.voltage
      ..temp = temp ?? this.temp;
  }
}