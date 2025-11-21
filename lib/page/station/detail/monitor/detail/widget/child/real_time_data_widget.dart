import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/com_card_vo_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RealTimeDataWidget extends StatelessWidget {
  final List<ComCardVoEntity> comCardVoList;
  const RealTimeDataWidget({super.key, required this.comCardVoList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(
            start: 18.w,
            end: 18.w,
            bottom: 16.h,
          ),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            TKey.realTimeData.tr,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        comCardVoList.length == 1
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsetsDirectional.all(16.r),
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
                          comCardVoList.first.cardName ?? "",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Divider(height: 16.h, color: Colors.transparent),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: (comCardVoList.first.defaultList ?? []).length,
                      itemBuilder: (BuildContext context, int index) {
                        ComCardVoDefaultList item =
                            (comCardVoList.first.defaultList ?? [])[index];
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          padding: EdgeInsetsDirectional.all(16.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF313540),
                          ),
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Text(
                                item.showFieldName,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xA6FFFFFF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${item.showValue}${item.unit}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(color: Colors.transparent, height: 16.h),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: comCardVoList.length,
                itemBuilder: (BuildContext context, int index) {
                  ComCardVoEntity item = comCardVoList[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsetsDirectional.all(16.r),
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
                              item.cardName ?? "--",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Divider(height: 16.h, color: Colors.transparent),
                        if ((item.items ?? []).isNotEmpty)
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (item.items ?? []).length,
                            separatorBuilder: (_, i) => Divider(
                              height: 16.h,
                              color: Colors.transparent,
                            ),
                            itemBuilder: (_, index) {
                              ComCardVoItems comItem =
                                  (item.items ?? [])[index];
                              return Row(
                                children: [
                                  Text(
                                    comItem.showFieldName,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xA6FFFFFF),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${comItem.showValue}${comItem.unit}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.transparent, height: 16.h),
              ),
      ],
    );
  }
}
