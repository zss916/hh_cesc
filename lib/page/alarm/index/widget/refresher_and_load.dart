import 'package:cescpro/http/bean/alarm_item_entity.dart';
import 'package:cescpro/page/alarm/index/index.dart';
import 'package:cescpro/page/alarm/index/widget/alarm_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RefresherAndLoad extends StatefulWidget {
  final AlarmLogic logic;
  const RefresherAndLoad({super.key, required this.logic});

  @override
  _RefresherAndLoadState createState() => _RefresherAndLoadState();
}

class _RefresherAndLoadState extends State<RefresherAndLoad>
    with AutomaticKeepAliveClientMixin {
  //滑动控制器
  late ScrollController scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(() {
      //获取一下 ListView 最大可滑动的距离
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      //获取一下当前滑动的距离
      double pixels = scrollController.position.pixels;
      double screenHeight = MediaQuery.of(context).size.height;
      //判断是否滑动到底部
      if (pixels >= maxScrollExtent - screenHeight &&
          !widget.logic.isLoadingMore) {
        //判断是否接近底部（距离底部小于阈值）
        //加载更多
        widget.logic.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        ///刷新成功
        await widget.logic.onRefresh();
      },
      child: ListView.separated(
        //滑动模式 （垂直）
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        //滑动控制器
        controller: scrollController,
        padding: EdgeInsetsDirectional.only(top: 0, bottom: 0.h),
        itemCount: widget.logic.data.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == widget.logic.data.length - 1 &&
              widget.logic.isLoadingMore) {
            return buildLoadMoreLoading();
          } else if (index == widget.logic.data.length - 1 &&
              !widget.logic.hasMoreData) {
            return buildNoMoreData();
          } else {
            AlarmItemEntity item = widget.logic.data[index];
            return AlarmItem(
              item: item,
              isLast: (index + 1 == widget.logic.data.length),
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 16, color: Colors.transparent),
      ),
    );
  }

  ///底部loading
  Widget buildLoadMoreLoading() => Container(
    margin: EdgeInsetsDirectional.only(bottom: 100.h),
    width: double.maxFinite,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
        ),
      ],
    ),
  );

  ///底部无更多数据
  Widget buildNoMoreData() => Container(
    margin: EdgeInsetsDirectional.only(bottom: 100.h),
    width: double.maxFinite,
    child: Text("", style: TextStyle(color: Colors.white)),
  );
}
