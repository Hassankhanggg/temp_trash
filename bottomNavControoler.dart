import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int index;
  @override
  void onInit() {
    super.onInit();
    this.index = 0;
  }

  toggleElement(int i) {
    this.index = i;
    update();
  }
}
