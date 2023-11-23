import 'package:daur_app/interface/screen/auth/register_form.dart';
import 'package:daur_app/interface/stateholders/reg_and_login_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Form(
        key: controller.logKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextFieldName(text: "Email"),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: "test@email.com"),
              validator: AuthUtils.emailValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (val) => controller.email.value = val!,
            ),
            const SizedBox(height: AppStyle.defaultPadding),
            const TextFieldName(text: "Password"),
            TextFormField(
              obscureText: controller.obscure.value,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: "********",
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.obscure.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    controller.obscure.value = !controller.obscure.value;
                    controller.update();
                  },
                ),
              ),
              validator: AuthUtils.passwordValidator,
              onSaved: (val) => controller.password.value = val!,
            ),
            const SizedBox(height: AppStyle.defaultPadding),
          ],
        ),
      );
    });
  }
}
