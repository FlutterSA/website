import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterdevsa_website/src/app/models/content.dart';
import 'package:flutterdevsa_website/src/app/models/supervisor.dart';
import 'package:flutterdevsa_website/src/ui/global/ui_helpers.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/app_logo.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/content_header.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/custom_appbar.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/responsive.dart';
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
              onTwitterPressed: () async {
                await model.launchTwitter();
              },
              onGitHubPressed: () async {
                await model.launchGitHub();
              },
              onInstagramPressed: () async {
                await model.launchInstagram();
              },
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
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                        left: 25.0,
                      ),
                      child: Text(
                        'Supervisors:',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: model.supervisorsList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Responsive.isDesktop(context) ? 4 : 2,
                        childAspectRatio: 1 / 1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Supervisor supervisor = model.supervisorsList[index];
                        return Container(
                          height: 250,
                          width: 250,
                          margin: const EdgeInsets.all(
                            25.0,
                          ),
                          child: Card(
                            elevation: model.elevation,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                verticalSpaceXSmall(context),
                                CircleAvatar(
                                  radius:
                                      Responsive.isMobile(context) ? 40 : 75,
                                  backgroundImage: CachedNetworkImageProvider(
                                    supervisor.photoUrl,
                                  ),
                                ),
                                verticalSpaceXSmall(context),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  child: FittedBox(
                                    child: Text(
                                      '${supervisor.firstName} ${supervisor.lastName}',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${supervisor.description}',
                                  style: Theme.of(context).textTheme.caption,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
