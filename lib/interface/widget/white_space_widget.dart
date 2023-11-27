import 'package:daur_app/interface/utils/app_style.dart';
import 'package:flutter/material.dart';

class WhiteSpaceWidget extends StatelessWidget {
  bool cat;
  WhiteSpaceWidget({Key? key, this.cat = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cat
          ? MediaQuery.of(context).size.height
          : MediaQuery.of(context).size.height * 0.75,
      color: AppStyle.backgroundColor,
    );
  }
}
