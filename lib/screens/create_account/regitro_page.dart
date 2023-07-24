import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pet_app/components/id.dart';
import 'package:pet_app/authentication/component/show_snackbar.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../Pet/home_screen.dart';
import 'flutter_flow_theme.dart';
import 'flutter_flow_widgets.dart';

class RegistroPage extends StatefulWidget {
  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  //Text Controllers para o Envio dos dados

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _ruaController = TextEditingController();
  final _bairroController = TextEditingController();
  final _numeroController = TextEditingController();
  final _cepController = TextEditingController();
  final _estadoController = TextEditingController();
  final _complementoController = TextEditingController();

  Future signIn() async {
    //Auth
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _senhaController.text.trim());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return showSnackBar(
              context: context, texto: "Email já esta em uso.", isError: true);
      }
      return e.code;
    }

    //Adicionar Dados do Usuário

    addUserdatalhes(
        _nomeController.text.trim(),
        _emailController.text.trim(),
        _cpfController.text.trim(),
        _telefoneController.text.trim(),
        _senhaController.text.trim(),
        _ruaController.text.trim(),
        _bairroController.text.trim(),
        _cepController.text.trim(),
        _estadoController.text.trim(),
        _numeroController.text.trim(),
        _complementoController.text.trim());
  }

  bool _passwordVisible = false;
  void initState() {
    _passwordVisible = false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _nomeController.dispose();
    _cpfController.dispose();
    _telefoneController.dispose();
    _ruaController.dispose();
    _bairroController.dispose();
    _cepController.dispose();
    _complementoController.dispose();
    _numeroController.dispose();
    _estadoController.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40.0),

                      //===========================================================================================
                      //Textos do cabeçalho

                      // titulo
                      Text(
                        'Crie sua conta',
                        style: FlutterFlowTheme.of(context).displaySmall,
                      ),

                      // sub-texto
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                        child: Text(
                          'Preencha os campos abaixo para criar sua conta',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),

                      //===========================================================================================
                      //Nome

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _nomeController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Nome completo',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          // validator: _complementoController.textController1Validator.asValidator(context),
                        ),
                      ),

                      //===========================================================================================
                      //Email

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            hintText: 'exemplo@gmail.com',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          // validator: _complementoController.textController1Validator.asValidator(context),
                        ),
                      ),

                      //===========================================================================================
                      //CPF

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Container(
                          child: TextFormField(
                            controller: _cpfController,
                            inputFormatters: [
                              MaskTextInputFormatter(mask: '###.###.###-##')
                            ],
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'CPF',
                              hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyLarge,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Digite o CPF';
                              } else if (!isValidCPF(value)) {
                                return 'CPF inválido';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),

                      //===========================================================================================
                      //Telefone

                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _telefoneController,
                          inputFormatters: [
                            MaskTextInputFormatter(mask: '(##) # ####-####')
                          ],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Telefone',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          // validator: _complementoController.textController1Validator.asValidator(context),
                        ),
                      ),

                      //===========================================================================================
                      //Senha

                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _senhaController,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _passwordVisible = !_passwordVisible,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 22,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          //validator: _model.textController3Validator.asValidator(context),
                        ),
                      ),

                      //===========================================================================================
                      //Endereço texto

                      // Generated code for this Text Widget...
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Text(
                          'Endereço',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: 28,
                              ),
                        ),
                      ),

                      //===========================================================================================
                      //Rua

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _ruaController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Rua',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          // validator: _complementoController.textController1Validator.asValidator(context),
                        ),
                      ),

                      //===========================================================================================
                      //Bairro

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _bairroController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Bairro',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          // validator: _complementoController.textController1Validator.asValidator(context),
                        ),
                      ),

                      //===========================================================================================
                      //Numero

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _numeroController,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Número',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          // validator: _complementoController.textController1Validator.asValidator(context),
                        ),
                      ),

                      //===========================================================================================
                      //Estado

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _estadoController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Estado',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          // validator: _complementoController.textController1Validator.asValidator(context),
                        ),
                      ),

                      //===========================================================================================
                      //CEP

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _cepController,
                          inputFormatters: [
                            MaskTextInputFormatter(mask: '#####-###')
                          ],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'CEP',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          // validator: _complementoController.textController1Validator.asValidator(context),
                        ),
                      ),

                      //===========================================================================================
                      //Complemento

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _complementoController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Complemento',
                            hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                          // validator: _complementoController.textController1Validator.asValidator(context),
                        ),
                      ),

                      //===========================================================================================
                      //Botão de Cadastrar

                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                        child: FFButtonWidget(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signIn();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CadastroPet(),
                                  ));
                            }
                          },
                          text: 'Crie sua conta',
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
                      )

                      //===========================================================================================
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

  bool isValidCPF(String cpf) {
    // Remova caracteres não numéricos do CPF
    cpf = cpf.replaceAll(RegExp(r'[^\d]'), '');

    // Verifique se o CPF tem 11 dígitos
    if (cpf.length != 11) {
      return false;
    }

    // Verifique se todos os dígitos são iguais, o que torna o CPF inválido
    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
      return false;
    }

    // Calcule o primeiro dígito verificador
    int soma = 0;
    for (int i = 0; i < 9; i++) {
      soma += int.parse(cpf[i]) * (10 - i);
    }
    int resto = soma % 11;
    int digito1 = (resto < 2) ? 0 : 11 - resto;

    // Verifique o primeiro dígito verificador
    if (digito1 != int.parse(cpf[9])) {
      return false;
    }

    // Calcule o segundo dígito verificador
    soma = 0;
    for (int i = 0; i < 10; i++) {
      soma += int.parse(cpf[i]) * (11 - i);
    }
    resto = soma % 11;
    int digito2 = (resto < 2) ? 0 : 11 - resto;

    // Verifique o segundo dígito verificador
    if (digito2 != int.parse(cpf[10])) {
      return false;
    }

    // Se chegou até aqui, o CPF é válido
    return true;
  }

  //Criando uma reaproveitação do ID do Usuário
}

//Falta Criar uma pop up para falar se esta logado ou não
