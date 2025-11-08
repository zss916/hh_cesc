part of 'index.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<ServiceLogic>(
        init: ServiceLogic(),
        builder: (logic) {
          return Column(
            children: [
              Divider(height: 28.h, color: Colors.transparent),
              AvatarWidget(url: logic.icon),
              Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsetsDirectional.only(
                  top: 20.h,
                  start: 20.w,
                  end: 20.w,
                ),
                width: double.maxFinite,
                child: Text(
                  TKey.accountCode.trArgs([logic.userName]),
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ),
              MessageItemWidget(
                unReadNum: logic.unreadNum,
                onTap: () {
                  PageTools.toMessageCenter();
                },
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                  top: 24.h,
                  bottom: 12.h,
                  start: 16.w,
                  end: 16.w,
                ),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  TKey.systemSetting.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color(0xA6FFFFFF), fontSize: 12.sp),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFF313540),
                ),
                margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
                width: double.maxFinite,
                child: Column(
                  children: [
                    ItemWidget(
                      title: TKey.switchLanguage.tr,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      onTap: () {
                        PageTools.toChangeLanguage();
                      },
                    ),

                    ItemWidget(
                      title: TKey.problemFeedback.tr,
                      onTap: () {
                        PageTools.toFeedback();
                      },
                    ),

                    ItemWidget(
                      title: TKey.aboutUs.tr,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      onTap: () {
                        PageTools.toAbout();
                      },
                    ),
                  ],
                ),
              ),

              BaseBtnWidget(
                title: TKey.quitLogin.tr,
                margin: EdgeInsetsDirectional.only(
                  start: 16.w,
                  end: 16.w,
                  top: 58.h,
                ),
                onTap: () {
                  logic.toLogOut();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
