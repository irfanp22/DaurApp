import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daur_app/data/model/constant.dart';
import 'package:daur_app/interface/stateholders/daur_hero_controller.dart';

class ConstantDatastore {
  Future<void> getDaurHero() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> daurHero =
          await firestore.collection('constant').doc('catalog').get();

      if (daurHero.exists) {
        DaurHeroController().daurHero = daurHero;
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      print('Error retrieving document: $e');
      throw e;
    }
  }
}
