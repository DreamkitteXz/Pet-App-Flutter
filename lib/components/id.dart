import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_app/screens/create_account/regitro_page.dart';
import 'package:uuid/uuid.dart';

String petID = '';
String vacID = '';

String gerarPetID() {
  return petID = const Uuid().v4().trim();
}

String gerarVacID() {
  return vacID = const Uuid().v1().trim();
}

Future addUserdatalhes(
    String nome,
    String email,
    String cpf,
    String telefone,
    String senha,
    String rua,
    String bairro,
    String cep,
    String estado,
    String numero,
    String complemento) async {
  await FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set({
    "Id": FirebaseAuth.instance.currentUser!.uid,
    "Nome": nome,
    "Email": email,
    "CPF": cpf,
    "Telefone": telefone,
    "Senha": senha,
    "Rua": rua,
    "Bairro": bairro,
    "CEP": cep,
    "Estado": estado,
    "Numero": numero,
    "Complemento": complemento,
  });
}

Future cadastroPet(String idPet, String name, String raca, String sexo,
    String cor, String dataNasc, String isInteiro, String chip) async {
  await FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("Pets")
      .doc(idPet)
      .set({
    "Pet Id": idPet,
    "Nome do pet": name,
    "Raca": raca,
    "Sexo": sexo,
    "Cor": cor,
    "Data de Nascimento": dataNasc,
    "Inteiro ou Castrado": isInteiro,
    "Numero do Chip": chip,
  });
}
