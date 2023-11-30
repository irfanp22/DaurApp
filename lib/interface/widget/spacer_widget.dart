import 'package:daur_app/interface/utils/app_style.dart';
import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  bool login;
  Color color;
  SpacerWidget({Key? key, required this.login, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return login
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: AppStyle.defaultPadding * 2),
              Container(
                height: 1,
                width: 120,
                color: color,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "or",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 1,
                width: 120,
                color: color,
              ),
              const SizedBox(height: AppStyle.defaultPadding * 2),
            ],
          )
        : Column(
            children: [
              const SizedBox(height: AppStyle.defaultPadding),
              Container(
                height: 1,
                width: double.infinity,
                color: color,
              ),
              const SizedBox(height: AppStyle.defaultPadding),
            ],
          );
  }
}
