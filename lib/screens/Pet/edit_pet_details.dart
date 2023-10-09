import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../models/Pet.dart';
import '../create_account/design/icon_button.dart';
import '../create_account/design/theme.dart';
import '../create_account/design/widgets.dart';

class EditPetDetails extends StatefulWidget {
  final Pet pet;

  EditPetDetails({required this.pet});

  @override
  _EditPetDetailsState createState() => _EditPetDetailsState();
}

class _EditPetDetailsState extends State<EditPetDetails> {
  // Controladores dos campos que receberão as informações da vacina
  late TextEditingController _nameController;
  late TextEditingController _tipoController;
  late TextEditingController _racaController;
  late TextEditingController _corController;
  late TextEditingController _dataNascController;
  late TextEditingController _sexoController;
  late TextEditingController _chipController;
  late TextEditingController _isInteiroController;

  DateTime? _selectedDate;

  //=================================================================

  @override
  void initState() {
    super.initState();
    // Initialize the TextEditingController inside the initState method
    _nameController = TextEditingController(text: widget.pet.name);
    _tipoController = TextEditingController(text: widget.pet.tipo);
    _racaController = TextEditingController(text: widget.pet.raca);
    _corController = TextEditingController(text: widget.pet.cor);
    _dataNascController = TextEditingController(text: widget.pet.dataNasc);
    _sexoController = TextEditingController(text: widget.pet.sexo);
    _chipController = TextEditingController(text: widget.pet.chip);
    _isInteiroController = TextEditingController(text: widget.pet.isInteiro);
  }

  //=================================================================

  @override
  void dispose() {
    // Dispose the TextEditingController when the state is disposed
    _nameController.dispose();
    _tipoController.dispose();
    super.dispose();
  }

  //=================================================================
  Future cadastroPet(
      String idPet,
      String name,
      String tipo,
      String raca,
      String sexo,
      String cor,
      String dataNasc,
      String isInteiro,
      String chip) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Pets")
        .doc(idPet)
        .set({
      "Pet Id": idPet,
      "Nome do pet": name,
      "Tipo": tipo,
      "Raca": raca,
      "Sexo": sexo,
      "Cor": cor,
      "Data de Nascimento": dataNasc,
      "Inteiro ou Castrado": isInteiro,
      "Numero do Chip": chip,
    });
  }

//=================================================================
  final _formKey = GlobalKey<FormState>();

  final dropOptions1 = ['Cachorro', 'Gato'];
  final dropValue1 = ValueNotifier('');

  final dropOptions2 = ['Fêmea', 'Macho'];
  final dropValue2 = ValueNotifier('');

  final dropOptions3 = ['Inteiro', 'Castrado'];
  final dropValue3 = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            top: true,
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32, 12, 32, 32),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Registre seu Pet',
                        style: FlutterFlowTheme.of(context).displaySmall,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                        child: Text(
                          'Preencha os campos abaixo para adicionar seu Pet.',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                            controller: _nameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFD0D5DD),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFD0D5DD),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFFDA29B),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFFDA29B),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyLarge,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Insira o Nome';
                              }
                            }),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: ValueListenableBuilder(
                            valueListenable: dropValue1,
                            builder: (BuildContext context, String value, _) {
                              return DropdownButtonFormField<String>(
                                hint: const Text("Selecione o Tipo"),
                                value: (value.isEmpty) ? null : value,
                                items: dropOptions1
                                    .map((opcao) => DropdownMenuItem(
                                        value: opcao, child: Text(opcao)))
                                    .toList(),
                                onChanged: (escolha) {
                                  dropValue1.value = escolha.toString();
                                  _tipoController.text = escolha.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Tipo',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFD0D5DD),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFD0D5DD),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFFDA29B),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFFDA29B),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                validator: (value1) {
                                  if (value1 != null && value1.isEmpty) {
                                    return 'Insira o Tipo';
                                  }
                                },
                              );
                            }),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _racaController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Raça',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira a Raça';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _corController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Cor',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira a Cor';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: ValueListenableBuilder(
                            valueListenable: dropValue2,
                            builder: (BuildContext context, String value, _) {
                              return DropdownButtonFormField<String>(
                                hint: const Text("Selecione o Sexo"),
                                value: (value.isEmpty) ? null : value,
                                items: dropOptions2
                                    .map((opcao) => DropdownMenuItem(
                                        value: opcao, child: Text(opcao)))
                                    .toList(),
                                onChanged: (escolha) {
                                  dropValue2.value = escolha.toString();
                                  _sexoController.text = escolha.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Sexo',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFD0D5DD),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFD0D5DD),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFFDA29B),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFFDA29B),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Insira o Sexo';
                                  }
                                },
                              );
                            }),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          inputFormatters: [
                            MaskTextInputFormatter(mask: '##/##/####')
                          ],
                          controller: _dataNascController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Data de nascimento',
                            hintText: "dd/mm/aaaa",
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Insira a Data';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: ValueListenableBuilder(
                            valueListenable: dropValue3,
                            builder: (BuildContext context, String value, _) {
                              return DropdownButtonFormField<String>(
                                hint: const Text("Inteiro ou Castrado?"),
                                value: (value.isEmpty) ? null : value,
                                items: dropOptions3
                                    .map((opcao) => DropdownMenuItem(
                                        value: opcao, child: Text(opcao)))
                                    .toList(),
                                onChanged: (escolha) {
                                  dropValue3.value = escolha.toString();
                                  _isInteiroController.text =
                                      escolha.toString();
                                },
                                decoration: InputDecoration(
                                  labelText: 'Inteiro ou Castrado?',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFD0D5DD),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFD0D5DD),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFFDA29B),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFFDA29B),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe se o seu Pet é castrado ou Inteiro';
                                  }
                                },
                              );
                            }),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _chipController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Chip',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: FFButtonWidget(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cadastroPet(
                                  widget.pet.id,
                                  _nameController.text.trim(),
                                  _tipoController.text.trim(),
                                  _racaController.text.trim(),
                                  _sexoController.text.trim(),
                                  _corController.text.trim(),
                                  _dataNascController.text.trim(),
                                  _isInteiroController.text.trim(),
                                  _chipController.text.trim());
                              Navigator.pop(context);
                            }
                          },
                          text: 'Edite',
                          options: FFButtonOptions(
                            width: 370,
                            height: 44,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
