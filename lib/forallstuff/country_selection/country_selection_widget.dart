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
import 'country_selection_model.dart';
export 'country_selection_model.dart';

class CountrySelectionWidget extends StatefulWidget {
  const CountrySelectionWidget({super.key});

  @override
  State<CountrySelectionWidget> createState() => _CountrySelectionWidgetState();
}

class _CountrySelectionWidgetState extends State<CountrySelectionWidget> {
  late CountrySelectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountrySelectionModel());

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
        queryBuilder: (roomRecord) => roomRecord.where(
          'JoinCode',
          isEqualTo: FFAppState().GameCode,
        ),
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
        List<RoomRecord> countrySelectionRoomRecordList = snapshot.data!;
        final countrySelectionRoomRecord =
            countrySelectionRoomRecordList.isNotEmpty
                ? countrySelectionRoomRecordList.first
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
              body: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 815.0,
                  height: 1059.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF153172),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF153172),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 60.0, 0.0, 0.0),
                                            child: Text(
                                              'Team ${FFAppState().team}',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        fontSize: 34.0,
                                                        letterSpacing: 0.0,
                                                      ),
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
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Container(
                                      height: 599.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF153172),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 50.0, 0.0, 0.0),
                                                child: StreamBuilder<
                                                    List<CountrieRecord>>(
                                                  stream: queryCountrieRecord(),
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
                                                    List<CountrieRecord>
                                                        listViewCountrieRecordList =
                                                        snapshot.data!;
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewCountrieRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewCountrieRecord =
                                                            listViewCountrieRecordList[
                                                                listViewIndex];
                                                        return Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        42.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                _model.refteam =
                                                                    await CountrieRecord.getDocumentOnce(
                                                                        listViewCountrieRecord
                                                                            .reference);
                                                                FFAppState()
                                                                        .team =
                                                                    _model
                                                                        .refteam!
                                                                        .countryName;
                                                                FFAppState()
                                                                        .teamImg =
                                                                    _model
                                                                        .refteam!
                                                                        .countryIMG;

                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                width: 260.0,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF153172),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.21,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            210.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.black,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(50.0, 10.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  listViewCountrieRecord.countryName,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: Colors.black,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 17.0),
                                                                                child: Text(
                                                                                  'Teammate ${listViewCountrieRecord.playerTeam.toString()} of ${listViewCountrieRecord.maxPlayer.toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: Colors.black,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            50.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          child:
                                                                              Image.network(
                                                                            listViewCountrieRecord.countryIMG,
                                                                            width:
                                                                                80.0,
                                                                            height:
                                                                                80.0,
                                                                            fit:
                                                                                BoxFit.cover,
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
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 200.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UserRecord> rowUserRecordList =
                                    snapshot.data!;
                                final rowUserRecord =
                                    rowUserRecordList.isNotEmpty
                                        ? rowUserRecordList.first
                                        : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(7.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed('GameRoom');
                                                },
                                                text: 'Back',
                                                options: FFButtonOptions(
                                                  width: 180.0,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF161616),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          29.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 7.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await rowUserRecord!.reference
                                                      .update(
                                                          createUserRecordData(
                                                    team: FFAppState().team,
                                                    teamIMG:
                                                        FFAppState().teamImg,
                                                  ));

                                                  await currentUserReference!
                                                      .update(
                                                          createUserCreateRecordData(
                                                    team: FFAppState().team,
                                                    teamIMG:
                                                        FFAppState().teamImg,
                                                  ));
                                                  if (_model.refteam
                                                          ?.playerTeam ==
                                                      0) {
                                                    await rowUserRecord!
                                                        .reference
                                                        .update(
                                                            createUserRecordData(
                                                      teamLeader: true,
                                                    ));
                                                  } else {
                                                    await rowUserRecord!
                                                        .reference
                                                        .update(
                                                            createUserRecordData(
                                                      teamLeader: false,
                                                    ));
                                                  }

                                                  await _model
                                                      .refteam!.reference
                                                      .update(
                                                          createCountrieRecordData(
                                                    playerTeam: functions
                                                        .addPlayerinTeam(_model
                                                            .refteam!
                                                            .playerTeam),
                                                  ));

                                                  await currentUserReference!
                                                      .update(
                                                          createUserCreateRecordData(
                                                    team: _model
                                                        .refteam?.countryName,
                                                    teamIMG: _model
                                                        .refteam?.countryIMG,
                                                  ));
                                                  FFAppState().isReady =
                                                      'not Ready';
                                                  setState(() {});
                                                  if (_model.refteam
                                                          ?.countryName ==
                                                      'WTO') {
                                                    if (countrySelectionRoomRecord
                                                            ?.agendaCreate ==
                                                        true) {
                                                      if (countrySelectionRoomRecord
                                                              ?.finishAgendaCreate ==
                                                          true) {
                                                        if (countrySelectionRoomRecord
                                                                ?.gameStart ==
                                                            true) {
                                                          context.pushNamed(
                                                              'WTOHome');
                                                        } else {
                                                          context.pushNamed(
                                                              'WTOHome');
                                                        }
                                                      } else {
                                                        context.pushNamed(
                                                            'WTOCrePreAgenda');
                                                      }
                                                    } else {
                                                      context.pushNamed(
                                                          'WTOLobby');
                                                    }
                                                  } else {
                                                    if (countrySelectionRoomRecord
                                                            ?.gameStart ==
                                                        true) {
                                                      if (countrySelectionRoomRecord
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
                                                      context.pushNamed(
                                                          'MembersWaitingRoom');
                                                    }
                                                  }
                                                },
                                                text: 'Select team',
                                                options: FFButtonOptions(
                                                  width: 180.0,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF161616),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 3.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          29.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
