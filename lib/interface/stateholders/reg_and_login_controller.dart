import 'package:daur_app/data/model/auth_helper.dart';
import 'package:daur_app/interface/screen/main_bot_nav_screen.dart';
import 'package:daur_app/interface/widget/snackbar_err_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> regKey = GlobalKey<FormState>();
  GlobalKey<FormState> logKey = GlobalKey<FormState>();
  RxString error = ''.obs;
  RxString verificationId = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString namaLengkap = ''.obs;
  RxString noHP = ''.obs;

  RxBool isLoading = false.obs;
  RxBool obscure = true.obs;

  void setIsLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> emailAndPassword(bool login) async {
    try {
      if (login) {
        await auth.signInWithEmailAndPassword(
          email: email.value,
          password: password.value,
        );
      } else {
        await auth.createUserWithEmailAndPassword(
          email: email.value,
          password: password.value,
        );
      }

      auth.authStateChanges().listen((user) {
        if (user != null) {
          Get.offAll(() => const BottomNavBarScreen());
        }
      });
    } catch (e) {
      error.value = "AuthError: Invalid Credentials, Malformed, or has Expired";
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await auth.signInWithCredential(credential);
        auth.authStateChanges().listen((user) {
          if (user != null) {
            Get.offAll(() => const BottomNavBarScreen());
          }
        });
      }
    } catch (e) {
      error.value = 'GoogleError: $e';
    }
  }

  Future resetPassword(BuildContext context) async {
    String? email;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Send'),
            ),
          ],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter your email'),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
              ),
            ],
          ),
        );
      },
    );

    if (email != null) {
      try {
        await auth.sendPasswordResetEmail(email: email!);
        ScaffoldSnackbar.of(context).show('Password reset email is sent');
      } catch (e) {
        ScaffoldSnackbar.of(context).show('Error resetting');
      }
    }
  }
}
