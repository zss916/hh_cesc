import 'dart:async';

import 'package:cescpro/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Top-level overlay helpers. Use the [rootNavigatorKey] to reach the active
/// overlay/context — no `ProviderContainer` or `BuildContext` global is
/// required.
class DialogUtils {
  static OverlayEntry? _currentSnackBar;
  static Timer? _snackBarTimer;

  static void showSnackBar(
    String message, {
    SnackbarType snackbarType = SnackbarType.success,
    void Function()? onErrorDialogClick,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlayState = Get.key.currentState?.overlay;
    // final overlayState = rootNavigatorKey.currentState?.overlay;
    if (overlayState == null) return;

    final colors = Theme.of(overlayState.context).colorScheme;
    final textTheme = Theme.of(overlayState.context).textTheme;

    _disposeSnackBar();

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).viewPadding.top + 10,
        left: 16,
        right: 16,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          color: _getBackgroundColor(snackbarType, colors),
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 6,
              vertical: 2,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    message,
                    style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    snackbarType == SnackbarType.success
                        ? Icons.done
                        : Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: _disposeSnackBar,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    _currentSnackBar = overlayEntry;
    overlayState.insert(overlayEntry);

    _snackBarTimer = Timer(duration, _disposeSnackBar);
  }

  /// Idempotent teardown of the current snackbar overlay. Safe to call from
  /// the auto-dismiss timer, the close button, and from a fresh
  /// `showSnackBar` call (which preempts the previous one). Catches the
  /// `OverlayEntry already removed` race that can fire if a manual tap and
  /// the timer both resolve in the same frame.
  static void _disposeSnackBar() {
    _snackBarTimer?.cancel();
    _snackBarTimer = null;
    final entry = _currentSnackBar;
    _currentSnackBar = null;
    if (entry == null) return;
    try {
      entry.remove();
    } catch (_) {
      // Already removed by a sibling caller; nothing to do.
    }
  }

  static Color _getBackgroundColor(SnackbarType type, ColorScheme colors) {
    switch (type) {
      case SnackbarType.success:
        return Colors.green;
      case SnackbarType.failure:
      case SnackbarType.errorDialog:
        return Colors.red;
    }
  }

  static void showAdaptiveAppDialog({
    required String message,
    required String titleStr,
    String? positiveText,
    String? negativeText,
    VoidCallback? onPositiveTap,
    VoidCallback? onNegativeTap,
  }) {
    final rootContext = Get.context;
    if (rootContext == null) return;

    showDialog<void>(
      context: rootContext,
      barrierDismissible: false,
      builder: (dialogContext) {
        final actions = <Widget>[
          if (negativeText != null)
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onNegativeTap?.call();
              },
              child: Text(
                negativeText,
                style: AppTextStyle.medium(12, Colors.white),
              ),
            ),
          if (positiveText != null)
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onPositiveTap?.call();
              },
              child: Text(
                positiveText,
                style: AppTextStyle.medium(12, Colors.white),
              ),
            ),
        ];

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {},
          child: AlertDialog.adaptive(
            title: Text(titleStr, style: AppTextStyle.medium(12, Colors.black)),
            content: Text(
              message,
              style: AppTextStyle.medium(12, Colors.black),
            ),
            actions: actions,
          ),
        );
      },
    );
  }
}

enum SnackbarType { success, failure, errorDialog }
