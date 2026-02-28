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
        builder: (logic) {
          return Column(
            children: [
              Container(
                width: double.maxFinite,
                margin: EdgeInsetsDirectional.only(
                  start: 16,
                  end: 11,
                  bottom: 12,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchBarWidget(
                        logic: logic,
                        onInput: () {
                          logic.toSearch();
                        },
                      ),
                    ),
                    VerticalDivider(width: 9, color: Colors.transparent),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        AppEventBus.eventBus.fire(
                          OpenDrawerEvent(
                            DrawerTypeEnum.site.index,
                            siteStatus: logic.statusParam,
                          ),
                        );
                      },
                      child: Container(
                        width: 36,
                        height: 36,
                        alignment: .center,
                        decoration: BoxDecoration(
                          color: Color(0x99484D55),
                          borderRadius: .circular(50),
                        ),
                        child: UnconstrainedBox(
                          child: Image.asset(
                            Assets.imgFilter,
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: buildBody(viewState: logic.viewState, logic: logic),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildBody({required int viewState, required StationLogic logic}) {
    return switch (viewState) {
      _ when viewState == ViewStateEnum.common.index => buildList2(
        logic: logic,
      ),
      _ when viewState == ViewStateEnum.empty.index => buildEmpty(logic: logic),
      _ when viewState == ViewStateEnum.loading.index => Container(
        margin: EdgeInsetsDirectional.only(bottom: 50.h),
        child: Center(child: CircularProgressIndicator()),
      ),
      _ => SizedBox.shrink(),
    };
  }

  Widget buildEmpty({required StationLogic logic}) => SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: GestureDetector(
      onTap: () {
        logic.refreshData(isLoading: true);
      },
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
    ),
  );

  /*
  Widget buildList({required StationLogic logic}) {
    return EasyRefresh(
      header: MaterialHeader(),
      onRefresh: () => logic.refreshData(),
      onLoad: () => logic.loadMoreData(),
      child: ListView.separated(
        padding: EdgeInsetsDirectional.only(top: 0, bottom: 0.h),
        itemCount: logic.data.length,
        itemBuilder: (BuildContext context, int index) {
          SiteEntity item = logic.data[index];
          return buildItem(item);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 16, color: Colors.transparent),
      ),
    );
  }
*/

  Widget buildList2({required StationLogic logic}) {
    return SmartRefresher(
      header: MaterialClassicHeader(),
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
        // cacheExtent: 175,
        padding: EdgeInsetsDirectional.only(top: 0, bottom: 0.h),
        itemCount: logic.data.length,
        itemBuilder: (BuildContext context, int index) {
          SiteEntity item = logic.data[index];
          return buildItem(item, isLast: (index + 1 == logic.data.length));
        },
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 16.h, color: Colors.transparent),
      ),
    );
  }

  Widget buildItem(SiteEntity item, {bool isLast = false}) {
    return GestureDetector(
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
                  Container(
                    constraints: BoxConstraints(maxWidth: 150.w),
                    child: Text(
                      item.showSiteName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  ),
                  Spacer(),
                  Wrap(
                    spacing: 5.w,
                    children: [
                      //if ((item.types ?? []).isNotEmpty)
                      // CommonTag(type: (item.types ?? []).first),
                      if (item.status != null)
                        StatusTag(status: item.status ?? 99),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Color(0x14EEF2F8)),
            Container(
              margin: EdgeInsetsDirectional.only(
                top: 10.h,
                start: 8.w,
                end: 8.w,
              ),
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
                              "SOC: ",
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
                          title: "${TKey.energyStoragePower.tr}: ",
                          value: item.showPower,
                        ),
                        Divider(height: 8.h, color: Colors.transparent),
                        TextRichWidget(
                          title: "${TKey.photovoltaicPower.tr}: ",
                          value: item.showPvPower,
                        ),
                        Divider(height: 8.h, color: Colors.transparent),
                        TextRichWidget(
                          title: "${TKey.chargeAndDischarge.tr}: ",
                          value: item.chargeAndRecharge,
                        ),
                      ],
                    ),
                  ),
                  if (item.picture == null)
                    Container(
                      width: 90.r,
                      height: 90.r,
                      padding: EdgeInsetsDirectional.all(10),
                      decoration: BoxDecoration(color: Colors.white12),
                      child: Image.asset(Assets.imgLogo),
                    )
                  else
                    Container(
                      width: 90.r,
                      height: 90.r,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(item.picture ?? ""),
                        ),
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

  Widget buildItem2(SiteEntity item, {bool isLast = false}) {
    return GestureDetector(
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
                  Container(
                    constraints: BoxConstraints(maxWidth: 150.w),
                    child: Text(
                      item.showSiteName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  ),
                  Spacer(),
                  Wrap(
                    spacing: 5.w,
                    children: [
                      //if ((item.types ?? []).isNotEmpty)
                      // CommonTag(type: (item.types ?? []).first),
                      if (item.status != null)
                        StatusTag(status: item.status ?? 99),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Color(0x14EEF2F8)),
            Container(
              margin: EdgeInsetsDirectional.only(
                top: 10.h,
                start: 8.w,
                end: 8.w,
              ),
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
                              "SOC: ",
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
                        Row(
                          children: [
                            Text(
                              "${TKey.energyStoragePower.tr}: ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xA6FFFFFF),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item.showPower,
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
                        Row(
                          children: [
                            Text(
                              "${TKey.photovoltaicPower.tr}: ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xA6FFFFFF),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item.showPvPower,
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
                        Row(
                          children: [
                            Text(
                              "${TKey.chargeAndDischarge.tr}: ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xA6FFFFFF),
                              ),
                            ),
                            Expanded(
                              child: AutoSizeText(
                                item.chargeAndRecharge,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (item.picture == null)
                    Container(
                      width: 90.r,
                      height: 90.r,
                      padding: EdgeInsetsDirectional.all(10),
                      decoration: BoxDecoration(color: Colors.white12),
                      child: Image.asset(Assets.imgLogo),
                    )
                  else
                    Container(
                      width: 90.r,
                      height: 90.r,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(item.picture ?? ""),
                        ),
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
}
