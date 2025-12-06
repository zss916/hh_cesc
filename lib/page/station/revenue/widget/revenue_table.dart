import 'package:auto_size_text/auto_size_text.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/statistic_report_entity.dart';
import 'package:cescpro/page/station/revenue/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RevenueTableWidget extends StatelessWidget {
  final List<StatisticReportDailyElecIncomeDetail> data;
  final QueryType queryType;
  const RevenueTableWidget({
    super.key,
    required this.data,
    required this.queryType,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsetsDirectional.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 1, color: Color(0xFF5A5D66)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 72,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                        ),
                        color: Colors.white10,
                      ),
                      child: Text(
                        TKey.date.tr,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  buildVChildItemDiver(),
                  Expanded(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(color: Colors.white10),
                      width: double.maxFinite,
                      child: Text(
                        TKey.duration.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  buildVChildItemDiver(),
                  Expanded(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(color: Colors.white10),
                      width: double.maxFinite,
                      child: Text(
                        "${TKey.chargingAmount.tr}\n(￥)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  buildVChildItemDiver(),
                  Expanded(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(color: Colors.white10),
                      width: double.maxFinite,
                      child: AutoSizeText(
                        "${TKey.dischargingAmount.tr}\n(￥)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  buildVChildItemDiver(),
                  Expanded(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3),
                        ),
                        color: Colors.white10,
                      ),
                      width: double.maxFinite,
                      child: Text(
                        "${TKey.amount.tr}\n(￥)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              constraints: BoxConstraints(minHeight: (66 * 3).toDouble()),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (_, i) {
                  StatisticReportDailyElecIncomeDetail item = data[i];
                  return Container(
                    width: double.maxFinite,
                    constraints: BoxConstraints(minHeight: 66),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1, color: Color(0xFF5A5D66)),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.amber,
                              padding: EdgeInsetsDirectional.all(10),
                              width: double.maxFinite,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                item.showDate(queryType),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xD9FFFFFF),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsetsDirectional.all(0),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    width: 1,
                                    color: Color(0xFF5A5D66),
                                  ),
                                ),
                              ),
                              alignment: AlignmentDirectional.center,
                              child: Column(
                                children: [
                                  buildChildItem(title: TKey.sharp.tr),
                                  buildChildItemDiver(),
                                  buildChildItem(title: TKey.peak.tr),
                                  buildChildItemDiver(),
                                  buildChildItem(title: TKey.average.tr),
                                  buildChildItemDiver(),
                                  buildChildItem(title: TKey.valley.tr),
                                  buildChildItemDiver(),
                                  buildChildItem(title: TKey.all.tr),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsetsDirectional.all(0),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    width: 1,
                                    color: Color(0xFF5A5D66),
                                  ),
                                ),
                              ),
                              alignment: AlignmentDirectional.center,
                              child: Column(
                                children: [
                                  ///正向
                                  buildChildItem(
                                    title: "${item.verPosAmount ?? 0}",
                                  ),
                                  buildChildItemDiver(),
                                  buildChildItem(
                                    title: "${item.higPosAmount ?? 0}",
                                  ),
                                  buildChildItemDiver(),
                                  buildChildItem(
                                    title: "${item.midPosAmount ?? 0}",
                                  ),
                                  buildChildItemDiver(),
                                  buildChildItem(
                                    title: "${item.lowPosAmount ?? 0}",
                                  ),
                                  buildChildItemDiver(),
                                  buildChildItem(
                                    title: "${item.totalPosAmount ?? 0}",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsetsDirectional.all(0),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    width: 1,
                                    color: Color(0xFF5A5D66),
                                  ),
                                ),
                              ),
                              alignment: AlignmentDirectional.center,
                              child: Column(
                                children: [
                                  ///负向
                                  buildChildItem(
                                    title: "${item.verNegAmount ?? 0}",
                                  ),
                                  buildChildItemDiver(),
                                  buildChildItem(
                                    title: "${item.higNegAmount ?? 0}",
                                  ),
                                  buildChildItemDiver(),
                                  buildChildItem(
                                    title: "${item.midNegAmount ?? 0}",
                                  ),
                                  buildChildItemDiver(),
                                  buildChildItem(
                                    title: "${item.lowNegAmount ?? 0}",
                                  ),
                                  buildChildItemDiver(),
                                  buildChildItem(
                                    title: "${item.totalNegAmount ?? 0}",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsetsDirectional.all(10),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    width: 1,
                                    color: Color(0xFF5A5D66),
                                  ),
                                ),
                              ),
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "${item.totalElecIncome ?? 0}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xD9FFFFFF),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///子组件
  Widget buildChildItem({required String title}) => Container(
    alignment: AlignmentDirectional.center,
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 0, color: Color(0xFF5A5D66))),
    ),
    width: double.maxFinite,
    height: 40,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xD9FFFFFF),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  ///分割线
  Widget buildChildItemDiver() =>
      Container(height: 1, width: double.maxFinite, color: Color(0xFF5A5D66));

  ///垂直分割线
  Widget buildVChildItemDiver() =>
      Container(width: 1, height: double.maxFinite, color: Color(0xFF5A5D66));
}
