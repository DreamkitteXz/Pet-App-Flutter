import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_app/models/Pet.dart';

class PetDetalhes extends StatelessWidget {
  final Pet pet;

  const PetDetalhes({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${pet.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Raca: ${pet.raca}'),
            SizedBox(height: 8),
            Text('Sexo: ${pet.sexo}'),
            SizedBox(height: 8),
            Text('Cor: ${pet.cor}'),
            SizedBox(height: 8),
            Text('Data de Nascimento: ${pet.dataNasc}'),
            SizedBox(height: 8),
            Text('Inteiro ou Castrado: ${pet.isInteiro}'),
            SizedBox(height: 8),
            Text('Número de Chip: ${pet.chip}'),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                return null;
              },
              child: Text("Vacinas"),
            ),
            ElevatedButton(
              onPressed: () {
                return null;
              },
              child: Text("Vermifugos"),
            ),
          ],
        ),
      ),
    );
  }
}
