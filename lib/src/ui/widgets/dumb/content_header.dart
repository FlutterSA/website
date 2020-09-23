import 'package:flutter/material.dart';
import 'package:flutterdevsa_website/src/app/models/content.dart';
import 'package:flutterdevsa_website/src/ui/global/ui_helpers.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  final Function() onMoreInfoPressed;

  const ContentHeader({
    Key key,
    @required this.featuredContent,
    @required this.onMoreInfoPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(
        featuredContent: featuredContent,
        onMoreInfoPressed: onMoreInfoPressed,
      ),
      desktop: _ContentHeaderDesktop(
        featuredContent: featuredContent,
        onMoreInfoPressed: onMoreInfoPressed,
      ),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;
  final Function() onMoreInfoPressed;

  const _ContentHeaderMobile({
    Key key,
    @required this.featuredContent,
    @required this.onMoreInfoPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                featuredContent.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 350,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                featuredContent.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              verticalSpaceXSmall(context),
              Row(
                children: <Widget>[
                  FlatButton.icon(
                    padding: const EdgeInsets.fromLTRB(
                      25.0,
                      10.0,
                      30.0,
                      10.0,
                    ),
                    onPressed: onMoreInfoPressed,
                    icon: const Icon(
                      FontAwesomeIcons.infoCircle,
                      size: 30.0,
                    ),
                    label: Text(
                      'More Info',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatelessWidget {
  final Content featuredContent;
  final Function() onMoreInfoPressed;

  const _ContentHeaderDesktop({
    Key key,
    @required this.featuredContent,
    @required this.onMoreInfoPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          height: 600,
          width: double.infinity,
          child: Image.asset(
            featuredContent.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: -1.0,
          left: 0,
          right: 0,
          child: Container(
            height: 600,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Positioned(
          left: 60.0,
          right: 60.0,
          bottom: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                featuredContent.title,
                style: Theme.of(context).textTheme.headline3.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              verticalSpaceXSmall(context),
              Row(
                children: <Widget>[
                  FlatButton.icon(
                    padding: const EdgeInsets.fromLTRB(
                      25.0,
                      10.0,
                      30.0,
                      10.0,
                    ),
                    onPressed: onMoreInfoPressed,
                    icon: const Icon(
                      FontAwesomeIcons.infoCircle,
                      size: 30.0,
                    ),
                    label: Text(
                      'More Info',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
