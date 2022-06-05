import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gredu_common.dart';

/*
 * GreduSnackbar
 * Created by Aditya Pratama
 * https://adit.com
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
mixin ExSnackbar {
  // —————————————————————————————————————————————————————————————————————————————
  // info
  // —————————————————————————————————————————————————————————————————————————————
  static void info({
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    String? message = ' ',
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xffF3F6FE),
    IconData? icon = Icons.info,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 8,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Color(0xFF22328F)),
      leftBarIndicatorColor: Color(0xFF22328F),
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // danger
  // —————————————————————————————————————————————————————————————————————————————
  static void danger({
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    String? message = ' ',
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFFFF4F5),
    IconData? icon = Icons.info,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 4,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.red[800]),
      leftBarIndicatorColor: Colors.red[800],
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // warning
  // —————————————————————————————————————————————————————————————————————————————
  static void warning({
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    String? message = ' ',
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFFFFDF3),
    IconData? icon = Icons.warning,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 4,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Color(0xFFF69348)),
      leftBarIndicatorColor: Color(0xFFF69348),
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // success
  // —————————————————————————————————————————————————————————————————————————————
  static void success({
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    String? message = ' ',
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFE9F5F2),
    IconData? icon = Icons.check_circle,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 4,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.green[800]),
      leftBarIndicatorColor: Colors.green[800],
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // action
  // —————————————————————————————————————————————————————————————————————————————
  static void action({
    required String message,
    required Widget button,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    Flushbar(
      title: title,
      message: message,
      duration: duration,
      mainButton: button,
    ).show(Get.context!);
  }

  static void uploading({
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
    AnimationController? progressIndicatorController,
    Color? progressIndicatorBackgroundColor,
  }) {
    Flushbar(
      title: title,
      message: message,
      icon: Icon(Icons.cloud_upload, color: Colors.blue[300]),
      duration: duration,
      showProgressIndicator: true,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
    ).show(Get.context!);
  }
}
