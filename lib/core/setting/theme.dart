import 'package:flutter/material.dart';

class CustomTheme {
  static final CustomTheme _instance = CustomTheme._internal();

  factory CustomTheme() => _instance;

  static CustomTheme get to => _instance;

    CustomTheme._internal();

  ThemeData get dark {
    final scheme = ColorScheme.dark(
      primary: Colors.white,
      /// 页面背景色
      surface: const Color(0xFF000000),
      /// 卡片背景色
      surfaceContainer: const Color(0xFF101010),
      /// 主要文字颜色
      primaryFixed: Colors.white,
      /// 次要文字颜色
      secondaryFixed: const Color(0xFFA1A1A1),
      outline: Colors.white.withValues(alpha: 0.1),
    );
    return _getThemeData(scheme);
  }

  ThemeData _getThemeData(ColorScheme scheme) {
    return ThemeData(
      brightness: scheme.brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      splashFactory: NoSplash.splashFactory,
      dividerColor: scheme.outline,
      dividerTheme: DividerThemeData(
        color: scheme.outline,
        space: 0.5,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: scheme.surface,
        toolbarHeight: 48,
        centerTitle: true,
        titleSpacing: 16,
        foregroundColor: scheme.primaryFixed,
        titleTextStyle: TextStyle(
          fontSize: 19,
          color: scheme.primaryFixed,
          height: 1.3,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(size: 24, color: scheme.primaryFixed),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 16,
          color: scheme.primaryFixed,
          height: 1.3,
        ),
        titleMedium: TextStyle(
          fontSize: 22,
          color: scheme.primaryFixed,
          height: 1.3,
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      buttonTheme: const ButtonThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        )
      ),
      cardColor: scheme.surfaceContainer,
      tabBarTheme: TabBarThemeData(
        dividerColor: Colors.transparent,
        dividerHeight: 0,
        splashFactory: NoSplash.splashFactory,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        labelColor: scheme.primaryFixed,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelColor: scheme.primaryFixed.withValues(alpha: 0.6),
        unselectedLabelStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}