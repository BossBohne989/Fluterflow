import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_settings_packages02_model.dart';
export 'game_settings_packages02_model.dart';

class GameSettingsPackages02Widget extends StatefulWidget {
  const GameSettingsPackages02Widget({super.key});

  @override
  State<GameSettingsPackages02Widget> createState() =>
      _GameSettingsPackages02WidgetState();
}

class _GameSettingsPackages02WidgetState
    extends State<GameSettingsPackages02Widget> {
  late GameSettingsPackages02Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameSettingsPackages02Model());

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
        List<RoomRecord> gameSettingsPackages02RoomRecordList = snapshot.data!;
        final gameSettingsPackages02RoomRecord =
            gameSettingsPackages02RoomRecordList.isNotEmpty
                ? gameSettingsPackages02RoomRecordList.first
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
              child: StreamBuilder<List<Package02Record>>(
                stream: queryPackage02Record(
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
                  List<Package02Record> containerPackage02RecordList =
                      snapshot.data!;
                  final containerPackage02Record =
                      containerPackage02RecordList.isNotEmpty
                          ? containerPackage02RecordList.first
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
                              'Country Package 02',
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
                                  child: StreamBuilder<List<Package02Record>>(
                                    stream: queryPackage02Record(),
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
                                      List<Package02Record>
                                          listViewPackage02RecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewPackage02RecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewPackage02Record =
                                              listViewPackage02RecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              listViewPackage02Record
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
                                  parent: gameSettingsPackages02RoomRecord
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
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Flag_of_the_Republic_of_China.svg/200px-Flag_of_the_Republic_of_China.svg.png',
                                        countryName: 'Taiwan',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Ukraine.svg/180px-Flag_of_Ukraine.svg.png',
                                        countryName: 'Ukraine',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/2560px-Flag_of_South_Korea.svg.png',
                                        countryName: 'South Korea',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Flag_of_NATO.svg/1200px-Flag_of_NATO.svg.png',
                                        countryName: 'NATO',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Flag_of_Pakistan.svg/2560px-Flag_of_Pakistan.svg.png',
                                        countryName: 'Pakistan',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/255px-Flag_of_the_Netherlands.svg.png',
                                        countryName: 'Netherlands',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Flag_of_Iran.svg/2560px-Flag_of_Iran.svg.png',
                                        countryName: 'Iran',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/1280px-Flag_of_Turkey.svg.png',
                                        countryName: 'Türkiye',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/1200px-Flag_of_Japan.svg.png',
                                        countryName: 'Japan',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/180px-Flag_of_the_United_Arab_Emirates.svg.png',
                                        countryName: 'UAE',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/180px-Flag_of_Qatar.svg.png',
                                        countryName: 'Qatar',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Flag_of_Algeria.svg/125px-Flag_of_Algeria.svg.png',
                                        countryName: 'Algeria',
                                      ));

                                      await CountrieRecord.createDoc(
                                              gameSettingsPackages02RoomRecord!
                                                  .reference)
                                          .set(createCountrieRecordData(
                                        maxPlayer: 4,
                                        playerTeam: 0,
                                        countryIMG:
                                            'https://media.istockphoto.com/id/617360668/de/foto/brics-flagge.jpg?s=612x612&w=0&k=20&c=K8lxgbquh8uRxiE6RwKbMxdEMcTXVfH8F6YLo8KTQ1U=',
                                        countryName: 'BRICS',
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
