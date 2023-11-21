import 'package:daur_app/interface/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AltLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            // TODO: Implement Google login logic
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            side: const BorderSide(color: AppStyle.primaryColor, width: 2),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/google.svg'),
              const SizedBox(width: 4),
              const Text(
                'Login with Google',
                style: TextStyle(fontSize: 12, color: AppStyle.headTextColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppStyle.defaultPadding * 2),
      ],
    );
  }
}
