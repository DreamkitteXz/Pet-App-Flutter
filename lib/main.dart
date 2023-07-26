import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/screens/Login/login.dart';
import 'package:pet_app/screens/Pet/home_screen.dart';
import 'package:pet_app/screens/users.dart';
import 'package:pet_app/screens/welcome/welcome.dart';
import 'screens/create_account/regitro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  //firestore.collection('Só para testar').doc('Estou testando!').set({
  //  'funcionou?': true,
  //});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePageWidget(),
    );
  }
}

class RoteadorTelas extends StatelessWidget {
  const RoteadorTelas({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return const CadastroPet();
        } else {
          return LoginWidget();
        }
      },
    );
  }
}
