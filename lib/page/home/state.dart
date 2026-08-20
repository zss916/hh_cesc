part of 'index.dart';

sealed class UiState {}

///加载
class Loading extends UiState {}

///成功
class Success<T> extends UiState {
  final T data;
  Success(this.data);
}

///失败
class Failure extends UiState {}

///离线
class Offline extends UiState {}

///空数据
class Empty extends UiState {}
