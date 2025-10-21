part of 'index.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        backgroundColor: Color(0xFF23282E),
      ),
      backgroundColor: Color(0xFF23282E),
      body: Container(
        padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
        child: Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(top: 20.h, bottom: 40.h),
              width: double.maxFinite,
              child: Text(
                TKey.loginTitle.tr,
                style: TextStyle(color: Colors.white, fontSize: 28.sp),
              ),
            ),

            InputAccount(
              onInput: (value) {
                //
              },
            ),

            InputPassword(
              isShowError: true,
              onInput: (value) {
                //
              },
            ),

            SizedBox(height: 18.h),

            CommonBtn(title: TKey.login.tr, onTap: () {}),

            SizedBox(height: 20.h),

            PolicyWidget(onPrivacyTap: () {}, onServiceTap: () {}),
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
                style: TextStyle(color: Color(0x75FFFFFF), fontSize: 12.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
