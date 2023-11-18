import 'package:daur_app/interface/stateholders/trash_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/setor_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrashItem {
  final String title;
  final String category;
  final double price;
  bool isSelected;

  TrashItem({
    required this.title,
    required this.category,
    required this.price,
    this.isSelected = false,
  });
}

class TrashScreen extends StatefulWidget {
  const TrashScreen({Key? key}) : super(key: key);

  @override
  _TrashScreenState createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  List<TrashItem> items = [
    TrashItem(
        title: 'Item 1',
        category: 'Category A',
        price: 19.99,
        isSelected: false),
    TrashItem(
        title: 'Item 2',
        category: 'Category B',
        price: 29.99,
        isSelected: false),
    TrashItem(
        title: 'Item 3',
        category: 'Category A',
        price: 39.99,
        isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrashController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const WhiteSpaceWidget(),
            GreenPatternBackground(half: true),
            Align(
              alignment: const Alignment(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppStyle.defaultPadding,
                  vertical: AppStyle.defaultPadding * 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Tong Sampah",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppStyle.textColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height * 0.25) / 2,
              right: 0,
              left: 0,
              child: Container(
                height: 50.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.isChecked = !controller.isChecked;
                            });
                          },
                          child: Row(
                            children: [
                              Checkbox(
                                value: controller.isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    controller.isChecked = value!;
                                  });
                                },
                              ),
                              const Text('Pilih Semua'),
                            ],
                          ),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: controller.isChecked
                          ? () {
                              setState(() {
                                controller.isChecked = false;
                              });
                            }
                          : null,
                      child: const Text('Hapus'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height * 0.25) / 2 + 50,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                color: Colors.transparent,
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: items[index].isSelected,
                        onChanged: (value) {
                          setState(() {
                            items[index].isSelected = value!;
                          });
                        },
                      ),
                      title: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Title: ${items[index].title}'),
                              Text('Category: ${items[index].category}'),
                              Text(
                                  'Price: \$${items[index].price.toStringAsFixed(2)}'),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            if (items.isNotEmpty)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SummaryWidget(items: items),
              ),
          ],
        ),
      );
    });
  }
}
