part of 'index.dart';

enum MessageStatus { unRead, read, other }

class MessageCenterLogic extends GetxController {
  int viewState = 0;
  List<MessageItemEntity> data = [];

  @override
  void onInit() {
    super.onInit();
    viewState = 2;
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
  }

  Future<void> loadData() async {
    final (bool isSuccessful, List<MessageItemEntity> value) =
        await MessageAPI.postQueryMessage();
    if (isSuccessful) {
      data = value;
    } else {
      AppLoading.toast("Fail");
    }
    viewState = data.isEmpty ? 1 : 0;
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
