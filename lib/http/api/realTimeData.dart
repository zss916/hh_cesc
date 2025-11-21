import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/cell_data_entity.dart';
import 'package:cescpro/http/bean/com_card_vo_entity.dart';
import 'package:cescpro/http/bean/com_type_list_entity.dart';
import 'package:cescpro/http/bean/power_entity.dart';
import 'package:cescpro/http/bean/soc_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';
import 'package:flutter/foundation.dart';

class RealTimeDataAPI {
  ///获取单体数据
  static Future<(bool, List<CellDataEntity>)> postCellData({
    required String siteId,
    required int did,
    required int nodeNo,
    required int devNo,
    required String compType,
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.postCellData,
        data: {
          "siteId": siteId,
          "did": did,
          "nodeNo": nodeNo,
          "devNo": devNo,
          "compType": compType,
        },
      );
      if (result["code"] == 0) {
        List<CellDataEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => CellDataEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <CellDataEntity>[]);
      }
    } catch (error) {
      return (false, <CellDataEntity>[]);
    }
  }

  ///获取soc power曲线图数据
  static Future<(bool, List<SocEntity>)> postSocGraph({
    required String siteId,
    required int did,
    required int nodeNo,
    required int devNo,
    required String compType,
    required int startTimeStamp,
    required int endTimeStamp,
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.postPowerGraph,
        data: {
          "siteId": siteId,
          "did": did,
          "nodeNo": nodeNo,
          "devNo": devNo,
          "compType": compType,
          "startTimeStamp": startTimeStamp,
          "endTimeStamp": endTimeStamp,
        },
      );
      if (result["code"] == 0) {
        List<SocEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => SocEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <SocEntity>[]);
      }
    } catch (error) {
      return (false, <SocEntity>[]);
    }
  }

  ///获取power曲线图数据
  static Future<(bool, List<PowerEntity>)> postGraph({
    required String siteId,
    required int did,
    required int nodeNo,
    required int devNo,
    required String compType,
    required int startTimeStamp,
    required int endTimeStamp,
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.postGraph,
        data: {
          "siteId": siteId,
          "did": did,
          "nodeNo": nodeNo,
          "devNo": devNo,
          "compType": compType,
          "startTimeStamp": startTimeStamp,
          "endTimeStamp": endTimeStamp,
        },
      );
      if (result["code"] == 0) {
        List<PowerEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => PowerEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <PowerEntity>[]);
      }
    } catch (error) {
      return (false, <PowerEntity>[]);
    }
  }

  ///获取实时数据组件类型列表
  static Future<ComTypeListEntity?> postComponentTypeList({
    required String siteId,
    required int did,
    required int nodeNo,
    required int devNo,
    required String compType,
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.postComponentTypeList,
        data: {
          "siteId": siteId,
          "did": did,
          "nodeNo": nodeNo,
          "devNo": devNo,
          "compType": compType,
        },
      );
      if (result["code"] == HttpStatus.ok) {
        return ComTypeListEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///获取实时数据组卡片列表
  static Future<List<ComCardVoEntity>> postComponentListByDev({
    required String siteId,
    required int did,
    required int nodeNo,
    required int devNo,
    required String compType,
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.postComponentListByDev,
        data: {
          "siteId": siteId,
          "did": did,
          "nodeNo": nodeNo,
          "devNo": devNo,
          "compType": compType,
        },
      );
      if (result["code"] == HttpStatus.ok) {
        List<ComCardVoEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => ComCardVoEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return value;
      } else {
        AppLoading.toast(result["message"]);
        return <ComCardVoEntity>[];
      }
    } catch (error) {
      return <ComCardVoEntity>[];
    }
  }
}
