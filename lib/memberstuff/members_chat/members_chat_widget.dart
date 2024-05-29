import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'members_chat_model.dart';
export 'members_chat_model.dart';

class MembersChatWidget extends StatefulWidget {
  const MembersChatWidget({super.key});

  @override
  State<MembersChatWidget> createState() => _MembersChatWidgetState();
}

class _MembersChatWidgetState extends State<MembersChatWidget> {
  late MembersChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MembersChatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RoomRecord>>(
      stream: queryRoomRecord(
        singleRecord: true,
      )..listen((snapshot) async {
          List<RoomRecord> membersChatRoomRecordList = snapshot;
          final membersChatRoomRecord = membersChatRoomRecordList.isNotEmpty
              ? membersChatRoomRecordList.first
              : null;
          if (_model.membersChatPreviousSnapshot != null &&
              !const ListEquality(RoomRecordDocumentEquality()).equals(
                  membersChatRoomRecordList,
                  _model.membersChatPreviousSnapshot)) {
            _model.out = await RoomRecord.getDocumentOnce(
                membersChatRoomRecord!.reference);
            if (_model.out?.talkStart == true) {
              context.pushNamed('MembersTalkRoom');
            }

            setState(() {});
          }
          _model.membersChatPreviousSnapshot = snapshot;
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
        List<RoomRecord> membersChatRoomRecordList = snapshot.data!;
        final membersChatRoomRecord = membersChatRoomRecordList.isNotEmpty
            ? membersChatRoomRecordList.first
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
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 121.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF153172),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (membersChatRoomRecord
                                                ?.finishAgendaCreate ==
                                            true) {
                                          context.pushNamed('MembersHome');
                                        } else {
                                          context.pushNamed('MembersPreAgenda');
                                        }
                                      },
                                      text: 'Back',
                                      options: FFButtonOptions(
                                        width: 113.0,
                                        height: 40.0,
                                        padding: EdgeInsets.all(0.0),
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
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 55.0, 50.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Color(0xFF161616),
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0xFF161616),
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context
                                            .pushNamed('CreateGroupChatPage');
                                      },
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
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 525.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF153172),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Container(
                                      width: 363.0,
                                      height: 94.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: StreamBuilder<List<ChatRecord>>(
                                          stream: queryChatRecord(
                                            queryBuilder: (chatRecord) =>
                                                chatRecord.where(
                                              'ChatName',
                                              isEqualTo: 'WTO Informations',
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
                                            List<ChatRecord>
                                                containerChatRecordList =
                                                snapshot.data!;
                                            final containerChatRecord =
                                                containerChatRecordList
                                                        .isNotEmpty
                                                    ? containerChatRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              width: 100.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF161616),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState().activeChat =
                                                        containerChatRecord
                                                            ?.reference;
                                                  });
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.team,
                                                          '') ==
                                                      'WTO') {
                                                    context.pushNamed(
                                                        'WTOChatmessage');
                                                  } else {
                                                    context.pushNamed(
                                                        'MembersWTOChat');
                                                  }
                                                },
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.1, -0.99),
                                                      child: Text(
                                                        'WTO communication',
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
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.18, 0.27),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          containerChatRecord
                                                              ?.lastMessage,
                                                          'none',
                                                        ).maybeHandleOverflow(
                                                            maxChars: 23),
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
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.91, 0.82),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                              'Hm',
                                                              containerChatRecord
                                                                  ?.ts),
                                                          '00:00',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Color(
                                                                      0xFF86A5ED),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                      child: Image.network(
                                                        containerChatRecord!
                                                            .teamIMG,
                                                        fit: BoxFit.contain,
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 544.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF153172),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: StreamBuilder<List<UserRecord>>(
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
                                        List<UserRecord>
                                            containerUserRecordList =
                                            snapshot.data!;
                                        final containerUserRecord =
                                            containerUserRecordList.isNotEmpty
                                                ? containerUserRecordList.first
                                                : null;
                                        return Container(
                                          width: 363.0,
                                          height: 588.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child:
                                              StreamBuilder<List<ChatRecord>>(
                                            stream: queryChatRecord(
                                              queryBuilder: (chatRecord) =>
                                                  chatRecord.where(Filter.or(
                                                Filter(
                                                  'users',
                                                  arrayContains: currentUserUid,
                                                ),
                                                Filter(
                                                  'public',
                                                  isEqualTo: true,
                                                ),
                                              )),
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
                                              List<ChatRecord>
                                                  listViewChatRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewChatRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewChatRecord =
                                                      listViewChatRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                10.0,
                                                                20.0,
                                                                0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF161616),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            FFAppState()
                                                                    .activeChat =
                                                                listViewChatRecord
                                                                    .reference;
                                                          });

                                                          context.pushNamed(
                                                              'Chatmessage');
                                                        },
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.17,
                                                                      -0.93),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.getOtherUser(
                                                                      listViewChatRecord
                                                                          .userNames
                                                                          .toList(),
                                                                      containerUserRecord!
                                                                          .displayName,
                                                                      listViewChatRecord
                                                                          .chatName),
                                                                  'No Name',
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
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.12,
                                                                      0.2),
                                                              child: Text(
                                                                listViewChatRecord
                                                                    .lastMessage
                                                                    .maybeHandleOverflow(
                                                                        maxChars:
                                                                            10),
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
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.89,
                                                                      0.84),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                      'Hm',
                                                                      listViewChatRecord
                                                                          .ts),
                                                                  '00:00',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: Color(
                                                                          0xFF86A5ED),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                              child:
                                                                  Image.network(
                                                                listViewChatRecord
                                                                    .teamIMG,
                                                                fit: BoxFit
                                                                    .contain,
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
                                        );
                                      },
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
