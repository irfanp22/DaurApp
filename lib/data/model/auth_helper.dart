import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

bool shouldUseFirebaseEmulator = false;
late final FirebaseApp app;
late final FirebaseAuth auth;

typedef OAuthSignIn = void Function();
const withSilentVerificationSMSMFA = true;
