import 'package:flutter/material.dart';

///页面保活方法
class AppKeepAlivePage extends StatefulWidget {
  final Widget child;

  const AppKeepAlivePage(this.child, {super.key});

  @override
  State<StatefulWidget> createState() => _AppKeepAliveState();
}

class _AppKeepAliveState extends State<AppKeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
