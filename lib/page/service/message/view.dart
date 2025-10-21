part of 'index.dart';

class MessageCenterPage extends StatelessWidget {
  const MessageCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.messageCenter.tr),
      backgroundColor: Color(0xFF23282E),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: ListView.separated(
          padding: EdgeInsetsDirectional.only(top: 10.h, bottom: 100.h),
          itemCount: 30,
          itemBuilder: (_, int index) => buildMessageItem(),
          separatorBuilder: (_, int index) =>
              Divider(height: 16.h, color: Colors.transparent),
        ),
      ),
    );
  }

  Widget buildMessageItem() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.w,
        vertical: 15.h,
      ),
      margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 13.h),
            alignment: AlignmentDirectional.centerStart,
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "PCS告警提醒",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "未读",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Color(0x14EEF2F8)),
          Container(
            margin: EdgeInsetsDirectional.only(top: 12.h, bottom: 13.h),
            alignment: AlignmentDirectional.centerStart,
            width: double.maxFinite,
            child: Text(
              "您的设备PCS告警温度于2025-09-08 19:23开始温度高于45°C度，请尽快联系管理员查明原因。",
              style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
            ),
          ),
          Divider(height: 1, color: Color(0x14EEF2F8)),
          Container(
            margin: EdgeInsetsDirectional.only(top: 13.h),
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "发送时间：2025-09-08 19:23",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12.sp),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "发送人：管理员",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
