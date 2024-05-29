import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'groupe_chat_mes_widget.dart' show GroupeChatMesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroupeChatMesModel extends FlutterFlowModel<GroupeChatMesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for InputMessage widget.
  FocusNode? inputMessageFocusNode;
  TextEditingController? inputMessageTextController;
  String? Function(BuildContext, String?)? inputMessageTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    inputMessageFocusNode?.dispose();
    inputMessageTextController?.dispose();
  }
}
