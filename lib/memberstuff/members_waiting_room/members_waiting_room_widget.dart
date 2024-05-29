import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'members_waiting_room_model.dart';
export 'members_waiting_room_model.dart';

class MembersWaitingRoomWidget extends StatefulWidget {
  const MembersWaitingRoomWidget({super.key});

  @override
  State<MembersWaitingRoomWidget> createState() =>
      _MembersWaitingRoomWidgetState();
}

class _MembersWaitingRoomWidgetState extends State<MembersWaitingRoomWidget> {
  late MembersWaitingRoomModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MembersWaitingRoomModel());

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
      )..listen((snapshot) async {
          List<RoomRecord> membersWaitingRoomRoomRecordList = snapshot;
          final membersWaitingRoomRoomRecord =
              membersWaitingRoomRoomRecordList.isNotEmpty
                  ? membersWaitingRoomRoomRecordList.first
                  : null;
          if (_model.membersWaitingRoomPreviousSnapshot != null &&
              !const ListEquality(RoomRecordDocumentEquality()).equals(
                  membersWaitingRoomRoomRecordList,
                  _model.membersWaitingRoomPreviousSnapshot)) {
            _model.out = await RoomRecord.getDocumentOnce(
                membersWaitingRoomRoomRecord!.reference);
            if (_model.out?.gameStart == true) {
              context.pushNamed('Phase1');
            }

            setState(() {});
          }
          _model.membersWaitingRoomPreviousSnapshot = snapshot;
        }),
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
        List<RoomRecord> membersWaitingRoomRoomRecordList = snapshot.data!;
        final membersWaitingRoomRoomRecord =
            membersWaitingRoomRoomRecordList.isNotEmpty
                ? membersWaitingRoomRoomRecordList.first
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
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Container(
                                  height: 748.0,
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
                                                  0.0, 50.0, 0.0, 0.0),
                                          child: Text(
                                            'Waiting Room',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Colors.white,
                                                  fontSize: 25.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 120.0, 0.0, 0.0),
                                          child: Text(
                                            'Waiting for WTO to start the game.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Colors.white,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 180.0, 0.0, 0.0),
                                          child: FlutterFlowVideoPlayer(
                                            path:
                                                'assets/videos/verhandlungsspielraum_erklrung_kurz.mov_(540p).mp4',
                                            videoType: VideoType.asset,
                                            width: 400.0,
                                            height: 225.0,
                                            autoPlay: false,
                                            looping: false,
                                            showControls: true,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
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
                    ),
                    Expanded(
                      flex: 11,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: AuthUserStreamWidget(
                          builder: (context) =>
                              StreamBuilder<List<CountrieRecord>>(
                            stream: queryCountrieRecord(
                              queryBuilder: (countrieRecord) =>
                                  countrieRecord.where(
                                'country_Name',
                                isEqualTo: valueOrDefault(
                                    currentUserDocument?.team, ''),
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
                              List<CountrieRecord> rowCountrieRecordList =
                                  snapshot.data!;
                              final rowCountrieRecord =
                                  rowCountrieRecordList.isNotEmpty
                                      ? rowCountrieRecordList.first
                                      : null;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Container(
                                          height: 603.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF153172),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<UserRecord>>(
                                                    stream: queryUserRecord(
                                                      queryBuilder:
                                                          (userRecord) =>
                                                              userRecord.where(
                                                        'uid',
                                                        isEqualTo:
                                                            currentUserUid,
                                                      ),
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
                                                      List<UserRecord>
                                                          containerUserRecordList =
                                                          snapshot.data!;
                                                      final containerUserRecord =
                                                          containerUserRecordList
                                                                  .isNotEmpty
                                                              ? containerUserRecordList
                                                                  .first
                                                              : null;
                                                      return Container(
                                                        width: 250.0,
                                                        height: 307.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF0D0D0D),
                                                          border: Border.all(
                                                            color: Colors.white,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            250.0,
                                                                        height:
                                                                            134.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFF0D0D0D),
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(2.0),
                                                                            bottomRight:
                                                                                Radius.circular(2.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(0.0),
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  containerUserRecord?.team,
                                                                                  '0',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: Colors.white,
                                                                                      fontSize: 25.0,
                                                                                      letterSpacing: 0.0,
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
                                                            Expanded(
                                                              flex: 1,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            250.0,
                                                                        height:
                                                                            134.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFF0D0D0D),
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(2.0),
                                                                            bottomRight:
                                                                                Radius.circular(2.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(0.0),
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                'Teammates',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: Colors.white,
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
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
                                                            Expanded(
                                                              flex: 5,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            UserRecord>>(
                                                                      stream:
                                                                          queryUserRecord(
                                                                        queryBuilder:
                                                                            (userRecord) =>
                                                                                userRecord.where(
                                                                          'Team',
                                                                          isEqualTo:
                                                                              containerUserRecord?.team,
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<UserRecord>
                                                                            listViewUserRecordList =
                                                                            snapshot.data!;
                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listViewUserRecordList.length,
                                                                          itemBuilder:
                                                                              (context, listViewIndex) {
                                                                            final listViewUserRecord =
                                                                                listViewUserRecordList[listViewIndex];
                                                                            return Align(
                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(50.0, 15.0, 50.0, 0.0),
                                                                                child: Container(
                                                                                  width: 95.0,
                                                                                  height: 25.0,
                                                                                  constraints: BoxConstraints(
                                                                                    maxHeight: 50.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.white,
                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                  ),
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Text(
                                                                                          listViewUserRecord.displayName,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: Colors.black,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      if (listViewUserRecord.teamLeader)
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-0.96, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.star_rate,
                                                                                            color: Colors.black,
                                                                                            size: 24.0,
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
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Opacity(
                            opacity: 2.0,
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: StreamBuilder<List<CountrieRecord>>(
                                stream: queryCountrieRecord(
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
                                      containerCountrieRecordList =
                                      snapshot.data!;
                                  final containerCountrieRecord =
                                      containerCountrieRecordList.isNotEmpty
                                          ? containerCountrieRecordList.first
                                          : null;
                                  return Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF153172),
                                    ),
                                    child: Stack(
                                      children: [
                                        if (FFAppState().LeaveTeam == false)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    FFAppState().LeaveTeam =
                                                        true;
                                                  });
                                                },
                                                text: 'Leave Team',
                                                options: FFButtonOptions(
                                                  width: 150.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF153172),
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
                                                    color: Colors.white,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          70.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().LeaveTeam == true)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: StreamBuilder<
                                                  List<UserRecord>>(
                                                stream: queryUserRecord(
                                                  queryBuilder: (userRecord) =>
                                                      userRecord.where(
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
                                                  List<UserRecord>
                                                      buttonUserRecordList =
                                                      snapshot.data!;
                                                  final buttonUserRecord =
                                                      buttonUserRecordList
                                                              .isNotEmpty
                                                          ? buttonUserRecordList
                                                              .first
                                                          : null;
                                                  return FFButtonWidget(
                                                    onPressed: () async {
                                                      setState(() {
                                                        FFAppState().LeaveTeam =
                                                            false;
                                                      });
                                                    },
                                                    text: 'No',
                                                    options: FFButtonOptions(
                                                      width: 150.0,
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
                                                      color: Color(0xFF153172),
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
                                                      borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70.0),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().LeaveTeam == true)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: StreamBuilder<
                                                  List<UserRecord>>(
                                                stream: queryUserRecord(
                                                  queryBuilder: (userRecord) =>
                                                      userRecord.where(
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
                                                  List<UserRecord>
                                                      buttonUserRecordList =
                                                      snapshot.data!;
                                                  final buttonUserRecord =
                                                      buttonUserRecordList
                                                              .isNotEmpty
                                                          ? buttonUserRecordList
                                                              .first
                                                          : null;
                                                  return FFButtonWidget(
                                                    onPressed: () async {
                                                      await buttonUserRecord!
                                                          .reference
                                                          .update({
                                                        ...createUserRecordData(
                                                          teamLeader: false,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'Team': FieldValue
                                                                .delete(),
                                                            'TeamIMG':
                                                                FieldValue
                                                                    .delete(),
                                                          },
                                                        ),
                                                      });

                                                      await containerCountrieRecord!
                                                          .reference
                                                          .update(
                                                              createCountrieRecordData(
                                                        playerTeam: functions
                                                            .subPlayerinTeam(
                                                                containerCountrieRecord!
                                                                    .playerTeam),
                                                      ));
                                                      setState(() {
                                                        FFAppState().LeaveTeam =
                                                            false;
                                                      });

                                                      context.pushNamed(
                                                          'Country_Selection');
                                                    },
                                                    text: 'Yes',
                                                    options: FFButtonOptions(
                                                      width: 150.0,
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
                                                      color: Color(0xFF153172),
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
                                                      borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70.0),
                                                    ),
                                                  );
                                                },
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
                        ),
                      ],
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
