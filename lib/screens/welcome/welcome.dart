import 'package:pet_app/screens/Login/login.dart';
import 'package:pet_app/screens/create_account/flutter_flow_animations.dart';

import '../create_account/flutter_flow_theme.dart';
import '/screens/create_account/flutter_flow_animations.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({Key? key}) : super(key: key);

  @override
  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-60, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(0, -40),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1200.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 600.ms,
          begin: Offset(0, -40),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 2400.ms),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 2400.ms,
          duration: 600.ms,
          begin: Offset(-20, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100,
                height: 372,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'lib/assets/welcome_pet.png',
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(31),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2,
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation1']!),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 40, 30, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectionArea(
                        child: Text(
                      'Controle a saúde \ndo seu Pet',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                    )).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation1']!),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: SelectionArea(
                          child: Text(
                        'Seja bem-vindo(a) ao nosso sistema de controle de saúde para pets! Aqui você poderá cuidar da saúde do seu pet de forma fácil e prática, tudo na palma das suas mãos! ',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                      )).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation2']!),
                    ),
                    // Generated code for this Container Widget...
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginWidget(),
                              ));
                        },
                        child: Container(
                          width: 181,
                          height: 50,
                          constraints: BoxConstraints(
                            maxHeight: 32,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF008B7D),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x32171717),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'Começar',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Icon(
                                    Icons.arrow_right_alt,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
