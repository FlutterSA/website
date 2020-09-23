import 'package:flutter/cupertino.dart';
import 'package:flutterdevsa_website/src/ui/global/custom_base_view_model.dart';

class HomeViewModel extends CustomBaseViewModel {
  final ScrollController scrollController = ScrollController();

  double _scrollOffset = 0.0;
  double get scrollOffset => _scrollOffset;
  void setScrollOffset(double newValue) {
    _scrollOffset = newValue;
    notifyListeners();
  }
}
