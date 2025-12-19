import 'dart:io';

import 'package:cescpro/core/setting/app_loading.dart';
import 'package:cescpro/http/bean/id_tree_entity.dart';
import 'package:cescpro/http/bean/v1_arr_info_entity.dart';
import 'package:cescpro/http/bean/v1_cell_info_entity.dart';
import 'package:cescpro/http/bean/v1_clu_info_entity.dart';
import 'package:cescpro/http/bean/v1_dido_info_entity.dart';
import 'package:cescpro/http/bean/v1_fire_entity.dart';
import 'package:cescpro/http/bean/v1_hot_mg_entity.dart';
import 'package:cescpro/http/bean/v1_meter_info_entity.dart';
import 'package:cescpro/http/bean/v1_pcs_info_entity.dart';
import 'package:cescpro/http/bean/v1_stats_meter_entity.dart';
import 'package:cescpro/http/http.dart';
import 'package:cescpro/http/path.dart';
import 'package:flutter/foundation.dart';

class V1API {
  static Future<IdTreeEntity?> getIdsTree({
    String? siteId,
    String? type,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getIdsTree,
        query: {"siteId": siteId, "type": type},
      );
      if (result["code"] == HttpStatus.ok) {
        return IdTreeEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<V1ArrInfoEntity?> getArrInfo({
    String? siteId,
    int? did,
    int? arrId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getArrInfo,
        query: {"siteId": siteId, "did": did, "arrId": arrId},
      );
      if (result["code"] == HttpStatus.ok) {
        return V1ArrInfoEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<V1CluInfoEntity?> getCluInfo({
    String? siteId,
    int? did,
    int? arrId,
    int? cluId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getCluInfo,
        query: {"siteId": siteId, "did": did, "arrId": arrId, "cluId": cluId},
      );
      if (result["code"] == HttpStatus.ok) {
        return V1CluInfoEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<V1PcsInfoEntity?> getPcsInfo({
    String? siteId,
    int? did,
    int? pcsId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getPcsInfo,
        query: {"siteId": siteId, "did": did, "pcsId": pcsId},
      );
      if (result["code"] == HttpStatus.ok) {
        return V1PcsInfoEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<(bool, List<V1HotMgEntity>)> getHotMg({String? siteId}) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getHotMg,
        query: {"siteId": siteId},
      );
      if (result["code"] == HttpStatus.ok) {
        List<V1HotMgEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => V1HotMgEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast(result["message"]);
        return (false, <V1HotMgEntity>[]);
      }
    } catch (error) {
      return (false, <V1HotMgEntity>[]);
    }
  }

  static Future<V1MeterInfoEntity?> getMeterInfo({
    String? siteId,
    int? did,
    int? meterId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getMeterInfo,
        query: {"siteId": siteId, "did": did, "meterId": meterId},
      );
      if (result["code"] == HttpStatus.ok) {
        return V1MeterInfoEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<V1DidoInfoEntity?> getDidoInfo({
    String? siteId,
    int? did,
    int? id,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getDidoInfo,
        query: {"siteId": siteId, "did": did, "id": id},
      );
      if (result["code"] == HttpStatus.ok) {
        return V1DidoInfoEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<V1CellInfoEntity?> getCellInfo({
    String? siteId,
    int? did,
    int? arrId,
    int? cluId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getCellInfo,
        query: {"siteId": siteId, "did": did, "arrId": arrId, "cluId": cluId},
      );
      if (result["code"] == HttpStatus.ok) {
        return V1CellInfoEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<V1StatsMeterEntity?> getStatsMeterInfo({
    String? siteId,
    int? did,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getStatsMeterInfo,
        query: {"siteId": siteId, "did": did},
      );
      if (result["code"] == HttpStatus.ok) {
        return V1StatsMeterEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<V1FireEntity?> getFireInfo({
    String? siteId,
    int? did,
    int? fireId,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getFireInfo,
        query: {"siteId": siteId, "did": did, "fireId": fireId},
      );
      if (result["code"] == HttpStatus.ok) {
        return V1FireEntity.fromJson(result['data']);
      } else {
        AppLoading.toast(result["message"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
