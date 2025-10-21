import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

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
              height: 60,
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
                        "日期",
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
                        "时段",
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
                        "充电量\n(kwh)",
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
                        "放电量\n(kwh)",
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
                        "综合效率\n(%)",
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
                itemCount: 3,
                itemBuilder: (_, i) => Container(
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
                              "08-01\n2025",
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
                                buildChildItem(title: "尖"),
                                buildChildItemDiver(),
                                buildChildItem(title: "峰"),
                                buildChildItemDiver(),
                                buildChildItem(title: "平"),
                                buildChildItemDiver(),
                                buildChildItem(title: "谷"),
                                buildChildItemDiver(),
                                buildChildItem(title: "总"),
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
                                buildChildItem(title: "6.8"),
                                buildChildItemDiver(),
                                buildChildItem(title: "2425.6"),
                                buildChildItemDiver(),
                                buildChildItem(title: "1878.0"),
                                buildChildItemDiver(),
                                buildChildItem(title: "15271.6"),
                                buildChildItemDiver(),
                                buildChildItem(title: "19596.4"),
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
                                buildChildItem(title: "6.8"),
                                buildChildItemDiver(),
                                buildChildItem(title: "2425.6"),
                                buildChildItemDiver(),
                                buildChildItem(title: "1878.0"),
                                buildChildItemDiver(),
                                buildChildItem(title: "15271.6"),
                                buildChildItemDiver(),
                                buildChildItem(title: "19596.4"),
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
                              "87.54",
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
                ),
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
