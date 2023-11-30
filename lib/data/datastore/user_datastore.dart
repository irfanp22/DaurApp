import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daur_app/data/model/constant.dart';
import 'package:daur_app/data/model/user_model.dart';
import 'package:daur_app/interface/stateholders/history_controller.dart';
import 'package:daur_app/interface/stateholders/trash_controller.dart';
import 'package:get/get.dart';

class UserDatastore {
  final _trash = Get.find<TrashController>();
  final _hist = Get.find<HistoryController>();
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

  Future<String> findTong(dynamic item) async {
    try {
      final querySnapshot = await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('tong')
          .get();
      for (final doc in querySnapshot.docs) {
        Map<String, dynamic>? tongData = doc.data();
        if (tongData['name'] == item['name']) return tongData['uuid'];
      }
      return '';
    } catch (e) {
      print('Error: $e');
      return '';
    }
  }

  Stream<QuerySnapshot> stream() {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('tong')
        .snapshots();
  }

  Future<void> removeTong(Map<String, dynamic> item) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('tong')
          .doc(item['uuid'])
          .delete();

      _trash.trashList.remove(item);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> getTong() async {
    try {
      final querySnapshot = await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('tong')
          .get();

      _trash.trashList.clear();

      for (final doc in querySnapshot.docs) {
        final data = doc.data();
        _trash.trashList.add(data);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> getHistory(DateTime startDate, DateTime endDate) async {
    try {
      final querySnapshot = await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('transaksi')
          .where('date', isGreaterThanOrEqualTo: startDate)
          .where('date', isLessThanOrEqualTo: endDate)
          .orderBy('date', descending: true)
          .get();

      _hist.history.assignAll(querySnapshot.docs.map((doc) {
        final data = doc.data();
        return data;
      }));
      _hist.update();
    } catch (e) {
      print(e);
    }
  }
}
