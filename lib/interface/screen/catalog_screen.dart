import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogScreen extends StatefulWidget {
  CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Catalog'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
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
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // Set the background color
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              // Category/Tag
              Container(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Add your category/tag widgets here
                      Chip(label: Text('Category 1')),
                      SizedBox(width: 8),
                      Chip(label: Text('Category 2')),
                      // Add more chips as needed
                    ],
                  ),
                ),
              ),
              // List Builder
              const SizedBox(height: 10.0),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: 150.0,
                          height: 150.0,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Title:'),
                            Text('Category:'),
                            Text('Price: \$'),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
    );
  }
}
