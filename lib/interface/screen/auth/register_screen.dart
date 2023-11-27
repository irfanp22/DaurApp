import 'package:daur_app/interface/screen/auth/register_form.dart';
import 'package:daur_app/interface/stateholders/reg_and_login_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/widget/green_top_widget.dart';
import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            WhiteSpaceWidget(),
            GreenPatternBackground(),
            Align(
              alignment: const Alignment(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppStyle.defaultPadding,
                  vertical: AppStyle.defaultPadding * 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: AppStyle.defaultPadding),
                    Row(
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () => Get.back(),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Login here!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => controller.error.value.isNotEmpty
                  ? Positioned(
                      top: MediaQuery.of(context).padding.top,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                          height: 80,
                          child: MaterialBanner(
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                            content: SelectableText(controller.error.value),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  controller.error.value = '';
                                },
                                child: const Text(
                                  'dismiss',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                            contentTextStyle:
                                const TextStyle(color: Colors.white),
                            padding: const EdgeInsets.all(10),
                          )))
                  : const SizedBox(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: AppStyle.defaultPadding,
              right: AppStyle.defaultPadding,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppStyle.defaultPadding),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: AppStyle.defaultPadding * 2),
                          RegisterForm(),
                          const SizedBox(height: AppStyle.defaultPadding),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller.regKey.currentState!
                                    .validate()) {
                                  controller.regKey.currentState!.save();
                                  controller.emailAndPassword(false);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              child: const Text("Register",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(height: AppStyle.defaultPadding * 2),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
