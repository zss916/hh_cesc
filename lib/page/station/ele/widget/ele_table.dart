import 'package:auto_size_text/auto_size_text.dart';
import 'package:cescpro/core/helper/extension_helper.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/report_data_entity.dart';
import 'package:cescpro/page/station/ele/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EleTableWidget extends StatelessWidget {
  final EleLogic logic;
  final QueryType queryType;
  const EleTableWidget({
    super.key,
    required this.logic,
    required this.queryType,
  });

  @override
  Widget build(BuildContext context) {
    return buildEleList();
  }

  ///海外版的收益报表
  Widget buildEleList() {
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
              height: 80,
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
                      child: AutoSizeText(
                        TKey.date.tr,
                        textAlign: TextAlign.center,
                        maxFontSize: 12,
                        minFontSize: 6,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
                        "${TKey.photovoltaicPowerGeneration2.tr}\n(kwh)",
                        textAlign: TextAlign.center,
                        maxFontSize: 12,
                        minFontSize: 6,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
                        "${TKey.gridEleGeneration.tr}\n(kwh)",
                        textAlign: TextAlign.center,
                        maxFontSize: 12,
                        minFontSize: 6,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
                        "${TKey.energyStorageCharge.tr}\n(kwh)",
                        textAlign: TextAlign.center,
                        maxFontSize: 12,
                        minFontSize: 6,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
                      child: AutoSizeText(
                        "${TKey.energyStorageDischarge.tr}\n(kwh)",
                        textAlign: TextAlign.center,
                        maxFontSize: 12,
                        minFontSize: 6,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
              constraints: BoxConstraints(minHeight: (66).toDouble()),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: logic.eleList.length,
                itemBuilder: (_, i) {
                  ReportDataEntity item = logic.eleList[i];
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
                                item.dayDate ?? "--",
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
                              child: Text(
                                (item.pvGeneration ?? 0).formatNum(),
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
                              child: Text(
                                item.isShow
                                    ? (item.gridFeed ?? 0).formatNum()
                                    : "--",
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
                              child: Text(
                                (item.pos ?? 0).formatNum(),
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
                                (item.neg ?? 0).formatNum(),
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
