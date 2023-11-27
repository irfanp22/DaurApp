import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaurHeroScreen extends StatelessWidget {
  const DaurHeroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Daur Hero'),
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
