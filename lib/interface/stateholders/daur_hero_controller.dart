import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DaurHeroController extends GetxController {
  RxList<Map<String, dynamic>> daurHero = <Map<String, dynamic>>[].obs;
  RxMap<String, dynamic> currentHero = <String, dynamic>{}.obs;
  RxMap<String, dynamic>? nextHero = <String, dynamic>{}.obs;

  setDaurHeroStream(Stream<QuerySnapshot<Map<String, dynamic>>> stream) {
    daurHero
        .sort((a, b) => (a['bonusPoin'] ?? 0).compareTo(b['bonusPoin'] ?? 3));
    daurHero.bindStream(stream.map(
      (snapshot) => snapshot.docs
          .map(
            (doc) => doc.data(),
          )
          .toList(),
    ));
  }

  void choose(currentXp) {
    for (int i = 0; i < daurHero.length; i++) {
      if (daurHero[i]['xp'] <= currentXp) {
        currentHero = (daurHero[i]).obs;

        if (i < daurHero.length - 1) {
          nextHero = (daurHero[i + 1]).obs;
        } else {
          nextHero = null;
        }
      }
    }
    update();
  }
}
