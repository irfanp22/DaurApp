import 'package:daur_app/data/datastore/user_datastore.dart';
import 'package:daur_app/data/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxNum expenses = RxNum(0);
  RxNum incomes = RxNum(0);
  UserModel? usr;
  RxBool isLoading = false.obs;
  RxMap hero = {}.obs;
  Future<void> setUserData() async {
    try {
      isLoading.value = true;
      update();
      usr = await UserDatastore().getUserData();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
      if (usr != null) {
        print(usr);
      } else {
        print("User data is null");
      }
    }
  }
}
