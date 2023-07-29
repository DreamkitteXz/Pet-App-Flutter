import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pet_app/screens/vacina/vacinas_screen.dart';
import 'package:pet_app/components/data_picker.dart';
import 'package:signature/signature.dart';

import '../../components/id.dart';
import '../create_account/flutter_flow_theme.dart';

class AddVacinaScreen extends StatefulWidget {
  final String? petId;

  AddVacinaScreen({required this.petId});

  @override
  _AddVacinaScreenState createState() => _AddVacinaScreenState();
}

class _AddVacinaScreenState extends State<AddVacinaScreen> {
  // Controladores dos campos que receberão as informações da vacina
  final nameController = TextEditingController();
  final dataAplicadaController = TextEditingController();
  final pesoController = TextEditingController();
  final proximaAplicacaoController = TextEditingController();
  final nomeVetController = TextEditingController();
  final crmvController = TextEditingController();

  DateTime? _selectedDate;

  //=================================================================
  //Definições do FireBase Storage

  // ================================================================
  // Função de cadastro Vacina Firebase

  Future cadastroVacinas(
    String vacina,
    String id,
    String dataAplicacao,
    String proximaAplicacao,
    String pesoAplicacao,
    String nomeVet,
    String crmv,
    String imagemRotulo,
  ) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Pets")
        .doc(widget.petId)
        .collection("Vacinas")
        .doc(id)
        .set({
      "Id": id,
      "Vacina": vacina,
      "Data Aplicada": dataAplicacao,
      "Peso do Pet": pesoAplicacao,
      "Próxima aplicação": proximaAplicacao,
      "Nome do Veterinário(a)": nomeVet,
      "CRMV do Veterinário(a)": crmv,
      "Imagem do Rótulo": imagemRotulo,
    });
  }
  //=================================================================

  final _formKey = GlobalKey<FormState>();
  File? _selectedImage; // Variável para armazenar a imagem selecionada

  String imageURL = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicione uma Vacina"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ListView(
            children: [
              // =======================================================
              // TextFormField Nome da vacina
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Vacina"),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira a Vacina';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // =======================================================
              // TextFormField Data Aplicada
              TextFormField(
                readOnly: true,
                controller: dataAplicadaController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira a data aplicada';
                  }
                  return null;
                },
                onTap: () async {
                  DateTime? pickedDate = await _showDataPicker();
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      dataAplicadaController.text =
                          formatDateToString(pickedDate);
                    });
                  }
                },
                decoration: const InputDecoration(labelText: "Data Aplicada"),
              ),
              const SizedBox(height: 16),
              // =======================================================
              // TextFormField Próxima aplicação
              TextFormField(
                readOnly: true,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira a data da próxima aplicação';
                  }
                  return null;
                },
                controller: proximaAplicacaoController,
                onTap: () async {
                  DateTime? pickedDate = await _showDataPicker();
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      proximaAplicacaoController.text =
                          formatDateToString(pickedDate);
                    });
                  }
                },
                decoration:
                    const InputDecoration(labelText: "Próxima aplicação"),
              ),
              const SizedBox(height: 16),
              // =================================================================
              // TextFormField Peso no dia da Aplicação
              TextFormField(
                controller: pesoController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira a Peso';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Peso no dia da Aplicação",
                  //hintText: "kg",
                  suffix: Text('kg'),
                ),
              ),
              const SizedBox(height: 16),

              //==================================================================
              // Botão camera Upload

              ElevatedButton(
                onPressed: () async {
                  //==============================================================
                  //Abrir a camera
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.camera);

                  if (file == null) return;

                  String uniqueFileName =
                      DateTime.now().microsecondsSinceEpoch.toString();

                  //==============================================================
                  //Upload para o Firebase Storage

                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirRoot = referenceRoot.child('images');
                  Reference referenceImageToUpload =
                      referenceDirRoot.child(uniqueFileName);

                  //==============================================================
                  //Tratando os erros

                  try {
                    //Guardar a imagem

                    await referenceImageToUpload.putFile(File(file!.path));

                    //download url

                    imageURL = await referenceImageToUpload.getDownloadURL();

                    setState(() {});
                  } catch (error) {}

                  //==============================================================
                },
                child: const Text("Imagem do Rótulo da vacina"),
              ),
              const SizedBox(height: 16),

              //==================================================================
              // Dados do Veterinário text

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                child: Text(
                  'Dados do Veterinário',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        fontSize: 24,
                      ),
                ),
              ),

              //==================================================================
              //Nome do Veterinário

              TextFormField(
                controller: nomeVetController,
                decoration: const InputDecoration(labelText: "Veterinário(a)"),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira o Nome do(a) veterinário(a)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              //==================================================================
              //CRMV

              TextFormField(
                controller: crmvController,
                decoration: const InputDecoration(labelText: "CRMV"),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira o CRMV';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              //==================================================================

              if (imageURL.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageURL,
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                )
              else
                const SizedBox(),

              //====================================================================
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                child: Text(
                  'Dados do Veterinário',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        fontSize: 24,
                      ),
                ),
              ),

              //==================================================================
              //Signature

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                child: Text(
                  'Assinatura do Veterinário(a)',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        fontSize: 20,
                      ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).background,
                    ),
                  ),
                  child: ClipRect(
                    child: Signature(
                      controller: SignatureController(
                        penStrokeWidth: 2,
                        penColor: FlutterFlowTheme.of(context).primaryText,
                        exportBackgroundColor: Colors.white,
                      ),
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      height: 150,
                    ),
                  ),
                ),
              ),

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
                      print(imageURL);
                      if (imageURL.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Faça o upload da imagem')));
                      }
                      if (_formKey.currentState!.validate()) {
                        cadastroVacinas(
                          nameController.text.trim(),
                          gerarVacID(),
                          dataAplicadaController.text.trim(),
                          proximaAplicacaoController.text.trim(),
                          pesoController.text.trim(),
                          nomeVetController.text.trim(),
                          crmvController.text.trim(),
                          imageURL,
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
