part of 'index.dart';

class MessageCenterPage extends StatelessWidget {
  const MessageCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: AppInfoService.to.isBottomPadding,
      child: Scaffold(
        appBar: baseAppBar(title: TKey.messageCenter.tr),
        backgroundColor: Color(0xFF23282E),
        body: GetBuilder<MessageCenterLogic>(
          init: MessageCenterLogic(),
          builder: (logic) {
            return SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: buildBody(viewState: logic.viewState, logic: logic),
            );
          },
        ),
      ),
    );
  }

  Widget buildBody({
    required int viewState,
    required MessageCenterLogic logic,
  }) {
    return switch (viewState) {
      _ when viewState == 0 => buildList(logic: logic),
      _ when viewState == 1 => buildEmpty(),
      _ when viewState == 2 => Container(
        margin: EdgeInsetsDirectional.only(bottom: 50.h),
        child: Center(child: CircularProgressIndicator()),
      ),
      _ => SizedBox.shrink(),
    };
  }

  Widget buildList({required MessageCenterLogic logic}) {
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(top: 10.h, bottom: 100.h),
      itemCount: logic.data.length,
      itemBuilder: (_, int index) {
        MessageItemEntity item = logic.data[index];
        return buildMessageItem(item: item);
      },
      separatorBuilder: (_, int index) =>
          Divider(height: 16.h, color: Colors.transparent),
    );
  }

  Widget buildMessageItem({required MessageItemEntity item}) {
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
                    item.title ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      if (item.status == 0)
                        Text(
                          TKey.unRead.tr,
                          style: TextStyle(
                            color: Color(0x80FFFFFF),
                            fontSize: 12.sp,
                          ),
                        ),

                      if (item.status == 1)
                        Text(
                          TKey.read.tr,
                          style: TextStyle(
                            color: Color(0x80FFFFFF),
                            fontSize: 12.sp,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Color(0x14EEF2F8)),
          if (item.showContent.isNotEmpty)
            Container(
              margin: EdgeInsetsDirectional.only(top: 12.h, bottom: 13.h),
              alignment: AlignmentDirectional.centerStart,
              width: double.maxFinite,
              child: Text(
                item.showContent,
                style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 14.sp),
              ),
            ),
          if (item.showContent.isNotEmpty)
            Divider(height: 1, color: Color(0x14EEF2F8)),
          Container(
            margin: EdgeInsetsDirectional.only(top: 13.h),
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${TKey.sendTime.tr}${item.sendTime ?? ""}",
                    style: TextStyle(color: Color(0x80FFFFFF), fontSize: 12.sp),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "${TKey.sender.tr}${item.senderName}",
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

  Widget buildEmpty() => SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.imgEmpty, width: 200, height: 95),
        Text(
          TKey.noDataAvailable.tr,
          style: TextStyle(fontSize: 18, color: Color(0xFF909399)),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 17.h, bottom: 120.h),
          child: Text(
            TKey.noDataAvailableTip.tr,
            style: TextStyle(fontSize: 14, color: Color(0xFF909399)),
          ),
        ),
      ],
    ),
  );
}
