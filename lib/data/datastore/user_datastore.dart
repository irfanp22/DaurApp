import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daur_app/data/model/constant.dart';
import 'package:daur_app/data/model/user_model.dart';

class UserDatastore {
  Future<UserModel> getUserData() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userData =
          await firestore.collection('users').doc(auth.currentUser!.uid).get();
      if (userData.exists) {
        return UserModel.fromFirestore(userData, null);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
