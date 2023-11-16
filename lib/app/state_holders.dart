import 'package:daur_app/interface/stateholders/main_bot_nav_controller.dart';
import 'package:daur_app/interface/stateholders/trash_controller.dart';
import 'package:get/get.dart';

class StateHoldersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(TrashController());
  }
}
