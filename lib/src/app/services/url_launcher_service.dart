import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

@injectable
class UrlLauncherService {
  Future launchUrl({@required String url}) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    }
  }
}
