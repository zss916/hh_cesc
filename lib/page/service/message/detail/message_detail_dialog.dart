import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMessageDetailDialog({required String title, required String content}) {
  Get.dialog(
    AlertDialog(
      backgroundColor: const Color(0xFF23282E),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: double.maxFinite,
        margin: EdgeInsetsDirectional.all(10),
        constraints: BoxConstraints(minHeight: 200),
        child: Text(
          content,
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.justify,
        ),
      ),
      actions: [],
    ),
  );
}
