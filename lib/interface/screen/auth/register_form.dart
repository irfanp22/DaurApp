import 'package:daur_app/interface/stateholders/reg_and_login_controller.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Form(
        key: controller.regKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextFieldName(text: "Nama Lengkap"),
            TextFormField(
              decoration: const InputDecoration(hintText: "Nama Lengkap"),
              validator: AuthUtils.namaValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (namaLengkap) =>
                  controller.namaLengkap.value = namaLengkap!,
            ),
            const SizedBox(height: AppStyle.defaultPadding),
            const TextFieldName(text: "Email"),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: "test@email.com"),
              validator: AuthUtils.emailValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (email) => controller.email.value = email!,
            ),
            const SizedBox(height: AppStyle.defaultPadding),
            const TextFieldName(text: "No HP"),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "+123487697"),
              validator: AuthUtils.phoneValidator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (noHP) => controller.noHP.value = noHP!,
            ),
            const SizedBox(height: AppStyle.defaultPadding),
            const TextFieldName(text: "Password"),
            TextFormField(
              obscureText: controller.obscure.value,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (password) => controller.password.value = password!,
              onChanged: (pass) => controller.password.value = pass,
            ),
            const SizedBox(height: AppStyle.defaultPadding),
            const TextFieldName(text: "Confirm Password"),
            TextFormField(
              obscureText: controller.obscure.value,
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
              validator: (pass) =>
                  MatchValidator(errorText: "Password do not  match")
                      .validateMatch(pass!, controller.password.value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ),
      );
    });
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppStyle.defaultPadding / 3),
      child: Text(
        text,
        style:
            const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}
