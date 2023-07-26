/*import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pet_app/screens/Pet/home_screen.dart';

import '../components/id.dart';

showFormModal(BuildContext context) {
  // Labels à serem mostradas no Modal
  String title = "Adicionar";
  String confirmationButton = "Salvar";
  String skipButton = "Cancelar";

  // Controlador do campo que receberá o nome do Listin

  String _sexoPet = '';
  String _tipoPet = '';

  final _nameController = TextEditingController();
  final _tipoController = TextEditingController();
  final _racaController = TextEditingController();
  final _corController = TextEditingController();
  final _dataNascController = TextEditingController();
  final _sexoController = TextEditingController();
  final _chipController = TextEditingController();
  final _isInteiroController = TextEditingController();

  // Função do Flutter que mostra o modal na tela
  showModalBottomSheet(
    context: context,

    // Define que as bordas verticais serão arredondadas
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      ),
    ),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(32.0),

        // Formulário com Título, Campo e Botões
        child: ListView(
          children: [
            Text("Adicione seu Pet",
                style: Theme.of(context).textTheme.headline5),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(label: Text("Nome do Pet")),
            ),
            TextFormField(
              controller: _tipoController,
              decoration: const InputDecoration(label: Text("Tipo")),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _racaController,
              decoration: const InputDecoration(label: Text("Raça")),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _sexoController,
              decoration: const InputDecoration(label: Text("Sexo")),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _corController,
              decoration: const InputDecoration(label: Text("Cor")),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              inputFormatters: [MaskTextInputFormatter(mask: '##/##/####')],
              controller: _dataNascController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                label: Text("Data de Nascimento"),
                hintText: "dd/mm/aaaa",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _isInteiroController,
              decoration: const InputDecoration(
                label: Text("Inteiro ou Castrado"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _chipController,
              decoration: const InputDecoration(label: Text("Numero chip")),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(skipButton),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      cadastroPet(
                          gerarPetID(),
                          _nameController.text.trim(),
                          _tipoController.text.trim(),
                          _racaController.text.trim(),
                          _sexoController.text.trim(),
                          _corController.text.trim(),
                          _dataNascController.text.trim(),
                          _isInteiroController.text.trim(),
                          _chipController.text.trim());
                      Navigator.pop(context);
                    },
                    child: Text(confirmationButton)),
              ],
            )
          ],
        ),
      );
    },
  );
}*/

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../components/id.dart';
import '../screens/create_account/flutter_flow_icon_button.dart';
import '../screens/create_account/flutter_flow_theme.dart';
import '../screens/create_account/flutter_flow_widgets.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddPetWidget extends StatefulWidget {
  const AddPetWidget({Key? key}) : super(key: key);

  @override
  _AddPetWidgetState createState() => _AddPetWidgetState();
}

class _AddPetWidgetState extends State<AddPetWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameController = TextEditingController();
  final _tipoController = TextEditingController();
  final _racaController = TextEditingController();
  final _corController = TextEditingController();
  final _dataNascController = TextEditingController();
  final _sexoController = TextEditingController();
  final _chipController = TextEditingController();
  final _isInteiroController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Form(
        key: _formKey,
        child: Scaffold(
          key: scaffoldKey,
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
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 32),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                        child: Text(
                          'Preencha os campos abaixo para adicionar seu Pet.',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                            controller: _nameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD0D5DD),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD0D5DD),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFDA29B),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                            controller: _tipoController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Tipo',
                              hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD0D5DD),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD0D5DD),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFDA29B),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFDA29B),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyLarge,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Insira o Tipo';
                              }
                            }),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _racaController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Raça',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _corController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Cor',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _sexoController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Sexo',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _isInteiroController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Inteiro ou Castrado?',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _chipController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Chip',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD0D5DD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFDA29B),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: FFButtonWidget(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cadastroPet(
                                  gerarPetID(),
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
                          text: 'Adicione',
                          options: FFButtonOptions(
                            width: 370,
                            height: 44,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
