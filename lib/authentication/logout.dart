import 'package:firebase_auth/firebase_auth.dart';

Future<String?> delogar() async {
  try {
    await FirebaseAuth.instance.signOut();
  } on FirebaseAuthException catch (e) {
    return e.code;
  }
  return null;
}
