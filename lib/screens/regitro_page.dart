import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/screens/home_screen.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';
import 'package:pet_app/models/Pet.dart';
import 'package:pet_app/components/id.dart';
import 'package:pet_app/authentication/component/show_snackbar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro do Tutor'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40.0),
              TextFormField(
                controller: _nomeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o seu nome!';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira seu Email!';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email', hintText: "exemplo@gmail.com"),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _cpfController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira seu CPF!';
                  }
                  return null;
                },
                inputFormatters: [
                  MaskTextInputFormatter(mask: '###.###.###-##')
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'CPF',
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _telefoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira seu Telefone!';
                  }
                  return null;
                },
                inputFormatters: [
                  MaskTextInputFormatter(mask: '(##) # ####-####')
                ],
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _senhaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira sua Senha!';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                obscureText: true,
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _ruaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira sua Rua!';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Rua',
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _bairroController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira seu Bairro!';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Bairro',
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _numeroController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o numero da sua residência!';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Numero',
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _estadoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira seu Estado!';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Estado',
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _cepController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira seu CEP!';
                  }
                  return null;
                },
                inputFormatters: [MaskTextInputFormatter(mask: '#####-###')],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'CEP',
                ),
              ),
              SizedBox(height: 40.0),
              TextFormField(
                controller: _complementoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira um complemento!';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Complemento',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  signIn();
                  FirebaseAuth.instance.currentUser!.emailVerified;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastroPet(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Criando uma reaproveitação do ID do Usuário
}

//Falta Criar uma pop up para falar se esta logado ou não
