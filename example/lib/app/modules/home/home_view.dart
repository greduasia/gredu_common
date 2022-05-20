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
        'Neutral'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ElevatedButton(
            child: 'Title & Message | with Image'.text.make(),
            onPressed: () => ExAlert.success(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ElevatedButton(
            child: 'Title & Message | without Image'.text.make(),
            onPressed: () => ExAlert.success(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              showAsset: false,
            ),
          ).expand(),
        ]),
        Divider().paddingSymmetric(vertical: 16),
        HStack([
          ElevatedButton(
            child: 'Title & Message | with Image'.text.make(),
            onPressed: () => ExAlert.confirm(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ElevatedButton(
            child: 'Title & Message | without Image'.text.make(),
            onPressed: () => ExAlert.error(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              showAsset: false,
              titleTextColor: Colors.purple,
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


        ElevatedButton(
          child: 'Snackbar'.text.make(),
          onPressed: () {
            ExSnackbar.info();
          },
        ),
      ]).p16().scrollVertical(),
    );
  }
}
