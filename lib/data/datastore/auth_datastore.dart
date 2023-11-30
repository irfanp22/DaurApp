import 'package:daur_app/data/model/constant.dart';
import 'package:daur_app/data/model/user_model.dart';

class AuthDatastore {
  static Future<bool> initUser(UserModel user) async {
    try {
      await firestore.collection('users').doc(auth.currentUser!.uid).set({
        "id": auth.currentUser!.uid,
        "email": user.email,
        "namaLengkap": user.namaLengkap,
        "noHP": user.noHP,
        "icn": user.icn,
        "createdAt": user.createdAt,
        "activePoin": user.activePoin,
        "xp": user.xp,
        "alamat": user.alamat,
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }
}
