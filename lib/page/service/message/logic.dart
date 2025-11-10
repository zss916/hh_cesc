part of 'index.dart';

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
  }
}
