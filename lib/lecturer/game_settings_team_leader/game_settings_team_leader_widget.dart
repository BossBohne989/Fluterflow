import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_settings_team_leader_model.dart';
export 'game_settings_team_leader_model.dart';

class GameSettingsTeamLeaderWidget extends StatefulWidget {
  const GameSettingsTeamLeaderWidget({super.key});

  @override
  State<GameSettingsTeamLeaderWidget> createState() =>
      _GameSettingsTeamLeaderWidgetState();
}

class _GameSettingsTeamLeaderWidgetState
    extends State<GameSettingsTeamLeaderWidget> {
  late GameSettingsTeamLeaderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameSettingsTeamLeaderModel());

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
        List<RoomRecord> gameSettingsTeamLeaderRoomRecordList = snapshot.data!;
        final gameSettingsTeamLeaderRoomRecord =
            gameSettingsTeamLeaderRoomRecordList.isNotEmpty
                ? gameSettingsTeamLeaderRoomRecordList.first
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
              child: Container(
                width: 694.0,
                height: 1270.0,
                decoration: BoxDecoration(
                  color: Color(0xFF605295),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -0.13),
                      child: Container(
                        width: 339.0,
                        height: 386.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF1C1C1C),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: StreamBuilder<List<UserRecord>>(
                          stream: queryUserRecord(
                            parent: gameSettingsTeamLeaderRoomRecord?.reference,
                            queryBuilder: (userRecord) => userRecord.where(
                              'uid',
                              isEqualTo: currentUserUid,
                            ),
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
                            List<UserRecord> listViewUserRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewUserRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewUserRecord =
                                    listViewUserRecordList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    constraints: BoxConstraints(
                                      maxHeight: 50.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(
                                              -0.89, -0.15),
                                          child: Text(
                                            listViewUserRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.91, -0.21),
                                          child: Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            child: Checkbox(
                                              value: _model.checkboxValueMap[
                                                      listViewUserRecord] ??=
                                                  listViewUserRecord.teamLeader,
                                              onChanged: (newValue) async {
                                                setState(() => _model
                                                            .checkboxValueMap[
                                                        listViewUserRecord] =
                                                    newValue!);
                                                if (newValue!) {
                                                  await listViewUserRecord
                                                      .reference
                                                      .update(
                                                          createUserRecordData(
                                                    teamLeader: true,
                                                  ));
                                                } else {
                                                  await listViewUserRecord
                                                      .reference
                                                      .update(
                                                          createUserRecordData(
                                                    teamLeader: false,
                                                  ));
                                                }
                                              },
                                              side: BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.63, 0.16),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.black,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0xFFCE2323),
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              await listViewUserRecord.reference
                                                  .update({
                                                ...createUserRecordData(
                                                  teamLeader: false,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'Team': FieldValue.delete(),
                                                    'TeamIMG':
                                                        FieldValue.delete(),
                                                  },
                                                ),
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.67),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: 'Back',
                        options: FFButtonOptions(
                          width: 175.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                          borderRadius: BorderRadius.circular(8.0),
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
  }
}
