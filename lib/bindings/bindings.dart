import 'package:get/get.dart';
import '../controller/dashboard_controller.dart';
import '../controller/favorite_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => FavoriteController());

  }
}