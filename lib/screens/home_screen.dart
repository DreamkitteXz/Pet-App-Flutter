import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pet_app/models/Pet.dart';
import 'package:pet_app/screens/users.dart';
import 'package:uuid/uuid.dart';
import 'regitro_page.dart';
import 'package:pet_app/components/id.dart';

class CadastroPet extends StatefulWidget {
  const CadastroPet({super.key});

  @override
  State<CadastroPet> createState() => _CadastroPetState();
}

class _CadastroPetState extends State<CadastroPet> {
  final List<Pet> listPet = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pets"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.account_circle_rounded),
            tooltip: 'Comment',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsersDetails(),
                ),
              );
            }),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormModal();
        },
        child: const Icon(Icons.add),
      ),
      body: (listPet.isEmpty)
          ? const Center(
              child: Text(
                "Nenhum Pet ainda.\n Adicione seuu Pet!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView(
              children: List.generate(
                listPet.length,
                (index) {
                  Pet model = listPet[index];
                  return ListTile(
                    leading: const Icon(Icons.list_alt_rounded),
                    title: Text(model.name),
                    subtitle: Text(model.raca),
                  );
                },
              ),
            ),
    );
  }

  showFormModal() {
    // Labels à serem mostradas no Modal
    String title = "Adicionar";
    String confirmationButton = "Salvar";
    String skipButton = "Cancelar";

    // Controlador do campo que receberá o nome do Listin
    final _nameController = TextEditingController();
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
  }
}
