import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:signature/signature.dart';

import '../../components/id.dart';
import '../create_account/flutter_flow_theme.dart';

class AddVermifugoScreen extends StatefulWidget {
  final String? petId;

  AddVermifugoScreen({required this.petId});

  @override
  _AddVermifugoScreenState createState() => _AddVermifugoScreenState();
}

class _AddVermifugoScreenState extends State<AddVermifugoScreen> {
  DateTime? _selectedDate;
  bool _mostrarReforco = false;

  // Controladores dos campos que receberão as informações da vacina
  final vermifugoController = TextEditingController();
  final primeiraDoseController = TextEditingController();
  final kiloGramaController = TextEditingController();
  final segundaDoseController = TextEditingController();
  final terceiraDoseController = TextEditingController();

  // ================================================================
  // Função de cadastro Vacina Firebase

  Future cadastroVermifugos(
    String vermifugo,
    String id,
    String primeiraDose,
    String doseReforco,
    String kiloGrama,
  ) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Pets")
        .doc(widget.petId)
        .collection("Vermifugos")
        .doc(id)
        .set({
      "Id": id,
      "Vermifugo": vermifugo,
      "Primeira Dose": primeiraDose,
      "Dose de Reforço": doseReforco,
      "Kilogramas": kiloGrama,
    });
  }
  //=================================================================

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicione um Vermifugo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ListView(
            children: [
              // =======================================================
              // TextFormField Nome da Vermifugo
              TextFormField(
                controller: vermifugoController,
                decoration: const InputDecoration(labelText: "Vermifugo"),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira o Vermifugo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // =======================================================
              // TextFormField Primeira dose
              TextFormField(
                readOnly: true,
                controller: primeiraDoseController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira a data da primeira dose';
                  }
                  return null;
                },
                onTap: () async {
                  DateTime? pickedDate = await _showDataPicker();
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      primeiraDoseController.text =
                          formatDateToString(pickedDate);
                    });
                  }
                },
                decoration: const InputDecoration(labelText: "Primeira Dose"),
              ),
              const SizedBox(height: 16),

              // =======================================================
              //checkbox dose de reforço?

              Row(
                children: [
                  Checkbox(
                    value: _mostrarReforco,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _mostrarReforco = newValue!;
                      });
                    },
                  ),
                  const Text('Dose de Reforço'),
                ],
              ),

              // =======================================================
              // TextFormField Próxima aplicação

              _mostrarReforco
                  ? TextFormField(
                      readOnly: true,
                      controller: segundaDoseController,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira a data da dose de reforço';
                        }
                        return null;
                      },
                      onTap: () async {
                        DateTime? pickedDate = await _showDataPicker();
                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                            segundaDoseController.text =
                                formatDateToString(pickedDate);
                          });
                        }
                      },
                      decoration:
                          const InputDecoration(labelText: "Dose de Reforoço"),
                    )
                  : const SizedBox(),
              const SizedBox(height: 16),

              // =================================================================
              // TextButton Cancelar
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                  const SizedBox(width: 16),
                  // ===================================================
                  // ElevatedButton Salvar
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        cadastroVermifugos(
                          vermifugoController.text.trim(),
                          gerarVerID(),
                          primeiraDoseController.text.trim(),
                          segundaDoseController.text.trim(),
                          kiloGramaController.text.trim(),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Salvar"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ===============================================================
  // Função DataPicker e Função de formatação para aparecer na Tela

  String formatDateToString(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  Future<DateTime?> _showDataPicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    return picked;
  }
  //===============================================================
}
