import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Exchange'),
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
