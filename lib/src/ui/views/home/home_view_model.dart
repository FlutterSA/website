import 'package:flutter/cupertino.dart';
import 'package:flutterdevsa_website/src/app/generated/locator/locator.dart';
import 'package:flutterdevsa_website/src/app/models/supervisor.dart';
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

  double _elevation = 5;
  double get elevation => _elevation;
  void setElevation(double newValue) {
    _elevation = newValue;
    notifyListeners();
  }

  List<Supervisor> _supervisorsList = <Supervisor>[
    Supervisor(
      id: '0',
      firstName: 'Yazeed',
      lastName: 'AlKhalaf',
      photoUrl: 'https://i.ibb.co/gDsMy67/me-shmagh-square.jpg',
      description: 'Flutter Developer • @YazeedAlKhalaf',
    ),
    Supervisor(
      id: '1',
      firstName: 'Mohammad',
      lastName: 'AlJasser',
      photoUrl: 'https://i.ibb.co/MPvvw0k/pp-3.jpg',
      description: 'Flutter Developer • @justmo5',
    ),
    Supervisor(
      id: '2',
      firstName: 'Abdullah',
      lastName: 'AlHejji',
      photoUrl: 'https://i.ibb.co/t38Tdz1/Dos1-SLme-400x400.jpg',
      description: 'Flutter Developer • @al7jy97',
    ),
    Supervisor(
      id: '3',
      firstName: 'Yahya',
      lastName: 'Madkhali',
      photoUrl: 'https://i.ibb.co/x29xDz1/pp-2.jpg',
      description: 'Flutter Developer • @its_meyahya',
    ),
  ];
  List<Supervisor> get supervisorsList => _supervisorsList;
  void setSupervisorsList(List<Supervisor> newValue) {
    _supervisorsList = newValue;
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
