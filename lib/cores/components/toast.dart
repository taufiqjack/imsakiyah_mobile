import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imsakiyah_mobile/cores/components/container.dart';
import 'package:imsakiyah_mobile/cores/constants/colors_cons.dart';
import 'package:imsakiyah_mobile/widgets/common_textstyle.dart';

dynamic currentTime;

void toast(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
      gravity: ToastGravity.BOTTOM,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: black.withOpacity(0.7))]),
        child: CommonText(
          text: text,
          color: white,
        ),
      ));
}

Future showError(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.cancel,
      color: red,
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: 0,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 1.3,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showSuccess(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.check_circle,
      color: Colors.green,
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: 0,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 1.3,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showWarning(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.error,
      color: const Color.fromARGB(255, 135, 135, 135),
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: 0,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 1.3,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showCenter(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
        text: text,
        icon: Icons.info,
        color: const Color.fromARGB(179, 246, 131, 31)),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: 0,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 1.3,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showWarningCenter(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.error,
      color: const Color.fromARGB(255, 135, 135, 135),
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: 0,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 3,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showWarningBottom(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.error,
      color: const Color.fromARGB(255, 135, 135, 135),
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 8.5,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Widget _toastContent(
    {required String text, required IconData icon, required Color color}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ).rightPadded8(),
        Flexible(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        )),
      ],
    ),
  );
}

Future showErrorBottom(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.cancel,
      color: Colors.red,
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 8.5,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showSuccessBottom(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    fadeDuration: Durations.extralong1,
    child: _toastContent(
      text: text,
      icon: Icons.check_circle,
      color: Colors.green,
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 8.5,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future<bool> exitApp(ctx) async {
  DateTime now = DateTime.now();

  if (currentTime == null ||
      now.difference(currentTime!) > const Duration(seconds: 2)) {
    currentTime = now;
    toast(ctx, 'double click to exit');
    return Future.value(false);
  }
  SystemNavigator.pop();
  exit(0);
}
