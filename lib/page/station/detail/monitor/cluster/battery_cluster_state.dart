part of 'index.dart';

sealed class UiState {}

///加载
class Loading extends UiState {}

///成功
class Complete extends UiState {
  Complete();
}

///失败
class Failure extends UiState {}

///离线
class Offline extends UiState {}
