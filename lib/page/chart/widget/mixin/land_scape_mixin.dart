import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin LandscapeMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
