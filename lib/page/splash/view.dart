part of 'index.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        backgroundColor: Color(0xFF23282E),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<SplashLogic>(
        init: SplashLogic(),
        builder: (logic) {
          return SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  Assets.imgLogo,
                  width: 77,
                  height: 85,
                  matchTextDirection: true,
                ),
                PositionedDirectional(
                  bottom: 45.h,
                  child: Text(
                    "BU JUN SHOU",
                    style: TextStyle(color: Colors.white, fontSize: 24.sp),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
