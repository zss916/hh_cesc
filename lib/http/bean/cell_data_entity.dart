import 'dart:convert';

import 'package:cescpro/generated/json/base/json_field.dart';
import 'package:cescpro/generated/json/cell_data_entity.g.dart';

export 'package:cescpro/generated/json/cell_data_entity.g.dart';

@JsonSerializable()
class CellDataEntity {
  int? arrNo;
  int? devNo;
  int? packNo;
  int? offest;
  List<CellDataCells>? cells;

  CellDataEntity();

  factory CellDataEntity.fromJson(Map<String, dynamic> json) =>
      $CellDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $CellDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CellDataCells {
  int? no;
  int? soc;
  double? voltage;
  double? temp;

  CellDataCells();

  factory CellDataCells.fromJson(Map<String, dynamic> json) =>
      $CellDataCellsFromJson(json);

  Map<String, dynamic> toJson() => $CellDataCellsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
