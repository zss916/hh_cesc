import 'package:cescpro/components/offline_on_refresh.dart';
import 'package:cescpro/core/storage/app_event_bus.dart';
import 'package:flutter/material.dart';

class BuildOffline extends StatelessWidget {
  const BuildOffline({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OfflineOnRefresh(
        onCall: () {
          AppEventBus.eventBus.fire(NetWorkRefresh());
        },
      ),
    );
  }
}
