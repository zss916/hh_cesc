part of 'index.dart';

enum MessageStatus { unRead, read, other }

class MessageCenterLogic extends GetxController with NetWorkRefreshEvent {
  UiState state = Loading();

  @override
  void onInit() {
    super.onInit();
    state = Loading();
    update();
    onNetWorkRefresh(
      onRefresh: () {
        loadData(loading: true, isDelayed: true);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
    onDisposeNetWork();
    AppLoading.dismiss();
  }

  Future<void> loadData({bool loading = true, bool? isDelayed}) async {
    if (loading) {
      state = Loading();
      update();
      if (isDelayed == true) await Future.delayed(Duration(seconds: 2));
    }

    final isConnected = await NetworkStatusService.instance.isConnected();
    if (!isConnected) {
      state = Offline();
      update();
      return;
    }
    fetchData();
  }

  Future<void> fetchData() async {
    final ApiResult<List<MessageItemEntity>> result =
        await MessageAPI.postQueryMessage();
    switch (result) {
      case ApiSuccess(:final data):
        state = data.isEmpty ? Empty() : Success<List<MessageItemEntity>>(data);
        update();
      case ApiError(:final errorState, :final msg):
        state = Failure();
        update();
        if (errorState == ErrorState.error) {
          AppLoading.toast(msg ?? "");
        } else {
          AppLoading.toast("Fail");
        }
    }
    AppEventBus.eventBus.fire(MessageEvent());
  }

  Future<void> signMsg({String? msgId, required MessageItemEntity item}) async {
    if ((msgId ?? "").isNotEmpty) {
      final value = await MessageAPI.signMessage([msgId ?? ""]);
      item.status = value ? 1 : 0;
      update();
    }
  }

  Future<void> postQueryMsgContent({
    String? msgId,
    required MessageItemEntity item,
  }) async {
    if ((msgId ?? "").isNotEmpty) {
      AppLoading.show();
      final value = await MessageAPI.postQueryMsgContent(
        msgId: msgId ?? "",
      ).whenComplete(() => AppLoading.dismiss());
      if (value != null) {
        signMsg(msgId: msgId, item: item);
        showMessageDetailDialog(
          title: value.title ?? "",
          content: value.content ?? "",
        );
      }
    }
  }
}
