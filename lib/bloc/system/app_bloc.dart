import 'package:connectivity/connectivity.dart';

import '../bloc_base.dart';

class AppBLoC extends BLoCBase {
  ///网络连接状态
  ConnectivityResult _connectivityResult;

  // 工厂模式
  factory AppBLoC() => _getInstance();

  static AppBLoC get instance => _getInstance();
  static AppBLoC _instance;

  AppBLoC._internal() {
    // 初始化
  }

  static AppBLoC _getInstance() {
    if (_instance == null) {
      _instance = AppBLoC._internal();
    }
    return _instance;
  }

  ConnectivityResult get getConnectivityResult => _connectivityResult;

  void setConnectivityResult(ConnectivityResult result) {
    _connectivityResult = result;
  }

  @override
  void dispose() {}
}
