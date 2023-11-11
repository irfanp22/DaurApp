import 'package:daur_app/interface/screen/auth/register_form.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/utils/auth_utils.dart';
import 'package:daur_app/interface/widget/input_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: "Email"),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "test@email.com"),
            validator: EmailValidator(errorText: "Use a valid email!"),
            onSaved: (email) => _email = email!,
          ),
          const SizedBox(height: AppStyle.defaultPadding),
          const TextFieldName(text: "Password"),
          InputTextFormField(
            isSecureField: true,
            hint: "********",
            validation: AuthUtils.passwordValidator,
            onFieldSubmitted: (password) => _password = password!,
          ),
          const SizedBox(height: AppStyle.defaultPadding),
        ],
      ),
    );
  }
}
