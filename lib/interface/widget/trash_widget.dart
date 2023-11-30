import 'package:daur_app/interface/screen/setor_screen.dart';
import 'package:daur_app/interface/screen/trash_screen.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryWidget extends StatelessWidget {
  final List<TrashItem> items;

  SummaryWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    int itemCount = items.length;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Sampah',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppStyle.primaryColor),
              ),
              Text(
                '$itemCount items',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppStyle.primaryColor),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => SetorScreen(
                    items: items,
                  ));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Setorkan',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
