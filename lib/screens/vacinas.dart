import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VacinasPet extends StatefulWidget {
  const VacinasPet({super.key});

  @override
  State<VacinasPet> createState() => _VacinasPetState();
}

class _VacinasPetState extends State<VacinasPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vacinas do Pet"),
      ),
    );
  }
}
