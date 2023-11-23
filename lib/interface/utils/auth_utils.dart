import 'package:form_field_validator/form_field_validator.dart';

class AuthUtils {
  static final passwordValidator = MultiValidator(
    [
      RequiredValidator(errorText: 'password is required'),
      MinLengthValidator(8,
          errorText: 'password must be at least 8 digits long'),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText:
              'password must have at least one special character\n # ? ! @  \$ % ^ & * -')
    ],
  );

  static final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'email is required'),
    EmailValidator(errorText: "Use a valid email!")
  ]);
  static final namaValidator = MultiValidator([
    RequiredValidator(errorText: 'Nama Lengkap is required'),
    PatternValidator(
      r'^[a-zA-ZÀ-ÿ\u00f1\u00d1\s\.\-]+$',
      errorText: 'Use a valid Nama Lengkap',
    )
  ]);
  static final phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'No HP is required'),
    PatternValidator(
      r'^[0-9+()\s-]+$',
      errorText: 'Use a valid No HP',
    )
  ]);
}
