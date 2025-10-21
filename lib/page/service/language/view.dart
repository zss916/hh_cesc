part of 'index.dart';

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.switchLanguage.tr),
      backgroundColor: Color(0xFF23282E),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF313540),
            ),
            margin: EdgeInsetsDirectional.only(
              start: 16.w,
              end: 16.w,
              top: 10.h,
            ),
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      ///
                    },
                    child: Container(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          Text(
                            TKey.languageZh.tr,
                            style: TextStyle(
                              color: Color(0xDEFFFFFF),
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      ///
                    },
                    child: Container(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            TKey.languageEn.tr,
                            style: TextStyle(
                              color: Color(0xDEFFFFFF),
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
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
