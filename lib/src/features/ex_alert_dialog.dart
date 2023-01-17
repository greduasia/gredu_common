// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

/*
 * ExAlert
 * Created by Aditya Pratama
 * https://adit.web.id
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
mixin ExAlert {
  /// -- example implementation --
  /// ```dart
  /// ExAlert.success(
  ///   context: Get.context!,
  ///   title: 'Hello World',
  ///   message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  ///   onYes: () => print('clicked'),
  /// );
  /// ```
  static void success({
    String svgAssetDir = 'assets/images/ic_dialog_success.svg',
    bool showAsset = true,
    String title = 'Success',
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.left,
    Color titleTextColor = Colors.black,
    String message = '',
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.left,
    Color messageTextColor = const Color(0xff596066),
    bool isDismissible = false,
    String btnOkText = 'Close',
    Color? barrierColor = Colors.black54,
    double cornerRadius = 4.0,
    Widget? additional,
    Function()? onYes,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
            // contentPadding: EdgeInsets.all(16),
            scrollable: true,
            content: VStack([
              if (showAsset)
                VStack([
                  if (svgAssetDir.isNotBlank)
                    SvgPicture.asset(svgAssetDir, width: 90, height: 90).centered()
                  else
                    SvgPicture.asset(svgAssetDir, package: 'gredu_common', width: 90, height: 90).centered(),
                  24.heightBox,
                ]),
              Text(
                title,
                style: TextStyle(fontSize: titleTextSize, fontWeight: FontWeight.bold, color: titleTextColor),
                textAlign: titleTextAlign,
                maxLines: 2,
              ).w(double.infinity),
              12.heightBox,
              Text(
                message,
                style: TextStyle(fontSize: messageTextSize, fontWeight: FontWeight.normal, color: messageTextColor, height: 1.5),
                textAlign: messageTextAlign,
              ).w(double.infinity),
              additional ?? 0.heightBox,
            ]),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                    onPressed: onYes ?? () => Get.back(),
                    child: Text(btnOkText),
                  ).pOnly(left: 12, right: 12, bottom: 12).h(55).expand(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// -- example implementation --
  /// ```dart
  /// ExAlert.error(
  ///   context: Get.context!,
  ///   title: 'Failed :"))',
  ///   message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  ///   onYes: () => print('clicked'),
  /// );
  /// ```
  static void error({
    String svgAssetDir = 'assets/images/ic_dialog_warning.svg',
    bool showAsset = true,
    String title = 'Failed',
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.left,
    Color titleTextColor = Colors.black,
    String message = '',
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.left,
    Color messageTextColor = const Color(0xff596066),
    bool isDismissible = false,
    String btnYesText = 'Close',
    Color? barrierColor = Colors.black54,
    double cornerRadius = 4.0,
    Function()? onYes,
    Widget? additional,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
            // contentPadding: EdgeInsets.all(16),
            scrollable: true,
            content: VStack([
              if (showAsset)
                VStack([
                  if (svgAssetDir.isNotBlank)
                    SvgPicture.asset(svgAssetDir, width: 90, height: 90).centered()
                  else
                    SvgPicture.asset(svgAssetDir, package: 'gredu_common', width: 90, height: 90).centered(),
                  24.heightBox,
                ]),
              Text(
                title,
                style: TextStyle(fontSize: titleTextSize, fontWeight: FontWeight.bold, color: titleTextColor),
                textAlign: titleTextAlign,
                maxLines: 2,
              ).w(double.infinity),
              12.heightBox,
              Text(
                message,
                style: TextStyle(fontSize: messageTextSize, fontWeight: FontWeight.normal, color: messageTextColor, height: 1.5),
                textAlign: messageTextAlign,
              ).w(double.infinity),
              additional ?? 0.heightBox,
            ]),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).errorColor),
                    onPressed: onYes ?? () => Get.back(),
                    child: Text(btnYesText),
                  ).pOnly(left: 12, right: 12, bottom: 12).h(55).expand(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// -- example implementation --
  /// ```dart
  /// ExAlert.confirm(
  ///   context: Get.context!,
  ///   title: 'Some Question',
  ///   message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry?',
  ///   onYes: () => print('yes clicked'),
  ///   onNo: () => print('no clicked'),
  /// );
  /// ```
  static void confirm({
    String svgAssetDir = 'assets/images/ic_dialog_warning.svg',
    bool showAsset = true,
    String title = '',
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.left,
    Color titleTextColor = Colors.black,
    String message = '',
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.left,
    Color messageTextColor = const Color(0xff596066),
    bool isDismissible = false,
    String btnNoText = 'No',
    Function()? onNo,
    String btnYesText = 'Yes',
    Function()? onYes,
    bool isWarningMode = false,
    Color? barrierColor = Colors.black54,
    double cornerRadius = 4.0,
    Widget? additional,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
            // contentPadding: EdgeInsets.all(16),
            scrollable: true,
            content: VStack([
              if (showAsset)
                VStack([
                  if (svgAssetDir.isNotBlank)
                    SvgPicture.asset(svgAssetDir, width: 90, height: 90).centered()
                  else
                    SvgPicture.asset(svgAssetDir, package: 'gredu_common', width: 90, height: 90).centered(),
                  24.heightBox,
                ]),
              Text(
                title,
                style: TextStyle(fontSize: titleTextSize, fontWeight: FontWeight.bold, color: titleTextColor),
                textAlign: titleTextAlign,
                maxLines: 2,
              ).w(double.infinity),
              12.heightBox,
              Text(
                message,
                style: TextStyle(fontSize: messageTextSize, fontWeight: FontWeight.normal, color: messageTextColor, height: 1.5),
                textAlign: messageTextAlign,
              ).w(double.infinity),
              additional ?? 0.heightBox,
            ]),
            actions: [
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: isWarningMode == true ? Theme.of(context).errorColor : Theme.of(context).primaryColor),
                      onPressed: onYes ?? () => Get.back(),
                      child: Text(btnYesText),
                    ),
                  ),
                  12.heightBox,
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: isWarningMode == true ? Theme.of(context).errorColor : Colors.black,
                        side: BorderSide(color: Color(0xff9EA9AD)),
                      ),
                      onPressed: onNo ?? () => Get.back(),
                      Widget: Text(btnNoText),
                    ),
                  ),
                  12.heightBox,
                ],
              ).pOnly(left: 12, right: 12),
            ],
          ),
        );
      },
    );
  }
}
