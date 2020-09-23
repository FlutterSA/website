import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutterdevsa_website/src/ui/views/startup/startup_view.dart';
import 'package:flutterdevsa_website/src/ui/views/home/home_view.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView, path: "/loading", initial: true),
    AdaptiveRoute(page: HomeView, path: "/"),
  ],
)
class $Router {}
