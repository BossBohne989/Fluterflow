import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'members_pre_agenda_widget.dart' show MembersPreAgendaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MembersPreAgendaModel extends FlutterFlowModel<MembersPreAgendaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<RoomRecord>? membersPreAgendaPreviousSnapshot;
  // Stores action output result for [Backend Call - Read Document] action in MembersPreAgenda widget.
  RoomRecord? out;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
