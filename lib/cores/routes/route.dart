import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';

BuildContext? get globalContext {
  FToast fToast = FToast();
  fToast.init(Go.navigatorKey.currentContext!);
  return Go.navigatorKey.currentContext;
}

class Go {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static get currentContext {
    return navigatorKey.currentContext;
  }

  static to(Widget page) async {
    await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static toTransition(
    Widget page,
  ) async {
    await navigatorKey.currentState!
        .push(PageTransition(child: page, type: PageTransitionType.fade));
  }

  static toReplaceAnimate(
    Widget page,
  ) async {
    await navigatorKey.currentState!.pushReplacement(
        PageTransition(child: page, type: PageTransitionType.fade));
  }

  static toReplace(Widget page) async {
    await navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static back() {
    Navigator.pop(globalContext!);
  }

  static toFirstPage(page) {
    Navigator.popUntil(globalContext!, (route) => page);
  }

  static close() {
    Navigator.of(globalContext!).pop(true);
  }

  static offAll(page) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static off(Widget page) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => true,
    );
  }

  static double get width {
    return MediaQuery.of(currentContext).size.width;
  }

  static double get height {
    return MediaQuery.of(currentContext).size.width;
  }
}
