/*
import 'package:alice/alice.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:flutter/material.dart';

class AliceHelper {
  static final AliceHelper _instance = AliceHelper._internal();
  static AliceHelper get instance => AliceHelper();
  factory AliceHelper() => _instance;

  late final Alice _alice;

  AliceHelper._internal() {
    _alice = Alice(configuration: AliceConfiguration(showNotification: false));
    _alice.showInspector();
  }

  ///获取navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => _alice.getNavigatorKey();

  ///获取aliceAdapter
  AliceDioAdapter getAliceDioAdapter() {
    AliceDioAdapter aliceDioAdapter = AliceDioAdapter();
    _alice.addAdapter(aliceDioAdapter);
    return aliceDioAdapter;
  }
}
*/
