import 'package:flutter/material.dart';

class BaseState extends ChangeNotifier {
  bool isLoading = true;
  bool isGettingMoreData = false;

  showLoading() {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
  }

  dismissLoading() {
    if (!isLoading) return;
    isLoading = false;
    notifyListeners();
  }
}
