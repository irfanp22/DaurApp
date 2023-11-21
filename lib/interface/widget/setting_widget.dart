import 'package:daur_app/interface/utils/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double progressValue;
  final VoidCallback onPressed;

  const SettingWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.progressValue,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: AppStyle.defaultPadding,
            vertical: AppStyle.defaultPadding,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 40,
              color: AppStyle.primaryColor,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(text,
                      style: const TextStyle(color: AppStyle.headTextColor)),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progressValue,
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              size: 40,
              color: AppStyle.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
