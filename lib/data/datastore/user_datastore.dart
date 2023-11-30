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

  Future<void> setTong(item) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('tong')
          .doc(item['uuid'])
          .set(item);
      return;
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<bool> findTong(dynamic item) async {
    try {
      final querySnapshot = await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('tong')
          .get();
      for (final doc in querySnapshot.docs) {
        Map<String, dynamic>? tongData = doc.data();
        if (tongData['name'] == item['name']) return true;
      }
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Stream<QuerySnapshot> stream() {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('tong')
        .snapshots();
  }

  Future<void> removeTong(item) async {
    try {
      print(item['uuid']);
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('tong')
          .doc(item['uuid'])
          .delete();
      return;
    } catch (e) {
      print(e);
      return;
    }
  }
}
