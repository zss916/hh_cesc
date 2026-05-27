import 'package:flutter/material.dart';

class ColorGenerator {
  /// 根据索引生成颜色
  static Color generateColor(int index, int total) {
    // 使用黄金角分布颜色，避免颜色过于接近
    final hue = (index * 137.508) % 360;

    return HSLColor.fromAHSL(
      1.0,
      hue,
      0.65, // 饱和度
      0.55, // 亮度
    ).toColor();
  }

  /// 生成整个颜色列表
  static List<Color> generateColors(int total) {
    return List.generate(total, (index) => generateColor(index, total));
  }

  ///根据名称设置颜色
  static Color colorFromString(String text) {
    final hash = text.hashCode;
    final hue = (hash % 360).toDouble();
    return HSLColor.fromAHSL(1.0, hue, 0.65, 0.55).toColor();
  }
}
