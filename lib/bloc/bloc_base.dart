import 'dart:async';
export 'message/message_bloc.dart';


abstract class BLoCBase {
  var _loadingController = StreamController<bool>.broadcast();
  var _bottomController = StreamController<bool>.broadcast();
  var _toTopBtnController = StreamController<bool>.broadcast();
  var _returnToTopController = StreamController<bool>.broadcast();

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<bool> get bottomStream => _bottomController.stream;
  Stream<bool> get toTopBtnStream => _toTopBtnController.stream;
  Stream<bool> get returnToTopStream => _returnToTopController.stream;

  StreamController<bool> get loadingController => _loadingController;
  StreamController<bool> get bottomController => _bottomController;
  StreamController<bool> get toTopBtnController => _toTopBtnController;
  StreamController<bool> get returnToTopController => _returnToTopController;

  loadingStart() async {
    _loadingController.sink.add(true);
  }

  loadingEnd() async {
    _loadingController.sink.add(false);
  }

  showToTopBtn() async {
    _toTopBtnController.sink.add(true);
  }

  hideToTopBtn() async {
    _toTopBtnController.sink.add(false);
  }

  returnToTop() async {
    _returnToTopController.sink.add(true);
  }

  void dispose() {
    _loadingController.close();
    _bottomController.close();
    _toTopBtnController.close();
    _returnToTopController.close();
  }
}