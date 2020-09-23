import 'package:flutter/material.dart';
import 'package:flutterdevsa_website/src/ui/global/ui_helpers.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/app_logo.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({
    Key key,
    this.scrollOffset = 0.0,
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
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
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
                  onTap: () => print('Twitter'),
                ),
                horizontalSpaceXSmall(context),
                _AppBarButton(
                  icon: FontAwesomeIcons.github,
                  onTap: () => print('GitHub'),
                ),
                horizontalSpaceXSmall(context),
                _AppBarButton(
                  icon: FontAwesomeIcons.instagram,
                  onTap: () => print('Instagram'),
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
                  onTap: () => print('Twitter'),
                ),
                horizontalSpaceXSmall(context),
                _AppBarButton(
                  icon: FontAwesomeIcons.github,
                  onTap: () => print('GitHub'),
                ),
                horizontalSpaceXSmall(context),
                _AppBarButton(
                  icon: FontAwesomeIcons.instagram,
                  onTap: () => print('Instagram'),
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
