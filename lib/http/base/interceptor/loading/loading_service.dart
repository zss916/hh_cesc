import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingService {
  static final LoadingService instance = LoadingService._();

  bool _isShowing = false;
  OverlayEntry? _overlayEntry;

  LoadingService._();

  void show({String? message}) {
    if (_isShowing) return;
    final overlay = Get.key.currentState?.overlay;
    debugPrint('[LoadingService] show: overlay=$overlay');
    if (overlay == null) return;

    _isShowing = true;
    _overlayEntry = OverlayEntry(
      builder: (_) => Container(
        color: Colors.black.withAlpha(125),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              if (message != null) ...[
                const SizedBox(height: 16),
                Text(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ],
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void dismiss() {
    debugPrint('[LoadingService] dismiss: _isShowing=$_isShowing');
    if (_isShowing) {
      _isShowing = false;
      _overlayEntry?.remove();
      _overlayEntry = null;
      debugPrint('[LoadingService] dismiss: loading closed');
    }
  }

  void forceDismiss() {
    _isShowing = false;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  bool get isLoading => _isShowing;
}
