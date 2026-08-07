part of 'index.dart';

enum MessageStatus { unRead, read, other }

class MessageCenterLogic extends ViewStateController {
  List<MessageItemEntity> data = [];

  @override
  void onInit() {
    super.onInit();
    onLoading();
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }

  Future<void> loadData({bool loading = true, bool? isDelayed}) async {
    if (loading) {
      onLoading();
      update();
      if (isDelayed == true) await Future.delayed(Duration(seconds: 2));
    }

    final isConnected = await NetworkStatusService.instance.isConnected();
    if (!isConnected) {
      onOffline();
      update();
      return;
    }
    fetchData();
  }

  Future<void> fetchData() async {
    final (bool isSuccessful, List<MessageItemEntity> value) =
        await MessageAPI.postQueryMessage();
    if (isSuccessful) {
      data = value;
    } else {
      AppLoading.toast("Fail");
    }
    data.isEmpty ? onEmpty() : onComplete();
    update();
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
