part of 'index.dart';

class StationPage extends StatelessWidget {
  const StationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Text(
          TKey.station.tr,
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF23282E),
      body: GetBuilder<StationLogic>(
        init: StationLogic(),
        builder: (logic) => buildPage(
          child: buildBodyUI(state: logic.state, logic: logic),
          logic: logic,
        ),
      ),
    );
  }

  Widget buildBodyUI({required UiState state, required StationLogic logic}) {
    return switch (state) {
      Success(:final data) => buildList(data: data, logic: logic),
      Empty() => BuildEmpty(),
      Loading() => BuildLoading(),
      Offline() => BuildOffline(),
      _ => SizedBox.shrink(),
    };
  }

  Widget buildPage({required Widget child, required StationLogic logic}) =>
      Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(start: 16, end: 11, bottom: 6),
            child: Row(
              children: [
                Expanded(
                  child: SearchBarWidget(
                    logic: logic,
                    onInput: () {
                      logic.toSearch(isLoading: true);
                    },
                  ),
                ),
                SizedBox.shrink(),
              ],
            ),
          ),
          Container(
            height: 42,
            margin: EdgeInsetsDirectional.only(bottom: 3, start: 5),
            child: Row(
              children: [
                Expanded(child: SelectStatusWidget(logic: logic)),
                FilterWidget(siteStatus: logic.statusParam),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      );

  Widget buildList({
    required List<SiteEntity> data,
    required StationLogic logic,
  }) => SmartRefresher(
    header: MaterialClassicHeader(),
    footer: ClassicFooter(
      idleText: TKey.idleLoadingText.tr,
      canLoadingText: TKey.canLoadingText.tr,
      loadingText: TKey.loadingText.tr,
      noDataText: TKey.noMoreText.tr,
      failedText: TKey.loadFailedText.tr,
    ),
    enableSmartPreload: true,
    enablePullDown: true,
    enablePullUp: true,
    controller: logic.refreshCtrl,
    onRefresh: () {
      logic.refreshData();
    },
    onLoading: () {
      logic.loadMoreData();
    },
    child: ListView.separated(
      padding: EdgeInsetsDirectional.only(top: 0, bottom: 0.h),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        SiteEntity item = data[index];
        return buildItem(item, isLast: (index + 1 == data.length));
      },
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 16.h, color: Colors.transparent),
    ),
  );

  Widget buildItem(SiteEntity item, {bool isLast = false}) => GestureDetector(
    onTap: () {
      PageTools.toStationDetail(siteId: item.id, site: item);
    },
    child: Container(
      width: double.maxFinite,
      // height: 175.h,
      constraints: BoxConstraints(minHeight: 175.h),
      padding: EdgeInsetsDirectional.only(
        start: 8.w,
        end: 8.w,
        top: 14.h,
        bottom: 14.h,
      ),
      margin: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
        bottom: isLast ? 50.h : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Color(0xFF313540),
      ),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(
              bottom: 12.h,
              start: 8.w,
              end: 8.w,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.showSiteName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                ),
                //Spacer(),
                SizedBox(width: 10),
                if (item.status != null) StatusTag(status: item.status ?? 99),
                Wrap(
                  spacing: 0.w,
                  children: [
                    //if ((item.types ?? []).isNotEmpty)
                    // CommonTag(type: (item.types ?? []).first),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Color(0x14EEF2F8)),
          Container(
            margin: EdgeInsetsDirectional.only(top: 10.h, start: 8.w, end: 8.w),
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox.shrink(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "SOC  ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xA6FFFFFF),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item.showSoc,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 8.h, color: Colors.transparent),
                      TextRichWidget(
                        title: "${TKey.energyStoragePower.tr}  ",
                        value: item.showPower,
                      ),
                      Divider(height: 8.h, color: Colors.transparent),
                      TextRichWidget(
                        title: "${TKey.photovoltaicPower.tr}  ",
                        value: item.showPvPower,
                      ),
                      Divider(height: 8.h, color: Colors.transparent),
                      /* TextRichWidget(
                          title: "${TKey.chargeAndDischarge.tr}  ",
                          value: item.chargeAndRecharge,
                        ),*/
                      TextRichWidget(
                        title: "${TKey.charge.tr}  ",
                        value: item.showCharge,
                      ),
                      Divider(height: 8.h, color: Colors.transparent),
                      TextRichWidget(
                        title: "${TKey.discharge.tr}  ",
                        value: item.showRecharge,
                      ),
                    ],
                  ),
                ),
                if (item.picture == null)
                  Container(
                    width: 90.r,
                    height: 90.r,
                    //padding: EdgeInsetsDirectional.all(10),
                    decoration: BoxDecoration(color: Colors.white12),
                    child: Image.asset(
                      Assets.imgLogoText,
                      scale: 2,
                      color: Colors.white54,
                    ),
                  )
                else
                  Container(
                    width: 90.r,
                    height: 90.r,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      /*image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            item.picture ?? "",
                            errorListener: (_) {

                            },
                          ),
                        ),*/
                    ),
                    child: CachedNetworkImage(
                      imageUrl: item.picture ?? "",
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return Image.asset(
                          Assets.imgLogoText,
                          scale: 2,
                          color: Colors.white54,
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Image.asset(
                          Assets.imgLogoText,
                          scale: 2,
                          color: Colors.white54,
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
