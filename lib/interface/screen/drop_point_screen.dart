import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropPointScreen extends StatelessWidget {
  const DropPointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Drop Point'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [WhiteSpaceWidget()],
        ));
  }
}
