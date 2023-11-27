import 'package:daur_app/interface/stateholders/account_controller.dart';
import 'package:daur_app/interface/stateholders/home_controller.dart';
import 'package:daur_app/interface/stateholders/main_bot_nav_controller.dart';
import 'package:daur_app/interface/stateholders/reg_and_login_controller.dart';
import 'package:daur_app/interface/stateholders/trash_controller.dart';
import 'package:get/get.dart';

class StateHoldersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(AuthController());
    Get.put(TrashController());
    Get.put(AccountController());
    Get.put(HomeController());
  }
}
