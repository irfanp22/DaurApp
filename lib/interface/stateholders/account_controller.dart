import 'package:daur_app/data/model/constant.dart';
import 'package:daur_app/interface/screen/auth/login_screen.dart';
import 'package:daur_app/interface/stateholders/main_bot_nav_controller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

final navIndex = Get.put(MainBottomNavController());

class AccountController extends GetxController {
  Future<void> logout() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
    Get.offAll(() => const LoginScreen());
  }
}
