import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_app/components/id.dart';
import 'package:pet_app/models/vacinas.dart';
import 'package:pet_app/screens/vacina/vacinas_detalhes.dart';
import '../create_account/flutter_flow_icon_button.dart';
import '../create_account/flutter_flow_theme.dart';
import 'add_vacina.dart';
import 'edit_vacina.dart';

class VacinasPet extends StatefulWidget {
  final String? petId;
  final String? petSexo;
  final String? petTipo;

  const VacinasPet({this.petId, this.petSexo, this.petTipo});

  @override
  State<VacinasPet> createState() => _VacinasPetState();
}

class _VacinasPetState extends State<VacinasPet> {
  bool isLoading = true;
  List<Vacinas> listVac = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: AppBar(
        title: const Text('Vacinas'),
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
        actions: const [],
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddVacinaWidget(petId: widget.petId),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).primaryBackground,
          size: 24,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Pets')
            .doc(widget.petId)
            .collection("Vacinas")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (listVac.isEmpty) {
            return Center(
              child: const Text("Nenhuma vacina cadastrada ainda."),
            );
          }

          if (!snapshot.hasData) {
            return const Text("Nenhuma vacina cadastrada ainda.");
          }

          listVac = snapshot.data!.docs.map((document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            print(data);
            return Vacinas.fromMap(data);
          }).toList();

          return ListView.builder(
            itemCount: listVac.length,
            itemBuilder: (context, index) {
              Vacinas model = listVac[index];
              return Dismissible(
                  key: ValueKey<Vacinas>(model),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 8.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.endToStart) {
                      return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Excluir'),
                              content: const Text(
                                  'Tem ceterteza que quer deletar este item?'),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text('Sim')),
                                ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text(' Não'))
                              ],
                            );
                          });
                    }
                  },
                  onDismissed: (direction) {
                    remove(model);
                  },
                  child: GestureDetector(
                    onLongPress: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditVacinaScreen(
                                vacina: model, petId: widget.petId),
                          ),
                        )),
                    onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VacinaWidget(vacina: model),
                          ),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x411D2429),
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 1, 1, 1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 1, 1, 1),
                                      child: Container(
                                        width: 70,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: widget.petTipo == 'cachorro' ||
                                                widget.petTipo == 'Cachorro'
                                            ? (widget.petSexo == 'macho' ||
                                                    widget.petSexo == 'Macho'
                                                ? Image.asset(
                                                    'lib/assets/vacinadogmacho-removebg-preview.png')
                                                : Image.asset(
                                                    'lib/assets/vacinadog-removebg-preview.png'))
                                            : (widget.petTipo == 'gato' ||
                                                    widget.petTipo == 'Gato'
                                                ? (widget.petSexo == 'macho' ||
                                                        widget.petSexo ==
                                                            'Macho'
                                                    ? Image.asset(
                                                        'lib/assets/catmachovac-removebg-preview.png')
                                                    : Image.asset(
                                                        'lib/assets/catfemeavac-removebg-preview.png'))
                                                : Image.asset(
                                                    'lib/assets/catfemeavac-removebg-preview.png')),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 4, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.vacina,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor4,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 4, 8, 0),
                                          child: Text(
                                            model.dataAplicada,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 4, 8, 0),
                                          child: Text(
                                            model.proximaAplicacao,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Icon(
                                      Icons.chevron_right_rounded,
                                      color: Color(0xFF57636C),
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
            },
          );
        },
      ),
    );
  }

  void loadData() async {
    try {
      // Your code to load data from Firestore
      var snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Pets')
          .doc(widget.petId)
          .collection("Vacinas")
          .get();

      listVac = snapshot.docs.map((document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        return Vacinas.fromMap(data);
      }).toList();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error loading data: $e');
    }
  }

  void remove(Vacinas model) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Pets")
          .doc(widget.petId)
          .collection("Vacinas")
          .doc(model.id)
          .delete();

      // After deleting a vaccine, reload the data
      loadData();
    } catch (e) {
      print('Error deleting vaccine: $e');
    }
  }
}
