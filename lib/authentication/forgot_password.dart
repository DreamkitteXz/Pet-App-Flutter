import 'package:firebase_auth/firebase_auth.dart';

Future<String?> esqueciMinhaSenha({required String email}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'user-not-found':
        return 'Email não cadastrado.';
    }
    return e.code;
  }
  return null;
}
