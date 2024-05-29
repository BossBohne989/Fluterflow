import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_settings_packages03_model.dart';
export 'game_settings_packages03_model.dart';

class GameSettingsPackages03Widget extends StatefulWidget {
  const GameSettingsPackages03Widget({super.key});

  @override
  State<GameSettingsPackages03Widget> createState() =>
      _GameSettingsPackages03WidgetState();
}

class _GameSettingsPackages03WidgetState
    extends State<GameSettingsPackages03Widget> {
  late GameSettingsPackages03Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameSettingsPackages03Model());

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
        List<RoomRecord> gameSettingsPackages03RoomRecordList = snapshot.data!;
        final gameSettingsPackages03RoomRecord =
            gameSettingsPackages03RoomRecordList.isNotEmpty
                ? gameSettingsPackages03RoomRecordList.first
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
              child: StreamBuilder<List<Package03Record>>(
                stream: queryPackage03Record(
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
                  List<Package03Record> containerPackage03RecordList =
                      snapshot.data!;
                  final containerPackage03Record =
                      containerPackage03RecordList.isNotEmpty
                          ? containerPackage03RecordList.first
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
                              'Country Package 03',
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
                                  child: StreamBuilder<List<Package03Record>>(
                                    stream: queryPackage03Record(),
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
                                      List<Package03Record>
                                          listViewPackage03RecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewPackage03RecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewPackage03Record =
                                              listViewPackage03RecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              listViewPackage03Record
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
                                  parent: gameSettingsPackages03RoomRecord
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
                                              gameSettingsPackages03RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        countryName: 'OPEC',
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Flag_of_OPEC.svg/200px-Flag_of_OPEC.svg.png',
                                        playerTeam: 0,
                                        maxPlayer: 4,
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages03RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Flag_of_North_Korea.svg/180px-Flag_of_North_Korea.svg.png',
                                        countryName: 'North Korea',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages03RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Finland.svg/180px-Flag_of_Finland.svg.png',
                                        countryName: 'Finland',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages03RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_the_Taliban.svg/180px-Flag_of_the_Taliban.svg.png',
                                        countryName: 'Afghanistan',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages03RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Flag_of_Israel.svg/180px-Flag_of_Israel.svg.png',
                                        countryName: 'Israel',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages03RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Switzerland.svg/150px-Flag_of_Switzerland.svg.png',
                                        countryName: 'Switzerland',
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
