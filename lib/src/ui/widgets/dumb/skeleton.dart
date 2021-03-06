import 'package:flutter/material.dart';
import 'package:flutterdevsa_website/src/ui/global/ui_helpers.dart';
import 'package:flutterdevsa_website/src/ui/widgets/dumb/busy.dart';

class Skeleton extends StatelessWidget {
  final bool isBusy;
  final Color backgroundColor;
  final String appBarTitle;
  final TextStyle appBarTitleStyle;
  final PreferredSize appBar;
  final Widget body;
  final Widget floatingActionButton;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget belowOverlayChild;
  final List<Widget> appBarActions;
  final Widget appBarLeading;
  final Widget drawer;
  final Widget endDrawer;
  final Widget bottomNavigationBar;
  final Widget bottomSheet;
  final EdgeInsets bodyPadding;
  final Widget appBarTitleWidget;
  final BoxConstraints constraints;
  final bool centerTitle;
  final String busyText;
  final bool extendBody;
  final bool extendBodyBehindAppBar;

  const Skeleton({
    Key key,
    @required this.isBusy,
    this.backgroundColor,
    this.appBarTitle,
    this.appBarTitleStyle,
    this.appBar,
    @required this.body,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.belowOverlayChild,
    this.appBarActions,
    this.appBarLeading,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.bodyPadding,
    this.appBarTitleWidget,
    this.constraints,
    this.centerTitle = false,
    this.busyText,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isBusy,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              extendBody: extendBody,
              extendBodyBehindAppBar: extendBodyBehindAppBar,
              appBar: appBar ??
                  ((appBarTitle != null || appBarTitleWidget != null)
                      ? AppBar(
                          iconTheme: IconThemeData(
                            color: Theme.of(context).accentColor,
                          ),
                          actionsIconTheme: IconThemeData(
                            color: Theme.of(context).accentColor,
                          ),
                          leading: appBarLeading,
                          actions: appBarActions,
                          elevation: 5,
                          centerTitle: centerTitle,
                          title: appBarTitleWidget ??
                              Text(
                                appBarTitle,
                                style: appBarTitleStyle ??
                                    TextStyle(
                                      fontSize: blockSize(context) * 3,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                        )
                      : null),
              body: SafeArea(
                child: Container(
                  padding: bodyPadding ??
                      EdgeInsets.fromLTRB(
                        blockSize(context) * 2,
                        blockSize(context) * 2,
                        blockSize(context) * 2,
                        blockSize(context) * 2,
                      ),
                  child: body,
                ),
              ),
              floatingActionButton: floatingActionButton ?? null,
              floatingActionButtonAnimator: floatingActionButtonAnimator,
              floatingActionButtonLocation: floatingActionButtonLocation,
              drawer: drawer,
              endDrawer: endDrawer,
              bottomNavigationBar: bottomNavigationBar,
              bottomSheet: bottomSheet,
            ),
          ),
          isBusy
              ? Busy(
                  text: busyText,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
