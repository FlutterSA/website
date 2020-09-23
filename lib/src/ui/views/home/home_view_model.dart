import 'package:flutter/cupertino.dart';
import 'package:flutterdevsa_website/src/app/generated/locator/locator.dart';
import 'package:flutterdevsa_website/src/app/services/url_launcher_service.dart';
import 'package:flutterdevsa_website/src/ui/global/custom_base_view_model.dart';

class HomeViewModel extends CustomBaseViewModel {
  final UrlLauncherService _urlLauncherService = locator<UrlLauncherService>();

  final ScrollController scrollController = ScrollController();

  double _scrollOffset = 0.0;
  double get scrollOffset => _scrollOffset;
  void setScrollOffset(double newValue) {
    _scrollOffset = newValue;
    notifyListeners();
  }

  Future launchTwitter() async {
    await _urlLauncherService.launchUrl(
      url: 'https://twitter.com/FlutterDevSA',
    );
  }

  Future launchGitHub() async {
    await _urlLauncherService.launchUrl(
      url: 'https://twitter.com/FlutterDevSA',
    );
  }

  Future launchInstagram() async {
    await _urlLauncherService.launchUrl(
      url: 'https://www.instagram.com/flutterdevsa/',
    );
  }
}
