import 'package:daur_app/interface/utils/app_style.dart';
import 'package:flutter/material.dart';

class WhiteSpaceWidget extends StatelessWidget {
  const WhiteSpaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.25,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        color: AppStyle.backgroundColor,
      ),
    );
  }
}
