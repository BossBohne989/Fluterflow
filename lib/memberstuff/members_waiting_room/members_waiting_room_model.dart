import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'members_waiting_room_widget.dart' show MembersWaitingRoomWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MembersWaitingRoomModel
    extends FlutterFlowModel<MembersWaitingRoomWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<RoomRecord>? membersWaitingRoomPreviousSnapshot;
  // Stores action output result for [Backend Call - Read Document] action in MembersWaitingRoom widget.
  RoomRecord? out;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future test(BuildContext context) async {}
}
