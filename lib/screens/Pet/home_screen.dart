import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/models/Pet.dart';
import 'package:pet_app/screens/Pet/pet_screen.dart';

import '../../models/show_form_model.dart';
import '../create_account/flutter_flow_theme.dart';

class CadastroPet extends StatefulWidget {
  const CadastroPet({Key? key}) : super(key: key);

  @override
  State<CadastroPet> createState() => _CadastroPetState();
}

class _CadastroPetState extends State<CadastroPet> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //========================================================================
      //FAB

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPetWidget(),
              ));
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).primaryBackground,
          size: 24,
        ),
      ),

      //========================================================================
      //

      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12, 12, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Meus pets',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF15161E),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                'Seus pets cadastrados estão logo abaixo',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF14181B),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),

              //========================================================================
              //Lista de Pets

              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('Pets')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Nenhum pet cadastrado ainda.");
                  }

                  List<Pet> listPet = snapshot.data!.docs.map((document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return Pet.fromMap(data);
                  }).toList();

                  return ListView.builder(
                    itemCount: listPet.length,
                    itemBuilder: (context, index) {
                      Pet model = listPet[index];

                      //================================================================
                      //Container do Pet

                      return Dismissible(
                          key: ValueKey<Pet>(model),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 8.0),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            remove(model);
                          },
                          child: GestureDetector(
                            onTap: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PetDetalhes(pet: model),
                                  ),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                // Other properties for the Container...

                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Color(0x411D2429),
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 1, 1, 1),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: // Generated code for this Container Widget...
                                                Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 1, 1, 1),
                                              child: Container(
                                                width: 70,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Icon(
                                                  Icons.pets_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24,
                                                ),
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 4, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                model.name,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor4,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 8, 0),
                                                  child: Text(
                                                    model.raca,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 8, 0),
                                                  child: Text(
                                                    model.sexo,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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

              //========================================================================
              //
            ),
          ),
        ],
      ),
    );
  }

//Remover o Pet

  void remove(Pet model) {
    firestore
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Pets")
        .doc(model.id)
        .delete();
  }
}
