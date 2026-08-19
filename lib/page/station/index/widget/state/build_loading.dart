import 'package:cescpro/page/home/widget/cesc_glow_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildLoading extends StatelessWidget {
  const BuildLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 50.h),
      child: Center(child: CescGlowLoading()),
    );
  }
}
