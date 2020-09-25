import 'package:flutter/material.dart';
import 'package:flutterdevsa_website/src/ui/global/ui_helpers.dart';

class AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData icon;

  const AppBarButton({
    this.title,
    @required this.onTap,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: title != null ? EdgeInsets.all(blockSize(context) * 2) : null,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
            ),
            title != null ? horizontalSpaceSmall(context) : SizedBox.shrink(),
            title != null
                ? Text(
                    title ?? '',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
