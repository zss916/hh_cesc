import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IncomeWidget extends StatelessWidget {
  final String totalIncome;
  final String todayIncome;
  final String lastDayIncome;
  const IncomeWidget({
    super.key,
    required this.totalIncome,
    required this.todayIncome,
    required this.lastDayIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 125,
      margin: EdgeInsetsDirectional.only(
        start: 14.w,
        end: 14.w,
        top: 16.h,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            showRevenueDialog();
          },
          child: Container(
            padding: EdgeInsetsDirectional.all(15),
            child: IntrinsicHeight(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      //color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Text(
                              totalIncome.moneyFormat(),
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            User.to.getCurrencyUnit().isEmpty
                                ? TKey.totalRevenue2.tr
                                : TKey.totalRevenue.trArgs([
                                    User.to.getCurrencyUnit(),
                                  ]),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xA6FFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(width: 5, color: Colors.transparent),
                  Expanded(
                    child: Container(
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Text(
                              lastDayIncome.moneyFormat(),
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            User.to.getCurrencyUnit().isEmpty
                                ? TKey.revenueYesterday.tr
                                : TKey.revenueYesterday2.trArgs([
                                    User.to.getCurrencyUnit(),
                                  ]),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xA6FFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showRevenueDialog() {
    Get.dialog(
      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.maxFinite,
            height: 300,
            padding: EdgeInsetsDirectional.all(5),
            margin: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
              top: 16.h,
              bottom: 16.h,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF313540),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Divider(height: 15.h, color: Colors.transparent),
                Text(
                  User.to.getCurrencyUnit().isEmpty
                      ? TKey.totalRevenue2.tr
                      : TKey.totalRevenue.trArgs([User.to.getCurrencyUnit()]),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.sp, color: Color(0xA6FFFFFF)),
                ),
                FittedBox(
                  child: Text(
                    totalIncome,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(height: 15.h, color: Colors.transparent),
                Text(
                  User.to.getCurrencyUnit().isEmpty
                      ? TKey.revenueYesterday.tr
                      : TKey.revenueYesterday2.trArgs([
                          User.to.getCurrencyUnit(),
                        ]),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.sp, color: Color(0xA6FFFFFF)),
                ),
                FittedBox(
                  child: Text(
                    lastDayIncome,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),

                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 40,
                    margin: EdgeInsetsDirectional.only(start: 20, end: 20),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0x5986A3C1),
                    ),
                    child: Text(
                      TKey.confirm.tr,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                Divider(height: 10.h, color: Colors.transparent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
