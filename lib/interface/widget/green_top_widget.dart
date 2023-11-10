import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:daur_app/interface/utils/app_color.dart';

class GreenPatternBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          color: AppColor.primaryColor,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: SvgPicture.asset(
            "assets/icons/pattern.svg",
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
