import 'package:cescpro/core/model/country_entity.dart';
import 'package:cescpro/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showSelectCountrySheet(
  List<CountryEntity> data, {
  CountryEntity? country,
  Function(CountryEntity?)? onSelectItem,
}) {
  Get.bottomSheet(
    SelectCountryWidget(
      data: data,
      country: country,
      onSelectItem: onSelectItem,
    ),
    ignoreSafeArea: false,
    isScrollControlled: true,
  );
}

class SelectCountryWidget extends StatefulWidget {
  final List<CountryEntity> data;
  final CountryEntity? country;
  final Function(CountryEntity?)? onSelectItem;
  const SelectCountryWidget({
    super.key,
    required this.data,
    this.country,
    this.onSelectItem,
  });

  @override
  State<SelectCountryWidget> createState() => _SelectCountryWidgetState();
}

class _SelectCountryWidgetState extends State<SelectCountryWidget> {
  int selectIndex = -1;

  @override
  void initState() {
    super.initState();
    if ((widget.country != null) && widget.data.isNotEmpty) {
      selectIndex = widget.data.indexOf(widget.country!);
    }
  }

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
                    if (selectIndex != -1) {
                      CountryEntity country = widget.data[selectIndex];
                      widget.onSelectItem?.call(country);
                    }
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
              padding: EdgeInsetsDirectional.zero,
              itemCount: widget.data.length,
              separatorBuilder: (_, i) =>
                  Divider(height: 15.h, color: Colors.transparent),
              itemBuilder: (_, i) {
                CountryEntity country = widget.data[i];
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
                      "${country.en}",
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
