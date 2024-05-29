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
import 'groupe_chat_mes_model.dart';
export 'groupe_chat_mes_model.dart';

class GroupeChatMesWidget extends StatefulWidget {
  const GroupeChatMesWidget({super.key});

  @override
  State<GroupeChatMesWidget> createState() => _GroupeChatMesWidgetState();
}

class _GroupeChatMesWidgetState extends State<GroupeChatMesWidget> {
  late GroupeChatMesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupeChatMesModel());

    _model.inputMessageTextController ??= TextEditingController();
    _model.inputMessageFocusNode ??= FocusNode();

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    if (FFAppState().activeChat != null)
                      StreamBuilder<ChatGroupeRecord>(
                        stream: ChatGroupeRecord.getDocument(
                            FFAppState().activeGroupchat!),
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
                          final columnHasChatChatGroupeRecord = snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
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
                                              height: 65.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          SelectionArea(
                                                              child: Text(
                                                        'Chat with ${functions.getOtherUser(columnHasChatChatGroupeRecord.userNames.toList(), valueOrDefault(currentUserDocument?.team, ''), columnHasChatChatGroupeRecord.chatName.first)}',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      )),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          List<
                                                              ChatGroupeRecord>>(
                                                        stream:
                                                            queryChatGroupeRecord(
                                                          singleRecord: true,
                                                        ),
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
                                                          List<ChatGroupeRecord>
                                                              buttonChatGroupeRecordList =
                                                              snapshot.data!;
                                                          final buttonChatGroupeRecord =
                                                              buttonChatGroupeRecordList
                                                                      .isNotEmpty
                                                                  ? buttonChatGroupeRecordList
                                                                      .first
                                                                  : null;
                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model
                                                                      .inputMessageTextController
                                                                      .text !=
                                                                  '') {
                                                                await GroupeMessageRecord.createDoc(
                                                                        FFAppState()
                                                                            .activeGroupchat!)
                                                                    .set(
                                                                        createGroupeMessageRecordData(
                                                                  message: _model
                                                                      .inputMessageTextController
                                                                      .text,
                                                                  ts: getCurrentTimestamp,
                                                                  uid:
                                                                      currentUserUid,
                                                                  user: containerUserRecord
                                                                      ?.displayName,
                                                                  team:
                                                                      containerUserRecord
                                                                          ?.team,
                                                                ));

                                                                await buttonChatGroupeRecord!
                                                                    .reference
                                                                    .update(
                                                                        createChatGroupeRecordData(
                                                                  lastMessage:
                                                                      _model
                                                                          .inputMessageTextController
                                                                          .text,
                                                                ));
                                                                setState(() {
                                                                  _model
                                                                      .inputMessageTextController
                                                                      ?.clear();
                                                                });
                                                              }
                                                            },
                                                            text: 'Back',
                                                            options:
                                                                FFButtonOptions(
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
                                                                  0xFF161616),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
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
                          );
                        },
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 35,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<OrganisationsChatRecord>>(
                        stream: queryOrganisationsChatRecord(
                          parent: FFAppState().activeChat,
                          queryBuilder: (organisationsChatRecord) =>
                              organisationsChatRecord.orderBy('ts'),
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
                          List<OrganisationsChatRecord>
                              listViewOrganisationsChatRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewOrganisationsChatRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewOrganisationsChatRecord =
                                  listViewOrganisationsChatRecordList[
                                      listViewIndex];
                              return Stack(
                                children: [
                                  if (listViewOrganisationsChatRecord.uid !=
                                      currentUserUid)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 150.0,
                                            height: 66.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    listViewOrganisationsChatRecord
                                                        .team,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  listViewOrganisationsChatRecord
                                                      .message,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                      'Hm',
                                                      listViewOrganisationsChatRecord
                                                          .ts!),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (listViewOrganisationsChatRecord.uid ==
                                      currentUserUid)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  listViewOrganisationsChatRecord
                                                      .message,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                      'Hm',
                                                      listViewOrganisationsChatRecord
                                                          .ts!),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<UserRecord> containerUserRecordList =
                            snapshot.data!;
                        final containerUserRecord =
                            containerUserRecordList.isNotEmpty
                                ? containerUserRecordList.first
                                : null;
                        return Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller:
                                        _model.inputMessageTextController,
                                    focusNode: _model.inputMessageFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Enter message...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    validator: _model
                                        .inputMessageTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              StreamBuilder<List<ChatGroupeRecord>>(
                                stream: queryChatGroupeRecord(
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
                                  List<ChatGroupeRecord>
                                      buttonChatGroupeRecordList =
                                      snapshot.data!;
                                  final buttonChatGroupeRecord =
                                      buttonChatGroupeRecordList.isNotEmpty
                                          ? buttonChatGroupeRecordList.first
                                          : null;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.inputMessageTextController
                                              .text !=
                                          '') {
                                        await GroupeMessageRecord.createDoc(
                                                FFAppState().activeGroupchat!)
                                            .set(createGroupeMessageRecordData(
                                          message: _model
                                              .inputMessageTextController.text,
                                          ts: getCurrentTimestamp,
                                          uid: currentUserUid,
                                          user:
                                              containerUserRecord?.displayName,
                                          team: containerUserRecord?.team,
                                        ));

                                        await buttonChatGroupeRecord!.reference
                                            .update(createChatGroupeRecordData(
                                          lastMessage: _model
                                              .inputMessageTextController.text,
                                        ));
                                        setState(() {
                                          _model.inputMessageTextController
                                              ?.clear();
                                        });
                                      }
                                    },
                                    text: 'SEND',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF0D0D0D),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
