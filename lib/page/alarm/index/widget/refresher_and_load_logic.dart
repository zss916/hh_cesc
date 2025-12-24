mixin RefresherAndLoadLogic {
  ///是否下拉加载
  bool isLoadingMore = false;

  ///是否有更多数据
  bool hasMoreData = true;

  ///定义当前的页数
  int currentPage = 1;

  ///上一次的请求时间
  DateTime? lastDateTime;
}
