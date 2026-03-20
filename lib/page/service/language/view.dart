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
            child: GetBuilder<ChangeLanguageLogic>(
              init: ChangeLanguageLogic(),
              builder: (logic) {
                return ListView.builder(
                  itemCount: logic.list.length,
                  padding: EdgeInsetsDirectional.zero,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> item = logic.list[index];
                    return buildSwitchLanguage(
                      title: "${item['title']}".tr,
                      locale: item['locale'],
                      isCheck: item['isCheck'],
                      logic: logic,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchLanguage({
    required String title,
    required Locale? locale,
    required bool isCheck,
    required ChangeLanguageLogic logic,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          logic.switchLocale(locale);
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
                title,
                style: TextStyle(
                  color: isCheck ? Color(0xFF43FFFF) : Color(0xDEFFFFFF),
                  fontSize: 16,
                ),
              ),
              Spacer(),
              if (isCheck) Image.asset(Assets.imgGou),
            ],
          ),
        ),
      ),
    );
  }
}
