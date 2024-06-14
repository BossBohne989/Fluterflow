import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'w_t_o_agenda_model.dart';
export 'w_t_o_agenda_model.dart';

class WTOAgendaWidget extends StatefulWidget {
  const WTOAgendaWidget({
    super.key,
    this.topic,
  });

  final String? topic;

  @override
  State<WTOAgendaWidget> createState() => _WTOAgendaWidgetState();
}

class _WTOAgendaWidgetState extends State<WTOAgendaWidget> {
  late WTOAgendaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WTOAgendaModel());

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

    return StreamBuilder<List<RoomRecord>>(
      stream: queryRoomRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF157251),
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
        List<RoomRecord> wTOAgendaRoomRecordList = snapshot.data!;
        final wTOAgendaRoomRecord = wTOAgendaRoomRecordList.isNotEmpty
            ? wTOAgendaRoomRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF157251),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: 2172.0,
                    height: 956.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF157251),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 0.0),
                            child: Text(
                              'Agenda Settings',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 40.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 439.0,
                            height: 550.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF157251),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                width: 439.0,
                                height: 550.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF157251),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Container(
                                        width: 404.0,
                                        height: 304.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF157251),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<SoloAgendaRecord>>(
                                                stream: querySoloAgendaRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<SoloAgendaRecord>
                                                      listViewSoloAgendaRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewSoloAgendaRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewSoloAgendaRecord =
                                                          listViewSoloAgendaRecordList[
                                                              listViewIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Container(
                                                            height: 100.0,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxHeight: 47.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF157251),
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    listViewSoloAgendaRecord
                                                                        .agenda,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .black,
                                                                    borderRadius:
                                                                        40.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    fillColor:
                                                                        Color(
                                                                            0xFFCB2B11),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      await listViewSoloAgendaRecord
                                                                          .reference
                                                                          .delete();

                                                                      await wTOAgendaRoomRecord!
                                                                          .reference
                                                                          .update(
                                                                              createRoomRecordData(
                                                                        howManyRounds:
                                                                            functions.downrankRound(wTOAgendaRoomRecord!.howManyRounds),
                                                                      ));
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 180.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().AddAgenda = true;
                                            setState(() {});
                                          },
                                          text: 'New Agenda',
                                          options: FFButtonOptions(
                                            width: 200.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFEFAF39),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (FFAppState().AddAgenda)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 250.0, 0.0, 0.0),
                                          child: Container(
                                            width: 382.0,
                                            height: 205.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF157251),
                                            ),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 20.0),
                                                    child: Container(
                                                      width: 300.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'New Agenda',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                          filled: true,
                                                          fillColor:
                                                              Color(0xFFEFAF39),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 25.0),
                                                    child: StreamBuilder<
                                                        List<AgendaRecord>>(
                                                      stream: queryAgendaRecord(
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<AgendaRecord>
                                                            buttonAgendaRecordList =
                                                            snapshot.data!;
                                                        final buttonAgendaRecord =
                                                            buttonAgendaRecordList
                                                                    .isNotEmpty
                                                                ? buttonAgendaRecordList
                                                                    .first
                                                                : null;
                                                        return FFButtonWidget(
                                                          onPressed: () async {
                                                            if (buttonAgendaRecord!
                                                                    .agendas
                                                                    .length <=
                                                                6) {
                                                              await SoloAgendaRecord
                                                                      .createDoc(
                                                                          buttonAgendaRecord!
                                                                              .parentReference)
                                                                  .set(
                                                                      createSoloAgendaRecordData(
                                                                agenda: _model
                                                                    .textController
                                                                    .text,
                                                              ));

                                                              await wTOAgendaRoomRecord!
                                                                  .reference
                                                                  .update(
                                                                      createRoomRecordData(
                                                                howManyRounds: functions
                                                                    .updateRound(
                                                                        wTOAgendaRoomRecord!
                                                                            .howManyRounds),
                                                              ));
                                                              if (buttonAgendaRecord !=
                                                                  null) {
                                                                await buttonAgendaRecord!
                                                                    .reference
                                                                    .update({
                                                                  ...createAgendaRecordData(
                                                                    id: functions.checkID(buttonAgendaRecord!
                                                                        .agendas
                                                                        .toList()),
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Agendas':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        _model
                                                                            .textController
                                                                            .text
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              } else {
                                                                await AgendaRecord.createDoc(
                                                                        buttonAgendaRecord!
                                                                            .parentReference)
                                                                    .set({
                                                                  ...createAgendaRecordData(
                                                                    id: functions.checkID(buttonAgendaRecord!
                                                                        .agendas
                                                                        .toList()),
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Agendas':
                                                                          [
                                                                        _model
                                                                            .textController
                                                                            .text
                                                                      ],
                                                                    },
                                                                  ),
                                                                });
                                                              }

                                                              setState(() {
                                                                _model
                                                                    .textController
                                                                    ?.clear();
                                                              });
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Too many Agenda'),
                                                                    content: Text(
                                                                        'You can only create 7 Agenda-items'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                          text: 'Add Agenda',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 200.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0xFF1C1C1C),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor: Colors.black,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        Color(0xFFCE2323),
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Color(0xFFF8F8F8),
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      FFAppState().AddAgenda =
                                                          false;
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 80.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('WTOHome');
                              },
                              text: 'Home',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF157251),
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
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
