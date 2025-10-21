part of 'index.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(title: TKey.problemFeedback.tr),
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<FeedbackLogic>(
        init: FeedbackLogic(),
        builder: (logic) {
          return Column(
            children: [
              Container(
                height: 160,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(8),
                  color: Color(0xFF313540),
                ),
                width: double.maxFinite,
                child: TextField(
                  cursorColor: Colors.white,
                  expands: true,
                  maxLines: null,
                  onTapOutside: (_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  style: TextStyle(
                    color: const Color(0xFFFFFFFF),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: TKey.feedHint.tr,
                    hintStyle: TextStyle(
                      color: Color(0x73FFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    logic.feed = value;
                  },
                ),
              ),

              BaseBtnWidget(
                title: TKey.submit.tr,
                margin: EdgeInsetsDirectional.only(
                  start: 16.w,
                  end: 16.w,
                  top: 23.h,
                ),
                onTap: () {
                  if (logic.feed.isEmpty) {
                    AppLoading.showError(TKey.feedHint.tr);
                  } else {
                    AppLoading.showSuccess(TKey.successful.tr);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
