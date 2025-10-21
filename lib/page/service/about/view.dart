part of 'index.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.aboutUs.tr),
      backgroundColor: Color(0xFF23282E),
      body: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Color(0xFF2C2F33),
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsetsDirectional.only(top: 50.h, bottom: 15.h),
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF1CC4FC), Color(0xFF2323E2)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(Assets.imgLogo, width: 48, height: 48),
                ),

                Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsetsDirectional.only(top: 0.h, bottom: 40.h),
                  width: double.maxFinite,
                  child: Text(
                    TKey.appName.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      margin: EdgeInsetsDirectional.all(16),
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Text(
                            TKey.currentVersion.tr,
                            style: TextStyle(
                              color: Color(0xDEFFFFFF),
                              fontSize: 16.sp,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "V1.0.0",
                            style: TextStyle(
                              color: Color(0xDEFFFFFF),
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      margin: EdgeInsetsDirectional.all(16),
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Text(
                            TKey.userTerms.tr,
                            style: TextStyle(
                              color: Color(0xDEFFFFFF),
                              fontSize: 16.sp,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      margin: EdgeInsetsDirectional.all(16),
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Text(
                            TKey.privatePolicy.tr,
                            style: TextStyle(
                              color: Color(0xDEFFFFFF),
                              fontSize: 16.sp,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white60,
                          ),
                        ],
                      ),
                    ),
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
