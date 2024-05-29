import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'w_t_o_chatmessage_widget.dart' show WTOChatmessageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WTOChatmessageModel extends FlutterFlowModel<WTOChatmessageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
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
