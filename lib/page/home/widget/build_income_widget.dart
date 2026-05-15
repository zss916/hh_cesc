import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/core/user/user.dart';
import 'package:cescpro/page/home/widget/dialog_revenue.dart';
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
            showRevenueDialog(
              totalIncome: todayIncome,
              lastDayIncome: lastDayIncome,
            );
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
}
