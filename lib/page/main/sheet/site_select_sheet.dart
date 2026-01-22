import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/http/bean/site_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showSiteSelectSheet({
  required List<SiteDataEntity> sites,
  Function(SiteDataEntity)? onSelect,
}) {
  Get.bottomSheet(
    SiteSelectWidget(sites: sites, onSelect: onSelect),
    ignoreSafeArea: false,
  );
}

class SiteSelectWidget extends StatefulWidget {
  final List<SiteDataEntity> sites;
  final Function(SiteDataEntity)? onSelect;
  const SiteSelectWidget({super.key, required this.sites, this.onSelect});

  @override
  State<SiteSelectWidget> createState() => _SiteSelectWidgetState();
}

class _SiteSelectWidgetState extends State<SiteSelectWidget> {
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 150.h),
      decoration: BoxDecoration(
        color: Color(0xFF23282E),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      constraints: BoxConstraints(minHeight: 300.h),
      padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 15),
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 15),
            width: double.maxFinite,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      TKey.cancel.tr,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    SiteDataEntity site = widget.sites[selectIndex];
                    widget.onSelect?.call(site);
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x4D43FFFF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      TKey.confirm.tr,
                      style: TextStyle(fontSize: 14, color: Color(0xFF43FFFF)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsetsDirectional.only(
                start: 0,
                end: 0,
                top: 0,
                bottom: 50.h,
              ),
              itemCount: widget.sites.length,
              separatorBuilder: (_, i) =>
                  Divider(height: 15.h, color: Colors.transparent),
              itemBuilder: (_, i) {
                SiteDataEntity item = widget.sites[i];
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (selectIndex == i) {
                        selectIndex = -1;
                      } else {
                        selectIndex = i;
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: (selectIndex == i)
                          ? Color(0x6643FFFF)
                          : Colors.white10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.maxFinite,
                    child: Text(
                      "${item.name}",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
