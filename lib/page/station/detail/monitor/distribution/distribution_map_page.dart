import 'package:cescpro/components/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DistributionMapPage extends StatelessWidget {
  const DistributionMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///单体温度，SOC， 单体电压
    return Scaffold(
      appBar: baseAppBar(title: "单体温度"),
      backgroundColor: Color(0xFF23282E),
      body: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
              top: 12.h,
              bottom: 15.h,
            ),
            width: double.maxFinite,
            child: Text(
              "最高/最低单体温度：3.309°C/3.205°C",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
              end: 16.w,
              top: 20.h,
              bottom: 20.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF313540),
            ),
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Pack1",
                      style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                    ),
                    Spacer(),
                  ],
                ),
                Divider(height: 12.h, color: Colors.transparent),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5.r,
                    crossAxisSpacing: 5.r,
                    childAspectRatio: 74 / 29,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    //#FBE1E0
                    //#FFC7C8
                    //#FFA8A7
                    //#FE8687
                    //#FE6B6B
                    return Container(
                      width: double.maxFinite,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFFBE1E0),
                      ),
                      child: Text(
                        "${index + 1}# 28°C",
                        style: TextStyle(
                          color: Color(0xFF1D1D1D),
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
