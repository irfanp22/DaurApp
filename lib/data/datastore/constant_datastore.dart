import 'package:daur_app/data/model/constant.dart';
import 'package:daur_app/interface/stateholders/catalog_controller.dart';
import 'package:daur_app/interface/stateholders/daur_hero_controller.dart';
import 'package:daur_app/interface/stateholders/drop_point_controller.dart';
import 'package:get/get.dart';

class ConstantDatastore {
  final _dhero = Get.find<DaurHeroController>();
  final _cat = Get.find<CatalogController>();
  final _drop = Get.find<DropPointController>();
  Future<void> getDaurHero() async {
    try {
      final daurHero = firestore.collection('daurHero').snapshots();
      await _dhero.setDaurHeroStream(daurHero);
    } catch (e) {
      print('Error retrieving data: $e');
      rethrow;
    }

    return;
  }

  Future<void> getCategory() async {
    try {
      final doc = await firestore.collection('constant').doc('category').get();

      if (doc.exists) {
        _cat.setCategory(doc.data());
        _cat.update();
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> getCatalog() async {
    final querySnapshot = await firestore.collection('catalog').get();

    final allData = querySnapshot.docs.map((doc) => doc.data());

    for (final data in allData) {
      Map<String, dynamic> d = {};
      d['name'] = data['name'];
      d['category'] = data['category'];
      d['price'] = data['price'];
      d['pic'] = data['pic'];
      _cat.catalog.add(d);
    }
  }

  Future<void> getDropPoint() async {
    final querySnapshot = await firestore.collection('dropPoint').get();
    final allData = querySnapshot.docs.map((doc) => doc.data());
    for (final data in allData) {
      Map<String, dynamic> d = {};
      d['name'] = data['name'];
      d['kode'] = data['kode'];
      d['latitude'] = data['geo'].latitude;
      d['longitude'] = data['geo'].longitude;
      _drop.dropPoint.add(d);
    }
  }
}
