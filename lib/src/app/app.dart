import 'package:flutter/material.dart';
import 'package:flutterdevsa_website/src/app/generated/locator/locator.dart';
import 'package:flutterdevsa_website/src/app/generated/router/router.gr.dart'
    as RouterGR;
import 'package:stacked_services/stacked_services.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter SA",
      initialRoute: RouterGR.Routes.startupView,
      onGenerateRoute: RouterGR.Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xffffffff),
        accentColor: Color(0xff2eb556),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Color(0xff2eb556),
      ),
    );
  }
}
