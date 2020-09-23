import 'package:flutter/material.dart';
import 'package:flutterdevsa_website/src/app/models/content.dart';
import 'package:flutterdevsa_website/src/ui/global/ui_helpers.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/app_logo.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/content_header.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/custom_appbar.dart';
import 'package:stacked/stacked.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/skeleton.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) {
        model.scrollController.addListener(() {
          model.setScrollOffset(model.scrollController.offset);
        });
      },
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
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: Size(
              screenWidth(context),
              150.0,
            ),
            child: CustomAppBar(
              scrollOffset: model.scrollOffset,
            ),
          ),
          body: CustomScrollView(
            controller: model.scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: ContentHeader(
                  featuredContent: Content(
                    title:
                        'Flutter SA is a community for\nFlutter in Saudi Arabia!',
                    imageUrl: 'assets/images/misc/home_view_header.jpg',
                  ),
                  onMoreInfoPressed: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
