import 'package:form_field_validator/form_field_validator.dart';

class AuthUtils {
  static const emailError = 'Enter a valid email address';
  static const requiredField = "This field is required";

  static final passwordValidator = MultiValidator(
    [
      RequiredValidator(errorText: 'password is required'),
      MinLengthValidator(8,
          errorText: 'password must be at least 8 digits long'),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText: 'passwords must have at least one special character')
    ],
  );
}
