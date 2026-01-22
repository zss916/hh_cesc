part of 'index.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: SafeArea(
        top: false,
        bottom: AppInfoService.to.isBottomPadding,
        child: Scaffold(
          appBar: AppBar(
            leading: SizedBox.shrink(),
            backgroundColor: Color(0xFF23282E),
            //systemOverlayStyle: barStyle,
          ),
          backgroundColor: Color(0xFF23282E),
          body: Container(
            padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
            child: GetBuilder<LoginLogic>(
              init: LoginLogic(),
              builder: (logic) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        top: 20.h,
                        bottom: 40.h,
                      ),
                      width: double.maxFinite,
                      child: Text(
                        TKey.loginTitle.trArgs([AppSetting.appName]),
                        style: TextStyle(color: Colors.white, fontSize: 28.sp),
                      ),
                    ),

                    InputAccount(
                      onInput: (value) {
                        logic.account = value;
                      },
                    ),

                    InputPassword(
                      isShowError: false,
                      onInput: (value) {
                        logic.password = value;
                      },
                    ),

                    CommonBtn(
                      title: TKey.login.tr,
                      onTap: () {
                        logic.toLogin();
                      },
                    ),

                    if (GetPlatform.isAndroid && !AppSetting.isOverseas)
                      Column(
                        children: [
                          SizedBox(height: 15.h),
                          CommonBtn(
                            title: TKey.guestLogin.tr,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.white24, Colors.white24],
                              ),
                              borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(50.r),
                              ),
                            ),
                            onTap: () {
                              logic.toGuestLogin();
                            },
                          ),
                        ],
                      ),

                    SizedBox(height: 20.h),
                    if (GetPlatform.isAndroid && !AppSetting.isOverseas)
                      CheckWidget()
                    else
                      PolicyWidget(
                        onPrivacyTap: () {
                          PageTools.toWeb(
                            title: TKey.privacyPolicy.tr,
                            url: AppSetting.policy,
                          );
                        },
                        onServiceTap: () {
                          PageTools.toWeb(
                            title: TKey.userAgreement.tr,
                            url: AppSetting.policy,
                          );
                        },
                      ),
                    Spacer(),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        top: 20.h,
                        start: 0,
                        end: 0,
                        bottom: 30.h,
                      ),
                      child: Text(
                        TKey.appTip.tr,
                        style: TextStyle(
                          color: Color(0x75FFFFFF),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
