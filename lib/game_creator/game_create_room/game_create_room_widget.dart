import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_create_room_model.dart';
export 'game_create_room_model.dart';

class GameCreateRoomWidget extends StatefulWidget {
  const GameCreateRoomWidget({super.key});

  @override
  State<GameCreateRoomWidget> createState() => _GameCreateRoomWidgetState();
}

class _GameCreateRoomWidgetState extends State<GameCreateRoomWidget> {
  late GameCreateRoomModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameCreateRoomModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: StreamBuilder<List<AgendaRecord>>(
                        stream: queryAgendaRecord(
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
                          List<AgendaRecord> containerAgendaRecordList =
                              snapshot.data!;
                          final containerAgendaRecord =
                              containerAgendaRecordList.isNotEmpty
                                  ? containerAgendaRecordList.first
                                  : null;
                          return Container(
                            height: 1062.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF605295),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 150.0, 0.0, 0.0),
                                    child: Text(
                                      'Create Lobby',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 200.0, 75.0),
                                    child: Text(
                                      'Lobby Code:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 200.0, 0.0),
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Code here...',
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
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF161616),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFF161616),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        200.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.textController?.text =
                                              random_data.randomString(
                                            5,
                                            5,
                                            true,
                                            true,
                                            true,
                                          );
                                          _model.textController?.selection =
                                              TextSelection.collapsed(
                                                  offset: _model.textController!
                                                      .text.length);
                                        });
                                      },
                                      text: 'Generate Code',
                                      options: FFButtonOptions(
                                        width: 139.0,
                                        height: 40.0,
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
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 150.0),
                                    child: StreamBuilder<List<RoomRecord>>(
                                      stream: queryRoomRecord(
                                        queryBuilder: (roomRecord) =>
                                            roomRecord.where(
                                          'JoinCode',
                                          isEqualTo: _model.textController.text,
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<RoomRecord> buttonRoomRecordList =
                                            snapshot.data!;
                                        final buttonRoomRecord =
                                            buttonRoomRecordList.isNotEmpty
                                                ? buttonRoomRecordList.first
                                                : null;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            if (buttonRoomRecord?.joinCode ==
                                                _model.textController.text) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'gamecode not available'),
                                                    content: Text(
                                                        'gamecode is used'),
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
                                            } else {
                                              var roomRecordReference =
                                                  RoomRecord.collection.doc();
                                              await roomRecordReference
                                                  .set(createRoomRecordData(
                                                roomName:
                                                    _model.textController.text,
                                                joinCode:
                                                    _model.textController.text,
                                                whichRound: 0,
                                                gameStart: false,
                                                talkStart: false,
                                                agendaCreate: false,
                                                finishAgendaCreate: false,
                                                howManyRounds: 0,
                                                communique: '',
                                                membersInGame: 0,
                                                agendacount: 0,
                                              ));
                                              _model.roomref = RoomRecord
                                                  .getDocumentFromData(
                                                      createRoomRecordData(
                                                        roomName: _model
                                                            .textController
                                                            .text,
                                                        joinCode: _model
                                                            .textController
                                                            .text,
                                                        whichRound: 0,
                                                        gameStart: false,
                                                        talkStart: false,
                                                        agendaCreate: false,
                                                        finishAgendaCreate:
                                                            false,
                                                        howManyRounds: 0,
                                                        communique: '',
                                                        membersInGame: 0,
                                                        agendacount: 0,
                                                      ),
                                                      roomRecordReference);
                                              FFAppState().CreatedGameInfo =
                                                  true;
                                              setState(() {});

                                              await GoalsRecord.createDoc(
                                                      _model.roomref!.reference)
                                                  .set(createGoalsRecordData());

                                              await GlobalGoalsRecord.createDoc(
                                                      _model.roomref!.reference)
                                                  .set(
                                                      createGlobalGoalsRecordData());

                                              await CountrieRecord.createDoc(
                                                      _model.roomref!.reference)
                                                  .set(createCountrieRecordData(
                                                countryName: 'WTO',
                                                countryIMG:
                                                    'https://www.weltwirtschaft-und-entwicklung.org/media/wto-logo.png',
                                                maxPlayer: 4,
                                                playerTeam: 0,
                                              ));

                                              await CountrieRecord.createDoc(
                                                      _model.roomref!.reference)
                                                  .set(createCountrieRecordData(
                                                countryName: 'Spectature',
                                                countryIMG:
                                                    'https://cdn-icons-png.flaticon.com/512/5589/5589071.png',
                                                maxPlayer: 999,
                                                playerTeam: 0,
                                              ));

                                              await GoalsRecord.createDoc(
                                                      buttonRoomRecord!
                                                          .reference)
                                                  .set(createGoalsRecordData());

                                              await AgendaRecord.createDoc(
                                                      _model.roomref!.reference)
                                                  .set(createAgendaRecordData(
                                                id: 0,
                                              ));

                                              await containerAgendaRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'Agendas':
                                                        FieldValue.arrayUnion([
                                                      'Unlisted Subject'
                                                    ]),
                                                  },
                                                ),
                                              });

                                              await AgendasuggestionsRecord
                                                      .createDoc(_model
                                                          .roomref!.reference)
                                                  .set(
                                                      createAgendasuggestionsRecordData());

                                              await SoloAgendaRecord.createDoc(
                                                      _model.roomref!.reference)
                                                  .set(
                                                      createSoloAgendaRecordData());
                                              setState(() {
                                                _model.textController?.clear();
                                              });
                                            }

                                            setState(() {});
                                          },
                                          text: 'Create Room',
                                          options: FFButtonOptions(
                                            width: 175.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFFFBA08),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 300.0),
                                    child: Text(
                                      'Lobby Infos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 100.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamedAuth(
                                            'Login', context.mounted);

                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();
                                      },
                                      text: 'Logout',
                                      options: FFButtonOptions(
                                        width: 175.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF605295),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().CreatedGameInfo)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 50.0),
                                      child: Container(
                                        width: 500.0,
                                        height: 280.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF605295),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 25.0, 0.0, 0.0),
                                                child: Text(
                                                  'Game Created',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model.roomref?.joinCode,
                                                    '0',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 200.0, 50.0),
                                                child: Text(
                                                  'Gamecode',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 10.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor: Colors.black,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor: Color(0xFF605295),
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: Colors.black,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    FFAppState()
                                                            .CreatedGameInfo =
                                                        false;
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
