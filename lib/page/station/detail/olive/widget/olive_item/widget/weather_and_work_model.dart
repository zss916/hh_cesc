import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/line_status_widget.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/olive_item_logic.dart';
import 'package:cescpro/page/station/detail/olive/widget/olive_item/widget/dot_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

///小组件状态
enum SmallWidgetState { success, loading, error }

class BuildWeatherAndWorkModel extends StatelessWidget {
  final OliveItemLogic logic;
  const BuildWeatherAndWorkModel({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18.h, left: 16.w, right: 16.w),
      width: double.maxFinite,
      child: switch (logic.smallWidgetState) {
        SmallWidgetState.success => Wrap(
          spacing: 10,
          children: [
            if (logic.weather != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    TKey.todayWeather.tr,
                    style: TextStyle(fontSize: 13, color: Color(0xB3FFFFFF)),
                  ),
                  Text(
                    logic.weatherData,
                    style: TextStyle(fontSize: 15, color: Color(0xDEFFFFFF)),
                  ),
                ],
              ),

            if (logic.workModel.isNotEmpty)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${TKey.stationStatus.tr}:',
                    style: TextStyle(fontSize: 13, color: Color(0xB3FFFFFF)),
                  ),
                  LineStatusWidget(status: logic.siteDetail?.status ?? 99),
                  Text(
                    logic.workModel,
                    style: TextStyle(fontSize: 15, color: Color(0xDEFFFFFF)),
                  ),
                ],
              ),
          ],
        ),
        SmallWidgetState.loading => Container(
          margin: EdgeInsetsDirectional.only(start: 5),
          child: ThreeDotsLoading(),
        ),
        SmallWidgetState.error => SizedBox.shrink(),
      },
    );
  }
}
