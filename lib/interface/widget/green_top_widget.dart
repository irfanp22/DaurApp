import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:daur_app/interface/utils/app_style.dart';

class GreenPatternBackground extends StatelessWidget {
  bool half;
  GreenPatternBackground({Key? key, this.half = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: half
              ? (MediaQuery.of(context).size.height * 0.25) / 2
              : MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          color: AppStyle.primaryColor,
        ),
        if (!half)
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/icons/pattern.svg",
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        Container(
          height: half
              ? (MediaQuery.of(context).size.height * 0.25) / 2
              : MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppStyle.primaryColor, Colors.transparent],
              stops: [0.12, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        )
      ],
    );
  }
}
