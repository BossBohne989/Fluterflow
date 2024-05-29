import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_settings_packages01_model.dart';
export 'game_settings_packages01_model.dart';

class GameSettingsPackages01Widget extends StatefulWidget {
  const GameSettingsPackages01Widget({super.key});

  @override
  State<GameSettingsPackages01Widget> createState() =>
      _GameSettingsPackages01WidgetState();
}

class _GameSettingsPackages01WidgetState
    extends State<GameSettingsPackages01Widget> {
  late GameSettingsPackages01Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameSettingsPackages01Model());

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
            backgroundColor: Color(0xFF605295),
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
        List<RoomRecord> gameSettingsPackages01RoomRecordList = snapshot.data!;
        final gameSettingsPackages01RoomRecord =
            gameSettingsPackages01RoomRecordList.isNotEmpty
                ? gameSettingsPackages01RoomRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF605295),
            body: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: StreamBuilder<List<Package01Record>>(
                stream: queryPackage01Record(
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
                  List<Package01Record> containerPackage01RecordList =
                      snapshot.data!;
                  final containerPackage01Record =
                      containerPackage01RecordList.isNotEmpty
                          ? containerPackage01RecordList.first
                          : null;
                  return Container(
                    width: 393.0,
                    height: 800.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF605295),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.91),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.safePop();
                              },
                              text: 'Back',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 52.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -0.73),
                            child: Text(
                              'Country Package 01',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 358.0,
                              height: 453.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF171717),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 330.0,
                                  height: 419.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: StreamBuilder<List<Package01Record>>(
                                    stream: queryPackage01Record(),
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<Package01Record>
                                          listViewPackage01RecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewPackage01RecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewPackage01Record =
                                              listViewPackage01RecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              listViewPackage01Record
                                                  .countryName,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
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
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 100.0),
                              child: StreamBuilder<List<CountrieRecord>>(
                                stream: queryCountrieRecord(
                                  parent: gameSettingsPackages01RoomRecord
                                      ?.reference,
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<CountrieRecord>
                                      buttonCountrieRecordList = snapshot.data!;
                                  final buttonCountrieRecord =
                                      buttonCountrieRecordList.isNotEmpty
                                          ? buttonCountrieRecordList.first
                                          : null;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages01RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        countryName: 'Germany',
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/640px-Flag_of_Germany.svg.png',
                                        playerTeam: 0,
                                        maxPlayer: 4,
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages01RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/800px-Flag_of_South_Africa.svg.png',
                                        countryName: 'South Africa',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages01RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/1200px-Flag_of_Europe.svg.png',
                                        countryName: 'EU',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages01RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/300px-Flag_of_the_People%27s_Republic_of_China.svg.png',
                                        countryName: 'China',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages01RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_India.svg/180px-Flag_of_India.svg.png',
                                        countryName: 'India',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages01RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/1200px-Flag_of_Russia.svg.png',
                                        countryName: 'Russia',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages01RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://media.usa-info.net/wp-content/uploads/usa-flagge-1-1024x576.jpg?strip=all&lossy=1&ssl=1',
                                        countryName: 'USA',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages01RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/180px-Flag_of_the_United_Kingdom_%283-5%29.svg.png',
                                        countryName: 'United Kingdom',
                                      ));
                                    },
                                    text: 'Add Package',
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 52.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFFFBA08),
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
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
