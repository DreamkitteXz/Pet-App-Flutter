import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_app/components/id.dart';
import 'package:pet_app/models/vacinas.dart';

class VacinasPet extends StatelessWidget {
  final String? petId;
  const VacinasPet({this.petId});

  Future cadastroVacinas(
      String nome,
      String id,
      String tipo,
      String dataAplicacao,
      String proximaAplicacao,
      String pesoAplicacao) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Pets")
        .doc(petId)
        .collection("Vacinas")
        .doc(id)
        .set({
      "Id": id,
      "Nome da vacina": nome,
      "Data Aplicada": dataAplicacao,
      "Peso do Pet": pesoAplicacao,
      "Tipo": tipo,
      "Próxima aplicação": proximaAplicacao,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pets"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //showFormModal(context);
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Pets')
            .doc(petId)
            .collection("Vacinas")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text("Nenhum pet cadastrado ainda.");
          }

          List<Vacinas> listVac = snapshot.data!.docs.map((document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            print(data);
            return Vacinas.fromMap(data);
          }).toList();

          return ListView.builder(
            itemCount: listVac.length,
            itemBuilder: (context, index) {
              Vacinas model = listVac[index];
              print(model.dataAplicada);
              return Dismissible(
                key: ValueKey<Vacinas>(model),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  //remove(model);
                },
                child: ListTile(
                  leading: const Icon(Icons.list_alt_rounded),
                  title: Text(model.name),
                  subtitle: Text(model.tipo),
                ),
              );
            },
          );
        },
      ),
    );
    ;
  }
}
