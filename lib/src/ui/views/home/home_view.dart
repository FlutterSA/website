import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterdevsa_website/src/app/models/content.dart';
import 'package:flutterdevsa_website/src/app/models/team_member.dart';
import 'package:flutterdevsa_website/src/ui/global/ui_helpers.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/app_logo.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/appbar_button.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/content_header.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/skeleton.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

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
          appBarTitleWidget: Row(
            children: <Widget>[
              AppLogo(),
              horizontalSpaceXSmall(context),
              Text(
                'Flutter SA',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          drawer: !Responsive.isDesktop(context)
              ? Drawer(
                  child: Column(
                    children: <Widget>[
                      DrawerHeader(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AppLogo(
                              radius: 50,
                            ),
                            Text(
                              'Flutter SA',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ),
                      AppBarButton(
                        title: 'Twitter',
                        icon: FontAwesomeIcons.twitter,
                        onTap: () async {
                          await model.launchTwitter();
                        },
                      ),
                      verticalSpaceXSmall(context),
                      AppBarButton(
                        title: 'Instagram',
                        icon: FontAwesomeIcons.instagram,
                        onTap: () async {
                          await model.launchInstagram();
                        },
                      ),
                      verticalSpaceXSmall(context),
                      AppBarButton(
                        title: 'YouTube',
                        icon: FontAwesomeIcons.youtube,
                        onTap: () async {
                          await model.launchYoutube();
                        },
                      ),
                      verticalSpaceXSmall(context),
                      AppBarButton(
                        title: 'Meet Up',
                        icon: FontAwesomeIcons.meetup,
                        onTap: () async {
                          await model.launchMeetup();
                        },
                      ),
                      Divider(),
                      AppBarButton(
                        title: ThemeModeHandler.of(context)
                            .themeMode
                            .toString()
                            .split('.')[1]
                            .toUpperCase(),
                        icon: ThemeModeHandler.of(context).themeMode ==
                                ThemeMode.system
                            ? FontAwesomeIcons.mobile
                            : ThemeModeHandler.of(context).themeMode ==
                                    ThemeMode.dark
                                ? FontAwesomeIcons.sun
                                : FontAwesomeIcons.moon,
                        onTap: () {
                          if (ThemeModeHandler.of(context).themeMode ==
                              ThemeMode.system) {
                            ThemeModeHandler.of(context)
                                .saveThemeMode(ThemeMode.light);
                            return;
                          }

                          if (ThemeModeHandler.of(context).themeMode ==
                              ThemeMode.light) {
                            ThemeModeHandler.of(context)
                                .saveThemeMode(ThemeMode.dark);
                            return;
                          }

                          if (ThemeModeHandler.of(context).themeMode ==
                              ThemeMode.dark) {
                            ThemeModeHandler.of(context)
                                .saveThemeMode(ThemeMode.system);
                            return;
                          }
                        },
                      ),
                      verticalSpaceSmall(context),
                    ],
                  ),
                )
              : null,
          appBarActions: Responsive.isDesktop(context)
              ? <Widget>[
                  AppBarButton(
                    icon: FontAwesomeIcons.twitter,
                    onTap: () async {
                      await model.launchTwitter();
                    },
                  ),
                  horizontalSpaceXSmall(context),
                  AppBarButton(
                    icon: FontAwesomeIcons.instagram,
                    onTap: () async {
                      await model.launchInstagram();
                    },
                  ),
                  horizontalSpaceXSmall(context),
                  AppBarButton(
                    icon: FontAwesomeIcons.youtube,
                    onTap: () async {
                      await model.launchYoutube();
                    },
                  ),
                  horizontalSpaceXSmall(context),
                  AppBarButton(
                    icon: FontAwesomeIcons.meetup,
                    onTap: () async {
                      await model.launchMeetup();
                    },
                  ),
                  horizontalSpaceSmall(context),
                  AppBarButton(
                    icon: ThemeModeHandler.of(context).themeMode ==
                            ThemeMode.system
                        ? FontAwesomeIcons.mobile
                        : ThemeModeHandler.of(context).themeMode ==
                                ThemeMode.dark
                            ? FontAwesomeIcons.sun
                            : FontAwesomeIcons.moon,
                    onTap: () {
                      if (ThemeModeHandler.of(context).themeMode ==
                          ThemeMode.system) {
                        ThemeModeHandler.of(context)
                            .saveThemeMode(ThemeMode.light);
                        return;
                      }

                      if (ThemeModeHandler.of(context).themeMode ==
                          ThemeMode.light) {
                        ThemeModeHandler.of(context)
                            .saveThemeMode(ThemeMode.dark);
                        return;
                      }

                      if (ThemeModeHandler.of(context).themeMode ==
                          ThemeMode.dark) {
                        ThemeModeHandler.of(context)
                            .saveThemeMode(ThemeMode.system);
                        return;
                      }
                    },
                  ),
                  horizontalSpaceSmall(context),
                ]
              : null,
          bodyPadding: const EdgeInsets.all(0),
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
                  onMoreInfoPressed: () async {
                    await model.scrollController.animateTo(
                      model.scrollController.position.extentAfter,
                      duration: Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
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
                        'Team:',
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: model.teamMembersList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Responsive.isDesktop(context)
                            ? 4
                            : Responsive.isTablet(context)
                                ? 2
                                : 1,
                        childAspectRatio:
                            Responsive.isDesktop(context) ? 1 / 1 : 1 / 0.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        TeamMember teamMember = model.teamMembersList[index];
                        return Container(
                          width: 250,
                          margin: const EdgeInsets.all(
                            25.0,
                          ),
                          child: Card(
                            elevation: model.elevation,
                            child: Responsive.isDesktop(context)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      verticalSpaceXSmall(context),
                                      CircleAvatar(
                                        radius: 75,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          teamMember.photoUrl,
                                        ),
                                      ),
                                      verticalSpaceXSmall(context),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: FittedBox(
                                          child: Text(
                                            '${teamMember.firstName} ${teamMember.lastName}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          '${teamMember.description}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      horizontalSpaceXSmall(context),
                                      Expanded(
                                        flex: 1,
                                        child: CircleAvatar(
                                          radius: 75,
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                            teamMember.photoUrl,
                                          ),
                                        ),
                                      ),
                                      horizontalSpaceXSmall(context),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              child: FittedBox(
                                                child: Text(
                                                  '${teamMember.firstName} ${teamMember.lastName}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            FittedBox(
                                              child: Text(
                                                '${teamMember.description}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      horizontalSpaceSmall(context),
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
