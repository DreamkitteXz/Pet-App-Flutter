import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/screens/vacina/vacinas_screen.dart';

import '../../components/id.dart';

class AddVacinaScreen extends StatefulWidget {
  final String? petId;

  AddVacinaScreen({required this.petId});

  @override
  _AddVacinaScreenState createState() => _AddVacinaScreenState();
}

class _AddVacinaScreenState extends State<AddVacinaScreen> {
  // Controladores dos campos que receberão as informações da vacina
  final nameController = TextEditingController();
  final tipoController = TextEditingController();
  final dataAplicadaController = TextEditingController();
  final pesoController = TextEditingController();
  final proximaAplicacaoController = TextEditingController();

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
        .doc(widget.petId)
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
        title: Text("Adicione seu Pet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nome da vacina"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: tipoController,
              decoration: InputDecoration(labelText: "Tipo da vacina"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: dataAplicadaController,
              decoration: InputDecoration(labelText: "Data Aplicada"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: proximaAplicacaoController,
              decoration: InputDecoration(labelText: "Próxima aplicação"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: pesoController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: "Peso no dia da Aplicação",
                hintText: "kg",
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar"),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    cadastroVacinas(
                        nameController.text.trim(),
                        gerarVacID(),
                        tipoController.text.trim(),
                        dataAplicadaController.text.trim(),
                        proximaAplicacaoController.text.trim(),
                        pesoController.text.trim());
                    Navigator.pop(context);
                  },
                  child: Text("Salvar"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
