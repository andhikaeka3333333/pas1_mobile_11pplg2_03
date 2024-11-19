import 'package:get/get.dart';

class ResponsifController extends GetxController {
  var screenWidth = 0.0.obs;

  // method untuk update var screen width
  void updateScreenWidth(double width) {
    screenWidth.value = width;
    print("lebar layar : " + width.toString());
  }

  bool isMobile() => screenWidth.value < 600;
  bool isTablet() => screenWidth.value >= 600 && screenWidth.value < 1200;

}
