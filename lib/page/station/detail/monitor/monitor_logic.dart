part of 'index.dart';

class MonitorModel {
  String title;
  String type;
  bool isV1;
  DeviceEnum deviceType;

  MonitorModel({
    required this.title,
    required this.type,
    required this.isV1,
    required this.deviceType,
  });
}

class MonitorLogic extends GetxController with NetWorkRefreshEvent {
  SiteEntity? site;
  List<MonitorModel> data = [];
  bool? isV1;
  UiState state = Loading();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
      site = map['site'] as SiteEntity?;
    }
    state = Loading();
    update();
    onNetWorkRefresh(
      onRefresh: () {
        loadData(isDelayed: true);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
    onDisposeNetWork();
  }

  Future<void> loadData({bool loading = true, bool? isDelayed}) async {
    if (loading) {
      state = Loading();
      update();
      if (isDelayed == true) await Future.delayed(Duration(seconds: 2));
    }

    final isConnected = await NetworkStatusService.instance.isConnected();
    if (!isConnected) {
      state = Offline();
      update();
      return;
    }
    getPointDetails();
  }

  ///isV1
  Future<void> getPointDetails() async {
    SiteDetailEntity? value = await SiteAPI.getPointDetails(
      siteId: site?.id ?? 0,
    );
    isV1 = (value?.isV1);
    if (value != null) {
      if (value.isV1 == true) {
        ///v1
        await fetchData(isV1: true);
      } else {
        ///v2
        await fetchData(isV1: false);
      }
    } else {
      state = Failure();
      update();
    }
  }

  Future<void> fetchData({required bool isV1}) async {
    if (site != null) {
      data.clear();
      final ((
        bool isSuccessful,
        List<String> value,
      )) = await HomeAPI.getSupportDevTypesV2(
        siteId: site?.id,
        protocolId: site?.protocolId,
      );
      if (isSuccessful) {
        for (var e in value) {
          if (e == DeviceEnum.arr.value || e == DeviceEnum.clu.value) {
            bool isHas = data.any((e) => e.type == DeviceEnum.arr.value);
            if (!isHas) {
              data.add(
                MonitorModel(
                  type: DeviceEnum.arr.value,
                  title: TKey.batterySystem.tr,
                  isV1: isV1,
                  deviceType: DeviceEnum.arr,
                ),
              );
            }
          } else if (e == DeviceEnum.pcs.value) {
            data.add(
              MonitorModel(
                type: DeviceEnum.pcs.value,
                title: TKey.pcsInfo.tr,
                isV1: isV1,
                deviceType: DeviceEnum.pcs,
              ),
            );
          } else if (e == DeviceEnum.cool.value) {
            data.add(
              MonitorModel(
                type: DeviceEnum.cool.value,
                title: TKey.liquidCooling.tr,
                isV1: isV1,
                deviceType: DeviceEnum.cool,
              ),
            );
          } else if (e == DeviceEnum.drier.value) {
            data.add(
              MonitorModel(
                type: DeviceEnum.drier.value,
                title: TKey.temperatureAndHumidity.tr,
                isV1: isV1,
                deviceType: DeviceEnum.drier,
              ),
            );
          } else if (e == DeviceEnum.meter.value) {
            data.add(
              MonitorModel(
                type: DeviceEnum.meter.value,
                title: TKey.electricityMeter.tr,
                isV1: isV1,
                deviceType: DeviceEnum.meter,
              ),
            );
          } else if (e == DeviceEnum.dido.value) {
            data.add(
              MonitorModel(
                type: DeviceEnum.dido.value,
                title: TKey.didoInfo.tr,
                isV1: isV1,
                deviceType: DeviceEnum.dido,
              ),
            );
          } else {
            data.add(
              MonitorModel(
                type: e,
                title: e,
                isV1: isV1,
                deviceType: DeviceEnum.fromValue(e),
              ),
            );
          }
        }
        state = data.isEmpty ? Empty() : Success(data);
        update();
      } else {
        state = Failure();
        update();
      }
    } else {
      state = Failure();
      update();
    }
  }

  void toDetail(int index) {
    // debugPrint("isV1:${data[index].isV1}");
    if (isV1 != null) {
      if (data[index].isV1 == true) {
        PageTools.toMonitorDetailV1(siteId: "${site?.id}", data: data[index]);
      } else {
        PageTools.toMonitorDetail(siteId: "${site?.id}", data: data[index]);
      }
    } else {
      PageTools.toMonitorDetail(siteId: "${site?.id}", data: data[index]);
    }
  }

  /* Future<void> fetchDataV1({required bool isV1}) async {
    if (site != null) {
      data.clear();
      final ((
        bool isSuccessful,
        List<String> value,
      )) = await HomeAPI.getSupportDevTypesV1(
        siteId: site?.id,
        protocolId: site?.protocolId,
      );
      if (isSuccessful) {
        for (var e in value) {
          if (e == DeviceEnum.arr.value) {
            data.add(
              MonitorModel(
                type: e,
                title: TKey.stackInfo.tr,
                isV1: isV1,
                deviceType: DeviceEnum.arr,
              ),
            );
          } else if (e == DeviceEnum.clu.value) {
            data.add(
              MonitorModel(
                type: e,
                title: TKey.cluInfo.tr,
                isV1: isV1,
                deviceType: DeviceEnum.clu,
              ),
            );
          } else if (e == DeviceEnum.pcs.value) {
            data.add(
              MonitorModel(
                type: e,
                title: TKey.pcsInfo.tr,
                isV1: isV1,
                deviceType: DeviceEnum.pcs,
              ),
            );
          } else if (e == DeviceEnum.airCool.value) {
            data.add(
              MonitorModel(
                type: e,
                title: TKey.hotInfo.tr,
                isV1: isV1,
                deviceType: DeviceEnum.airCool,
              ),
            );
          } else if (e == DeviceEnum.meter.value) {
            data.add(
              MonitorModel(
                type: e,
                title: TKey.meterInfo.tr,
                isV1: isV1,
                deviceType: DeviceEnum.meter,
              ),
            );
          } else if (e == DeviceEnum.dido.value) {
            data.add(
              MonitorModel(
                type: e,
                title: TKey.didoInfo.tr,
                isV1: isV1,
                deviceType: DeviceEnum.dido,
              ),
            );
          } else if (e == DeviceEnum.cell.value) {
            data.add(
              MonitorModel(
                type: e,
                title: TKey.singleInfo.tr,
                isV1: isV1,
                deviceType: DeviceEnum.cell,
              ),
            );
          } else if (e == DeviceEnum.statsMeter.value) {
            data.add(
              MonitorModel(
                type: e,
                title: TKey.statisticsMeter.tr,
                isV1: isV1,
                deviceType: DeviceEnum.statsMeter,
              ),
            );
          } else if (e == DeviceEnum.fire.value) {
            data.add(
              MonitorModel(
                type: e,
                title: TKey.fireProtectionInfo.tr,
                isV1: isV1,
                deviceType: DeviceEnum.fire,
              ),
            );
          } else {
            data.add(
              MonitorModel(
                type: e,
                title: e,
                isV1: isV1,
                deviceType: DeviceEnum.other,
              ),
            );
          }
        }
        data.isEmpty ? Empty() : Success(data);
        update();
      }
    } else {
      state = Failure();
      update();
    }
  }*/
}
