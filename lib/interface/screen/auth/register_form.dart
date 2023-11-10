import 'package:daur_app/interface/utils/app_color.dart';
import 'package:daur_app/interface/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  late String _userName, _email, _password, _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: "Username"),
          TextFormField(
            decoration: const InputDecoration(hintText: "theflutterway"),
            validator: RequiredValidator(errorText: "Username is required"),
            onSaved: (username) => _userName = username!,
          ),
          const SizedBox(height: AppColor.defaultPadding),
          const TextFieldName(text: "Email"),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "test@email.com"),
            validator: EmailValidator(errorText: "Use a valid email!"),
            onSaved: (email) => _email = email!,
          ),
          const SizedBox(height: AppColor.defaultPadding),
          const TextFieldName(text: "Phone"),
          // Same for phone number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "+123487697"),
            validator: RequiredValidator(errorText: "Phone number is required"),
            onSaved: (phoneNumber) => _phoneNumber = phoneNumber!,
          ),
          const SizedBox(height: AppColor.defaultPadding),
          const TextFieldName(text: "Password"),

          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: "******"),
            validator: AuthUtils.passwordValidator,
            onSaved: (password) => _password = password!,
            onChanged: (pass) => _password = pass,
          ),
          const SizedBox(height: AppColor.defaultPadding),
          const TextFieldName(text: "Confirm Password"),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: "*****"),
            validator: (pass) =>
                MatchValidator(errorText: "Password do not  match")
                    .validateMatch(pass!, _password),
          ),
        ],
      ),
    );
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
      padding: const EdgeInsets.only(bottom: AppColor.defaultPadding / 3),
      child: Text(
        text,
        style:
            const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}
