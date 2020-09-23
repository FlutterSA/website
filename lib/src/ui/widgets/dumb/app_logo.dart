import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double radius;

  const AppLogo({
    Key key,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 20,
      backgroundImage: AssetImage(
        'assets/images/logo/flutter_sa_logo_white.png',
      ),
    );
  }
}
