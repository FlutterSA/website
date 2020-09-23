import 'package:flutter/material.dart';
import 'package:flutterdevsa_website/src/app/models/content.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/app_logo.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/content_header.dart';
import 'package:stacked/stacked.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/skeleton.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        return Skeleton(
          isBusy: model.isBusy,
          centerTitle: false,
          appBarTitleWidget: AppLogo(),
          bodyPadding: const EdgeInsets.all(0),
          body: Center(
            child: ListView(
              children: <Widget>[
                ContentHeader(
                  featuredContent: Content(
                    title:
                        'Flutter SA is a community for\nFlutter in Saudi Arabia!',
                    imageUrl: 'assets/images/misc/home_view_header.jpg',
                  ),
                  onMoreInfoPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
