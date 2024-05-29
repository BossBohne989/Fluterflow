import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_settings_game_code_model.dart';
export 'game_settings_game_code_model.dart';

class GameSettingsGameCodeWidget extends StatefulWidget {
  const GameSettingsGameCodeWidget({super.key});

  @override
  State<GameSettingsGameCodeWidget> createState() =>
      _GameSettingsGameCodeWidgetState();
}

class _GameSettingsGameCodeWidgetState
    extends State<GameSettingsGameCodeWidget> {
  late GameSettingsGameCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameSettingsGameCodeModel());

    _model.txTTokenTextController ??= TextEditingController();
    _model.txTTokenFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF605295),
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 393.0,
            height: 800.0,
            decoration: BoxDecoration(
              color: Color(0xFF605295),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.91),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamedAuth('Login', context.mounted);

                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();
                    },
                    text: 'Logout',
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF605295),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.07),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        FFAppState().GameCode =
                            _model.txTTokenTextController.text;
                      });

                      context.pushNamed('Game_Settings');
                    },
                    text: 'Join',
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFFFFBA08),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.black,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.73),
                  child: Text(
                    'Game Settings',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.12),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      width: 200.0,
                      child: TextFormField(
                        controller: _model.txTTokenTextController,
                        focusNode: _model.txTTokenFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Session code here',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xFF161616),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                        validator: _model.txTTokenTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
