import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'passwordreset_widget.dart' show PasswordresetWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PasswordresetModel extends FlutterFlowModel<PasswordresetWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TXTEmail widget.
  FocusNode? tXTEmailFocusNode;
  TextEditingController? tXTEmailTextController;
  String? Function(BuildContext, String?)? tXTEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tXTEmailFocusNode?.dispose();
    tXTEmailTextController?.dispose();
  }
}
