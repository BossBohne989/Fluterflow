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
import 'w_t_o_cre_pre_agenda_model.dart';
export 'w_t_o_cre_pre_agenda_model.dart';

class WTOCrePreAgendaWidget extends StatefulWidget {
  const WTOCrePreAgendaWidget({
    super.key,
    this.topic,
  });

  final String? topic;

  @override
  State<WTOCrePreAgendaWidget> createState() => _WTOCrePreAgendaWidgetState();
}

class _WTOCrePreAgendaWidgetState extends State<WTOCrePreAgendaWidget> {
  late WTOCrePreAgendaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WTOCrePreAgendaModel());

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
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<RoomRecord> wTOCrePreAgendaRoomRecordList = snapshot.data!;
        final wTOCrePreAgendaRoomRecord =
            wTOCrePreAgendaRoomRecordList.isNotEmpty
                ? wTOCrePreAgendaRoomRecordList.first
                : null;
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
                                0.0, 60.0, 0.0, 0.0),
                            child: Text(
                              'Preagenda Settings',
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
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 439.0,
                              height: 550.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF157251),
                              ),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                primary: false,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Container(
                                      width: 439.0,
                                      height: 550.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF157251),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.0, -0.92),
                                            child:
                                                StreamBuilder<List<RoomRecord>>(
                                              stream: queryRoomRecord(
                                                singleRecord: true,
                                              ),
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
                                                List<RoomRecord>
                                                    containerRoomRecordList =
                                                    snapshot.data!;
                                                final containerRoomRecord =
                                                    containerRoomRecordList
                                                            .isNotEmpty
                                                        ? containerRoomRecordList
                                                            .first
                                                        : null;
                                                return Container(
                                                  width: 404.0,
                                                  height: 304.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF157251),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                SoloAgendaRecord>>(
                                                          stream:
                                                              querySoloAgendaRecord(),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
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
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          100.0,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxHeight:
                                                                            47.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF157251),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              listViewSoloAgendaRecord.agenda,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    color: Colors.white,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.black,
                                                                              borderRadius: 40.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: Color(0xFFCE2323),
                                                                              icon: Icon(
                                                                                Icons.close,
                                                                                color: Colors.white,
                                                                                size: 20.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                await listViewSoloAgendaRecord.reference.delete();

                                                                                await containerRoomRecord!.reference.update(createRoomRecordData(
                                                                                  howManyRounds: functions.downrankRound(containerRoomRecord!.howManyRounds),
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
                                                );
                                              },
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 150.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  FFAppState().AddAgenda = true;
                                                  setState(() {});
                                                },
                                                text: 'New Agenda',
                                                options: FFButtonOptions(
                                                  width: 200.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFEFAF39),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (FFAppState().AddAgenda)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: StreamBuilder<
                                                  List<RoomRecord>>(
                                                stream: queryRoomRecord(
                                                  singleRecord: true,
                                                ),
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
                                                  List<RoomRecord>
                                                      containerRoomRecordList =
                                                      snapshot.data!;
                                                  final containerRoomRecord =
                                                      containerRoomRecordList
                                                              .isNotEmpty
                                                          ? containerRoomRecordList
                                                              .first
                                                          : null;
                                                  return Container(
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
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        10.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 300.0,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController,
                                                                focusNode: _model
                                                                    .textFieldFocusNode,
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'New Agenda',
                                                                  labelStyle: FlutterFlowTheme.of(
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
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  errorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedErrorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  filled: true,
                                                                  fillColor: Color(
                                                                      0xFFEFAF39),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
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
                                                                  0.0, 0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  AgendaRecord>>(
                                                            stream:
                                                                queryAgendaRecord(
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
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
                                                              List<AgendaRecord>
                                                                  buttonAgendaRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final buttonAgendaRecord =
                                                                  buttonAgendaRecordList
                                                                          .isNotEmpty
                                                                      ? buttonAgendaRecordList
                                                                          .first
                                                                      : null;
                                                              return FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await SoloAgendaRecord.createDoc(
                                                                          wTOCrePreAgendaRoomRecord!
                                                                              .reference)
                                                                      .set(
                                                                          createSoloAgendaRecordData(
                                                                    agenda: _model
                                                                        .textController
                                                                        .text,
                                                                  ));

                                                                  await containerRoomRecord!
                                                                      .reference
                                                                      .update(
                                                                          createRoomRecordData(
                                                                    howManyRounds:
                                                                        functions
                                                                            .updateRound(containerRoomRecord!.howManyRounds),
                                                                  ));
                                                                  if (buttonAgendaRecord !=
                                                                      null) {
                                                                    await buttonAgendaRecord!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'Agendas':
                                                                              FieldValue.arrayUnion([
                                                                            _model.textController.text
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  } else {
                                                                    await AgendaRecord.createDoc(
                                                                            containerRoomRecord!.reference)
                                                                        .set({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'Agendas':
                                                                              [
                                                                            _model.textController.text
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
                                                                },
                                                                text:
                                                                    'Add Agenda',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 200.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFF1C1C1C),
                                                                  textStyle: FlutterFlowTheme.of(
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
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 250.0, 50.0),
                            child: StreamBuilder<List<RoomRecord>>(
                              stream: queryRoomRecord(
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
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
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
                                    context.pushNamed('WTOPreAgenda');
                                  },
                                  text: 'Next',
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
                                );
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: 462.0,
                              height: 475.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF161616),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 435.0,
                                  height: 439.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: StreamBuilder<
                                        List<AgendasuggestionsRecord>>(
                                      stream: queryAgendasuggestionsRecord(),
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
                                        List<AgendasuggestionsRecord>
                                            listViewAgendasuggestionsRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewAgendasuggestionsRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewAgendasuggestionsRecord =
                                                listViewAgendasuggestionsRecordList[
                                                    listViewIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 417.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF161616),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          listViewAgendasuggestionsRecord
                                                              .agenda
                                                              .maybeHandleOverflow(
                                                                  maxChars: 80),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor:
                                                                Colors.black,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: Color(
                                                                0xFFCE2323),
                                                            icon: Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.white,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await listViewAgendasuggestionsRecord
                                                                  .reference
                                                                  .delete();
                                                            },
                                                          ),
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
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                250.0, 0.0, 0.0, 50.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('WTOChat');
                              },
                              text: 'Chat',
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
