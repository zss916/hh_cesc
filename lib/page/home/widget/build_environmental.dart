import 'package:auto_size_text/auto_size_text.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuildEnvironmental extends StatelessWidget {
  final num co2;
  final num coal; //煤
  const BuildEnvironmental({super.key, required this.co2, required this.coal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 9.h),
          width: double.maxFinite,
          child: Text(
            TKey.environmentalValue.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          margin: EdgeInsetsDirectional.only(
            top: 16.h,
            bottom: 16.h,
            start: 16.w,
            end: 16.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  //height: 95.h + 20,
                  constraints: BoxConstraints(minHeight: 95.h),
                  decoration: BoxDecoration(
                    color: Color(0xFF313540),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      PositionedDirectional(
                        end: 4,
                        bottom: 2,
                        child: Image.asset(
                          Assets.imgCo2Reduction,
                          width: 60,
                          height: 60,
                          matchTextDirection: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.all(16),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(bottom: 6),
                              width: double.maxFinite,
                              child: Text(
                                TKey.co2EmissionReduction.tr,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0x7DFFFFFF),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              child: AutoSizeText.rich(
                                minFontSize: 10,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "$co2",
                                      children: [
                                        TextSpan(
                                          text: ' t',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Color(0xCCFFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalDivider(width: 13, color: Colors.transparent),
              Expanded(
                child: Container(
                  //height: 95.h,
                  constraints: BoxConstraints(minHeight: 95.h),
                  decoration: BoxDecoration(
                    color: Color(0xFF313540),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      PositionedDirectional(
                        end: 4,
                        bottom: 2,
                        child: Image.asset(
                          Assets.imgResolveNum,
                          width: 60,
                          height: 60,
                          matchTextDirection: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.all(16),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(bottom: 6),
                              width: double.maxFinite,
                              child: Text(
                                TKey.resolveStandardCoal.tr,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0x7DFFFFFF),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: double.maxFinite,
                              child: AutoSizeText.rich(
                                minFontSize: 10,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "$coal",
                                      children: [
                                        TextSpan(
                                          text: ' t',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Color(0xCCFFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
