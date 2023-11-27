import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetorScreen extends StatelessWidget {
  const SetorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Setor Sampah'),
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
