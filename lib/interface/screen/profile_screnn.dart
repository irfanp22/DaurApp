import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';

class ProfileScrenn extends StatelessWidget {
  const ProfileScrenn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [WhiteSpaceWidget()],
        ));
  }
}
