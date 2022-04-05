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
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: VStack([]),
    );
  }
}
