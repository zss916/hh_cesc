import 'package:cescpro/core/translations/en.dart';
import 'package:cescpro/page/home/widget/pie_chart_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echart/flutter_echart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//https://juejin.cn/post/6901828472142823438?searchId=2025092022502584005D1D54B5DA9A6D9C
class BuildStationStatus extends StatelessWidget {
  final int normalNum;

  ///正常站点数
  final int faultNum;

  ///故障站点数
  final int alarmNum;

  ///告警站点数
  final int cutOffNum;
  const BuildStationStatus({
    super.key,
    required this.normalNum,
    required this.faultNum,
    required this.alarmNum,
    required this.cutOffNum,
  });

  ///饼状图
  /*List<EChartPieBean> _dataList = [
    EChartPieBean(title: "生活费", number: 100, color: Colors.lightBlueAccent),
    EChartPieBean(title: "游玩费", number: 100, color: Colors.deepOrangeAccent),
    EChartPieBean(title: "交通费", number: 100, color: Colors.green),
    EChartPieBean(title: "贷款费", number: 100, color: Colors.amber),
    EChartPieBean(title: "电话费", number: 600, color: Colors.orange),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 9.h),
          width: double.maxFinite,
          child: Text(
            TKey.stationStatus.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 220.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsetsDirectional.only(
            top: 16.h,
            bottom: 16.h,
            start: 16.w,
            end: 16.w,
          ),
          padding: EdgeInsetsDirectional.all(16.r),
          child: RepaintBoundary(
            child: PieChartLineWidget(
              total: (normalNum + faultNum + alarmNum + cutOffNum),
              normalNum: normalNum,
              faultNum: faultNum,
              alarmNum: alarmNum,
              cutOffNum: cutOffNum,
            ),
          ),
        ),

        /*  Container(
          width: double.maxFinite,
          height: 220.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Color(0xFF313540),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsetsDirectional.only(
            top: 16.h,
            bottom: 16.h,
            start: 16.w,
            end: 16.w,
          ),
          padding: EdgeInsetsDirectional.all(16.r),
          child: buildPieChatWidget(data),
        ),*/
      ],
    );
  }

  /*List<EChartPieBean> data = [
    EChartPieBean(title: "故障", number: 1, color: Color(0xFFF8D834)),

    EChartPieBean(title: "告警", number: 1, color: Color(0xFFFF9C4A)),

    EChartPieBean(title: "正常", number: 1, color: Color(0xFF3BFFC5)),

    EChartPieBean(title: "中断", number: 1, color: Color(0xFF44A7FF)),
  ];*/
  PieChatWidget buildPieChatWidget(List<EChartPieBean> data) {
    return PieChatWidget(
      dataList: data,
      //是否输出日志
      isLog: false,
      //是否需要背景
      isBackground: false,
      //是否画直线
      isLineText: true,
      //背景
      bgColor: Color(0xFF313540),
      //是否显示最前面的内容
      isFrontgText: true,
      //默认选择放大的块
      initSelect: -1,
      //初次显示以动画方式展开
      openType: OpenType.NON,
      //旋转类型
      loopType: LoopType.NON,
      //点击回调
      clickCallBack: (int value) {
        //print("当前点击显示 $value");
      },
    );
  }
}
