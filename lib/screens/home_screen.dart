import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/models/Pet.dart';
import 'package:pet_app/screens/pet_screen.dart';
import 'package:pet_app/screens/users.dart';

import '../components/id.dart';
import '../models/show_form_model.dart';

class CadastroPet extends StatefulWidget {
  const CadastroPet({Key? key}) : super(key: key);

  @override
  State<CadastroPet> createState() => _CadastroPetState();
}

class _CadastroPetState extends State<CadastroPet> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pets"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            tooltip: 'Comment',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsersDetails(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormModal(context);
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Pets')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text("Nenhum pet cadastrado ainda.");
          }

          List<Pet> listPet = snapshot.data!.docs.map((document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            print(data);
            return Pet.fromMap(data);
          }).toList();

          return ListView.builder(
            itemCount: listPet.length,
            itemBuilder: (context, index) {
              Pet model = listPet[index];
              print(model.isInteiro);
              return Dismissible(
                key: ValueKey<Pet>(model),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  remove(model);
                },
                child: ListTile(
                  leading: const Icon(Icons.list_alt_rounded),
                  title: Text(model.name),
                  subtitle: Text(model.raca),
                  onTap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetDetalhes(pet: model),
                        ),
                      )),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void remove(Pet model) {
    firestore
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Pets")
        .doc(model.id)
        .delete();
  }
}
