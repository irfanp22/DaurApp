import 'package:get/get.dart';

class CatalogController extends GetxController {
  RxMap<String, dynamic> category = <String, dynamic>{}.obs;
  RxList catalog = [].obs;

  RxString selectedCategory = "All".obs;
  RxString searchQuery = "".obs;

  void setCategory(data) {
    category.addAll(data);
  }

  void addCatalog(data) {
    catalog.addAll(data);
  }

  void filterCatalog(String category) {
    selectedCategory.value = category;
    update();
  }

  getFilteredCatalog() {
    List filteredCatalog = catalog;

    if (selectedCategory.value != "All") {
      filteredCatalog = filteredCatalog
          .where((item) => item['category'] == selectedCategory.value)
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      filteredCatalog = filteredCatalog
          .where((item) =>
              item['name'].toString().toLowerCase().contains(searchQuery.value))
          .toList();
    }
    filteredCatalog.sort((a, b) => a['name'].compareTo(b['name']));
    return filteredCatalog;
  }
}
