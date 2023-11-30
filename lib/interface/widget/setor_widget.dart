import 'package:daur_app/interface/screen/alamat_screen.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/spacer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetorWidget extends StatelessWidget {
  final String title;
  final Widget content;

  const SetorWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title == 'Alamat Penjemputan')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => AlamatScreen()),
                    style: TextButton.styleFrom(
                      foregroundColor: AppStyle.textColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppStyle.primaryGradient,
                                AppStyle.secondaryGradient
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Icon(Icons.add,
                              size: 24, color: AppStyle.textColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            if (title != 'Alamat Penjemputan')
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            SpacerWidget(login: false, color: AppStyle.headTextColor),
            content,
          ],
        ),
      ),
    );
  }
}
