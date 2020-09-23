import 'package:flutter/material.dart';
import 'package:flutterdevsa_website/src/ui/global/ui_helpers.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/app_logo.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  final Function() onTwitterPressed;
  final Function() onGitHubPressed;
  final Function() onInstagramPressed;

  const CustomAppBar({
    Key key,
    this.scrollOffset = 0.0,
    @required this.onTwitterPressed,
    @required this.onGitHubPressed,
    @required this.onInstagramPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color: Theme.of(context)
          .primaryColor
          .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(
          onTwitterPressed: onTwitterPressed,
          onGitHubPressed: onGitHubPressed,
          onInstagramPressed: onInstagramPressed,
        ),
        desktop: _CustomAppBarDesktop(
          onTwitterPressed: onTwitterPressed,
          onGitHubPressed: onGitHubPressed,
          onInstagramPressed: onInstagramPressed,
        ),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  final Function() onTwitterPressed;
  final Function() onGitHubPressed;
  final Function() onInstagramPressed;

  const _CustomAppBarMobile({
    Key key,
    @required this.onTwitterPressed,
    @required this.onGitHubPressed,
    @required this.onInstagramPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          AppLogo(),
          horizontalSpaceXSmall(context),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _AppBarButton(
                  icon: FontAwesomeIcons.twitter,
                  onTap: onTwitterPressed,
                ),
                // horizontalSpaceXSmall(context),
                // _AppBarButton(
                //   icon: FontAwesomeIcons.github,
                //   onTap: onGitHubPressed,
                // ),
                horizontalSpaceXSmall(context),
                _AppBarButton(
                  icon: FontAwesomeIcons.instagram,
                  onTap: onInstagramPressed,
                ),
                horizontalSpaceSmall(context),
                _AppBarButton(
                  icon: ThemeModeHandler.of(context).themeMode ==
                          ThemeMode.system
                      ? FontAwesomeIcons.mobile
                      : ThemeModeHandler.of(context).themeMode == ThemeMode.dark
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  final Function() onTwitterPressed;
  final Function() onGitHubPressed;
  final Function() onInstagramPressed;

  const _CustomAppBarDesktop({
    Key key,
    @required this.onTwitterPressed,
    @required this.onGitHubPressed,
    @required this.onInstagramPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          AppLogo(),
          horizontalSpaceXSmall(context),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _AppBarButton(
                  icon: FontAwesomeIcons.twitter,
                  onTap: onTwitterPressed,
                ),
                // horizontalSpaceXSmall(context),
                // _AppBarButton(
                //   icon: FontAwesomeIcons.github,
                //   onTap: onGitHubPressed,
                // ),
                horizontalSpaceXSmall(context),
                _AppBarButton(
                  icon: FontAwesomeIcons.instagram,
                  onTap: onInstagramPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData icon;

  const _AppBarButton({
    this.title,
    @required this.onTap,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
          ),
          title != null ? horizontalSpaceXSmall(context) : SizedBox.shrink(),
          title != null
              ? Text(
                  title ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
