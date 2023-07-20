import 'package:flutter/material.dart';

import '../../components/id.dart';

class AddVacinaScreen extends StatefulWidget {
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
                    // Chama a função para cadastrar a vacina

                    // Fecha o modal após o cadastro
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
