import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeController extends GetxController {
  void showAlert() {
    ExSnackbar.info(
      title: 'This is a title',
      message: 'Please wait ...',
      isDismissible: false,
    );
    Future.delayed(3.seconds).then((value) => ExLoading.dismiss(Get.context!));
  }

  void list() {
    final _data = <KeyVal>[];
    10.forEach((index) {
      _data.add(KeyVal(key: 'key$index', val: 'val  $index'));
    });
  }

  void grid() {
    final _data = <KeyVal>[];
    10.forEach((index) {
      _data.add(KeyVal(key: 'key$index', val: 'val  $index'));
    });
  }

  void input() {}

  void custom() {}

  void loading() {
    ExLoading.show();
    Future.delayed(3.seconds).then((value) => ExLoading.dismiss(Get.context!));
  }
}
