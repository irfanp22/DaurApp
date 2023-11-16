import 'package:daur_app/interface/screen/trash_screen.dart';
import 'package:flutter/material.dart';

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
              Text(
                'Total Sampah',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '$itemCount items',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the action when the "Setorkan" button is pressed
              // For example, you can show a dialog or navigate to another screen
              // to complete the deposit process.
              // Replace the onPressed logic with your actual implementation.
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Setorkan'),
                    content: Text('Implement the Setorkan action here.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Setorkan'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
