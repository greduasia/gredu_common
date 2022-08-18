import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Alert'.text.black.extraBold.size(16).make(),
      ),
      body: VStack([
        'Neutral (Success / Info Alert)'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ElevatedButton(
            child: 'Title & Message'.text.make(),
            onPressed: () => ExAlert.success(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              showAsset: false,
            ),
          ).expand(),
          12.widthBox,
          ElevatedButton(
            child: 'With Image'.text.make(),
            onPressed: () => ExAlert.success(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
        ]),
        Divider().paddingSymmetric(vertical: 16),
        'Neutral (Confirmation Alert)'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ElevatedButton(
            child: 'Title & Message'.text.make(),
            onPressed: () => ExAlert.confirm(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              showAsset: false,
            ),
          ).expand(),
          12.widthBox,
          ElevatedButton(
            child: 'With Image'.text.make(),
            onPressed: () => ExAlert.confirm(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
        ]),
        Divider().paddingSymmetric(vertical: 16),
        'Error Alert'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ElevatedButton(
            child: 'Title & Message'.text.make(),
            onPressed: () => ExAlert.error(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              showAsset: false,
              titleTextColor: Colors.purple,
            ),
          ).expand(),
          12.widthBox,
          ElevatedButton(
            child: 'With Image'.text.make(),
            onPressed: () => ExAlert.error(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              titleTextColor: Colors.purple,
            ),
          ).expand(),
        ]),
        Divider().paddingSymmetric(vertical: 16),
        'Dismissible Alert (default: non-dismissible)'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ElevatedButton(
            child: 'Dismissible'.text.make(),
            onPressed: () => ExAlert.success(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              showAsset: false,
              isDismissible: true,
            ),
          ).expand(),
          12.widthBox,
          ElevatedButton(
            child: 'Non-dismissible (default)'.text.make(),
            onPressed: () => ExAlert.success(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
        ]),
        Divider().paddingSymmetric(vertical: 16),
        ElevatedButton(
          child: 'Loading'.text.make(),
          onPressed: () {
            ExLoading.show(
              imageAsset: Placeholder(
                fallbackHeight: 48,
                fallbackWidth: 48,
              ),
              message: 'asdasdsa',
              messageSize: 11,
            );
            3.seconds.delay(() {
              ExLoading.dismiss();
            });
          },
        ),
        Divider().paddingSymmetric(vertical: 16),
        HStack(
          [
            ElevatedButton(
              child: 'Snackbar'.text.make(),
              onPressed: () => controller.testDialog(),
            ),
            12.widthBox,
            ElevatedButton(
              child: 'ExInputDialog'.text.make(),
              onPressed: () => ExInputDialog.single(
                  title: 'Ini Title',
                  questionText: 'questionText',
                  helperText: 'helperText',
                  initialValue: 'initialValue',
                  onYes: (s) {
                    ExSnackbar.info(
                      message: s,
                      backgroundColor: Colors.blue[50]!,
                    );
                  }),
            ),
          ],
        ),
      ]).p16().scrollVertical(),
    );
  }
}
