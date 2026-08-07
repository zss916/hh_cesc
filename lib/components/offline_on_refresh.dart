import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class OfflineOnRefresh extends StatelessWidget {
  final VoidCallback onCall;
  const OfflineOnRefresh({super.key, required this.onCall});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCall.call();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, color: Colors.white, size: 80),
          Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                colors: [Color(0xFF43FFFF), Color(0xFF0978E9)],
              ),
            ),
            child: Text(
              TKey.refresh.tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
