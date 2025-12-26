import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IncomeWidget extends StatelessWidget {
  final num totalIncome;
  final num todayIncome;
  const IncomeWidget({
    super.key,
    required this.totalIncome,
    required this.todayIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 125,
      padding: EdgeInsetsDirectional.all(15),
      margin: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
        top: 16.h,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              //color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      totalIncome.toDouble().formatAmount(),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    TKey.totalRevenue.trArgs([User.to.getCurrencyUnit()]),
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(width: 10, color: Colors.transparent),
          Expanded(
            child: Container(
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      todayIncome.toDouble().formatAmount(),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    TKey.currentRevenue.trArgs([User.to.getCurrencyUnit()]),
                    style: TextStyle(fontSize: 14.sp, color: Color(0xA6FFFFFF)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
