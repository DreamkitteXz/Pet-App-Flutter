import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/screens/vacina/vacinas_screen.dart';

import '../../components/id.dart';

class AddVermifugoScreen extends StatefulWidget {
  final String? petId;

  AddVermifugoScreen({required this.petId});

  @override
  _AddVermifugoScreenState createState() => _AddVermifugoScreenState();
}

class _AddVermifugoScreenState extends State<AddVermifugoScreen> {
  // Controladores dos campos que receberão as informações da vacina
  final nameController = TextEditingController();
  final dataInicioController = TextEditingController();
  final dataFinalController = TextEditingController();
  final miliGramasController = TextEditingController();
  final quantosPorDiaController = TextEditingController();

  Future cadastroVermifugo(String nome, String id, String miliGrama,
      String dataInicio, String dataFinal, String quantPorDIa) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Pets")
        .doc(widget.petId)
        .collection("Vermifugos")
        .doc(id)
        .set({
      "Id": id,
      "Nome do vermifugo": nome,
      "Data de inicio": dataInicio,
      "Data de término": dataFinal,
      "Quantos por dia": quantPorDIa,
      "Miligramas": miliGrama,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicione um vermífugo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nome do vermífugo"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: dataInicioController,
              decoration: InputDecoration(labelText: "Data de Inicio"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: dataFinalController,
              decoration: InputDecoration(labelText: "Data de Término"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: quantosPorDiaController,
              decoration: InputDecoration(labelText: "Quantos por dia"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: miliGramasController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: "Miligramas",
                hintText: "mg",
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
                    cadastroVermifugo(
                        nameController.text.trim(),
                        gerarVerID(),
                        miliGramasController.text.trim(),
                        dataInicioController.text.trim(),
                        dataFinalController.text.trim(),
                        quantosPorDiaController.text.trim());
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
