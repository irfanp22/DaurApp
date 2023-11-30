import 'package:daur_app/data/datastore/constant_datastore.dart';
import 'package:daur_app/data/datastore/user_datastore.dart';
import 'package:daur_app/interface/stateholders/catalog_controller.dart';
import 'package:daur_app/interface/stateholders/trash_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/stream_catalog_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CatalogScreen extends StatefulWidget {
  CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final _data = ConstantDatastore();
  final _usr = UserDatastore();
  final _cat = Get.find<CatalogController>();
  final _trash = Get.find<TrashController>();

  @override
  void initState() {
    super.initState();
    _data.getCategory();
    _data.getCatalog();
    _usr.getTong();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Catalog'),
        ),
        body: Stack(
          children: [
            WhiteSpaceWidget(
              cat: true,
            ),
            GreenPatternBackground(cat: true),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        controller.searchQuery.value = value.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search by name...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.category.isEmpty
                      ? const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [Chip(label: Text('Loading...'))],
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: controller.category.entries
                                .map((MapEntry<String, dynamic> entry) {
                              var list = entry.value as List?;

                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        controller.filterCatalog('All'),
                                    child: Chip(
                                      label: const Text('All'),
                                      backgroundColor:
                                          controller.selectedCategory.value ==
                                                  'All'
                                              ? AppStyle.secondaryGradient
                                              : null,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  ...(list
                                          ?.map((item) => Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => controller
                                                        .filterCatalog(item),
                                                    child: Chip(
                                                      label: Text('$item'),
                                                      backgroundColor: controller
                                                                  .selectedCategory
                                                                  .value ==
                                                              item
                                                          ? AppStyle
                                                              .secondaryGradient
                                                          : null,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                ],
                                              ))
                                          .toList() ??
                                      []),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                ),
                const SizedBox(height: 10.0),
                if (controller.getFilteredCatalog().length > 0)
                  const Text('Ketuk 2x untuk menambahkan'),
                Flexible(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: controller.getFilteredCatalog().length,
                    itemBuilder: (context, index) {
                      final item = controller.getFilteredCatalog()[index];
                      return Card(
                        elevation: 5,
                        child: InkWell(
                          onDoubleTap: () async {
                            final data = item;
                            final list = _trash.trashList;

                            final cek = await _usr.findTong(item);
                            (cek.isEmpty)
                                ? data['uuid'] = const Uuid().v4()
                                : data['uuid'] = cek;
                            cek.isEmpty
                                ? _usr.setTong(data)
                                : _usr.removeTong(data);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  item['pic'],
                                  width: 150.0,
                                  height: 105.0,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 2.5),
                                Text(
                                  item['name'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppStyle.headTextColor,
                                      ),
                                ),
                                Text(
                                  item['category'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black38,
                                      ),
                                ),
                                Text(
                                  '${item['price'].toString()} Poin',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppStyle.primaryColor,
                                      ),
                                ),
                                StreamCatalogWidget(catalogData: item['name'])
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _cat.catalog = [].obs;
    super.dispose();
  }
}
