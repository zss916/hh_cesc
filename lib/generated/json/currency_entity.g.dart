import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/currency_entity.dart';

CurrencyEntity $CurrencyEntityFromJson(Map<String, dynamic> json) {
  final CurrencyEntity currencyEntity = CurrencyEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    currencyEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    currencyEntity.name = name;
  }
  final String? symbol = jsonConvert.convert<String>(json['symbol']);
  if (symbol != null) {
    currencyEntity.symbol = symbol;
  }
  final String? enName = jsonConvert.convert<String>(json['enName']);
  if (enName != null) {
    currencyEntity.enName = enName;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    currencyEntity.code = code;
  }
  return currencyEntity;
}

Map<String, dynamic> $CurrencyEntityToJson(CurrencyEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['symbol'] = entity.symbol;
  data['enName'] = entity.enName;
  data['code'] = entity.code;
  return data;
}

extension CurrencyEntityExtension on CurrencyEntity {
  CurrencyEntity copyWith({
    double? id,
    String? name,
    String? symbol,
    String? enName,
    String? code,
  }) {
    return CurrencyEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..symbol = symbol ?? this.symbol
      ..enName = enName ?? this.enName
      ..code = code ?? this.code;
  }
}