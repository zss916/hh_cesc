import 'package:cescpro/generated/json/base/json_convert_content.dart';
import 'package:cescpro/http/bean/strategy_protected_entity.dart';

StrategyProtectedEntity $StrategyProtectedEntityFromJson(
  Map<String, dynamic> json,
) {
  final StrategyProtectedEntity strategyProtectedEntity =
      StrategyProtectedEntity();
  final bool? volEnabled = jsonConvert.convert<bool>(json['volEnabled']);
  if (volEnabled != null) {
    strategyProtectedEntity.volEnabled = volEnabled;
  }
  final bool? socEnabled = jsonConvert.convert<bool>(json['socEnabled']);
  if (socEnabled != null) {
    strategyProtectedEntity.socEnabled = socEnabled;
  }
  final bool? temEnabled = jsonConvert.convert<bool>(json['temEnabled']);
  if (temEnabled != null) {
    strategyProtectedEntity.temEnabled = temEnabled;
  }
  final bool? backEnabled = jsonConvert.convert<bool>(json['backEnabled']);
  if (backEnabled != null) {
    strategyProtectedEntity.backEnabled = backEnabled;
  }
  final bool? needEnabled = jsonConvert.convert<bool>(json['needEnabled']);
  if (needEnabled != null) {
    strategyProtectedEntity.needEnabled = needEnabled;
  }
  return strategyProtectedEntity;
}

Map<String, dynamic> $StrategyProtectedEntityToJson(
  StrategyProtectedEntity entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['volEnabled'] = entity.volEnabled;
  data['socEnabled'] = entity.socEnabled;
  data['temEnabled'] = entity.temEnabled;
  data['backEnabled'] = entity.backEnabled;
  data['needEnabled'] = entity.needEnabled;
  return data;
}

extension StrategyProtectedEntityExtension on StrategyProtectedEntity {
  StrategyProtectedEntity copyWith({
    bool? volEnabled,
    bool? socEnabled,
    bool? temEnabled,
    bool? backEnabled,
    bool? needEnabled,
  }) {
    return StrategyProtectedEntity()
      ..volEnabled = volEnabled ?? this.volEnabled
      ..socEnabled = socEnabled ?? this.socEnabled
      ..temEnabled = temEnabled ?? this.temEnabled
      ..backEnabled = backEnabled ?? this.backEnabled
      ..needEnabled = needEnabled ?? this.needEnabled;
  }
}
