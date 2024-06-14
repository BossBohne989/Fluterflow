import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_room_model.dart';
export 'game_room_model.dart';

class GameRoomWidget extends StatefulWidget {
  const GameRoomWidget({super.key});

  @override
  State<GameRoomWidget> createState() => _GameRoomWidgetState();
}

class _GameRoomWidgetState extends State<GameRoomWidget> {
  late GameRoomModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameRoomModel());

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
    context.watch<FFAppState>();

    return StreamBuilder<List<RoomRecord>>(
      stream: queryRoomRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF153172),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<RoomRecord> gameRoomRoomRecordList = snapshot.data!;
        final gameRoomRoomRecord = gameRoomRoomRecordList.isNotEmpty
            ? gameRoomRoomRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFF153172),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: StreamBuilder<List<UserRecord>>(
                        stream: queryUserRecord(
                          queryBuilder: (userRecord) => userRecord.where(
                            'uid',
                            isEqualTo: currentUserUid,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<UserRecord> containerUserRecordList =
                              snapshot.data!;
                          final containerUserRecord =
                              containerUserRecordList.isNotEmpty
                                  ? containerUserRecordList.first
                                  : null;
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF153172),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 500.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().GameCode =
                                            _model.txTTokenTextController.text;
                                        setState(() {});
                                        if ((FFAppState().Email ==
                                                'Lecture@Lecture.de') &&
                                            (FFAppState().Password ==
                                                'Test1234')) {
                                          context.pushNamed('Game_Settings');
                                        } else {
                                          if ((_model.txTTokenTextController
                                                      .text ==
                                                  gameRoomRoomRecord
                                                      ?.joinCode) &&
                                              (_model.txTTokenTextController
                                                      .text !=
                                                  '')) {
                                            if (containerUserRecord?.uid ==
                                                currentUserUid) {
                                              if (containerUserRecord?.team ==
                                                  '') {
                                                context.pushNamed(
                                                    'Country_Selection');
                                              } else {
                                                if (containerUserRecord?.team ==
                                                    'WTO') {
                                                  if (gameRoomRoomRecord
                                                          ?.gameStart ==
                                                      true) {
                                                    if (gameRoomRoomRecord
                                                            ?.finishAgendaCreate ==
                                                        true) {
                                                      context
                                                          .pushNamed('WTOHome');
                                                    } else {
                                                      context.pushNamed(
                                                          'WTOCrePreAgenda');
                                                    }
                                                  } else {
                                                    context
                                                        .pushNamed('WTOLobby');
                                                  }
                                                } else {
                                                  if (gameRoomRoomRecord
                                                          ?.gameStart ==
                                                      true) {
                                                    if (gameRoomRoomRecord
                                                            ?.agendaCreate ==
                                                        true) {
                                                      if (gameRoomRoomRecord
                                                              ?.finishAgendaCreate ==
                                                          true) {
                                                        FFAppState()
                                                            .MemberHome = true;
                                                      } else {
                                                        FFAppState()
                                                                .MemberPreHome =
                                                            true;
                                                      }

                                                      context.pushNamed(
                                                          'MembersAllinOne');
                                                    } else {
                                                      FFAppState()
                                                          .MemberPreHome = true;

                                                      context.pushNamed(
                                                          'MembersAllinOne');
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                        'MembersWaitingRoom');
                                                  }
                                                }
                                              }
                                            } else {
                                              await UserRecord.createDoc(
                                                      gameRoomRoomRecord!
                                                          .reference)
                                                  .set(createUserRecordData(
                                                email: FFAppState().Email,
                                                displayName:
                                                    functions.createDisplayname(
                                                        FFAppState().Email),
                                                password: FFAppState().Password,
                                                uid: currentUserUid,
                                                gameCode: _model
                                                    .txTTokenTextController
                                                    .text,
                                                createdTime:
                                                    getCurrentTimestamp,
                                                team: '',
                                                teamIMG: '',
                                              ));

                                              context.pushNamed(
                                                  'Country_Selection');
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Wrong code'),
                                                  content: Text(
                                                      'The code is not used'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        }
                                      },
                                      text: 'Join',
                                      options: FFButtonOptions(
                                        width: 183.0,
                                        height: 55.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF161616),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 350.0, 8.0, 0.0),
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller:
                                            _model.txTTokenTextController,
                                        focusNode: _model.txTTokenFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Session code here',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
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
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        validator: _model
                                            .txTTokenTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 250.0, 0.0, 0.0),
                                    child: Text(
                                      'Please enter your session code\nto join a game session.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 150.0, 0.0, 0.0),
                                    child: Text(
                                      'Session Code',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 36.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 600.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.pushNamedAuth(
                                            'Login', context.mounted);
                                      },
                                      text: 'Logout',
                                      options: FFButtonOptions(
                                        width: 183.0,
                                        height: 55.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
