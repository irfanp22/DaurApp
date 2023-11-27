import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool shouldUseFirebaseEmulator = false;
late final FirebaseApp app;
late final FirebaseAuth auth;

final FirebaseFirestore firestore = FirebaseFirestore.instance;
