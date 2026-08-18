import 'package:cescpro/http/bean/cell_data_entity.dart';
import 'package:cescpro/page/station/detail/monitor/distribution/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildBody extends StatelessWidget {
  final MapType type;
  final List<CellDataEntity> value;
  const BuildBody({super.key, required this.type, required this.value});

  @override
  Widget build(BuildContext context) {
    return buildContent(type, value);
  }

  Widget buildContent(MapType? type, List<CellDataEntity> value) {
    return switch (type) {
      MapType.temp => buildTemp(value),
      MapType.soc => buildSoc(value),
      MapType.voltage => buildV(value),
      _ => SizedBox.shrink(),
    };
  }

  Widget buildTemp(List<CellDataEntity> cells) => ListView.separated(
    shrinkWrap: true,
    itemCount: cells.length,
    padding: EdgeInsetsDirectional.only(bottom: 60.h),
    separatorBuilder: (_, i) =>
        Divider(height: 20.h, color: Colors.transparent),
    itemBuilder: (_, i) => Container(
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
                "Pack${i + 1}",
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
            itemCount: (cells[i].cells ?? []).length,
            itemBuilder: (context, index) {
              CellDataCells? item = (cells[i].cells ?? [])[index];
              double tempColorValue =
                  ((item.temp ?? 0) - cells[i].minTemp) /
                  (cells[i].maxTemp - cells[i].minTemp);
              return Container(
                width: double.maxFinite,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red.withValues(alpha: tempColorValue),
                  ),
                  child: FittedBox(
                    child: Text(
                      "${item.no}# ${item.temp}°C",
                      style: TextStyle(color: Color(0xFF1D1D1D), fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );

  Widget buildSoc(List<CellDataEntity> cells) => ListView.separated(
    shrinkWrap: true,
    itemCount: cells.length,
    padding: EdgeInsetsDirectional.only(bottom: 60.h),
    separatorBuilder: (_, i) =>
        Divider(height: 20.h, color: Colors.transparent),
    itemBuilder: (_, i) => Container(
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
                "Pack${i + 1}",
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
            itemCount: (cells[i].cells ?? []).length,
            itemBuilder: (context, index) {
              CellDataCells? item = (cells[i].cells ?? [])[index];
              return Container(
                width: double.maxFinite,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF86A3C1),
                  ),
                  child: FittedBox(
                    child: Text(
                      "${item.no}# ${item.soc}%",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );

  Widget buildV(List<CellDataEntity> cells) => ListView.separated(
    shrinkWrap: true,
    itemCount: cells.length,
    padding: EdgeInsetsDirectional.only(bottom: 60.h),
    separatorBuilder: (_, i) =>
        Divider(height: 20.h, color: Colors.transparent),
    itemBuilder: (_, i) => Container(
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
                "Pack${i + 1}",
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
            itemCount: (cells[i].cells ?? []).length,
            itemBuilder: (context, index) {
              CellDataCells? item = (cells[i].cells ?? [])[index];
              return Container(
                width: double.maxFinite,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF86A3C1),
                  ),
                  child: FittedBox(
                    child: Text(
                      "${item.no}# ${item.voltage}V",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
