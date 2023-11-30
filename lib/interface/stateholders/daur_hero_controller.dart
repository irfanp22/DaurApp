import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DaurHeroController extends GetxController {
  late RxList<Map<String, dynamic>> daurHero = <Map<String, dynamic>>[].obs;

  Future<void> setDaurHeroStream(
      Stream<QuerySnapshot<Map<String, dynamic>>> stream) {
    daurHero.bindStream(stream.map(
      (snapshot) => snapshot.docs
          .map(
            (doc) => doc.data(),
          )
          .toList(),
    ));

    return Future.value(null);
  }
}
