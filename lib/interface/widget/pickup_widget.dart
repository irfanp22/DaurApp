import 'package:flutter/material.dart';

class PickupWidget extends StatelessWidget {
  int number;
  PickupWidget({Key? key, this.number = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen $number'),
    );
  }
}
