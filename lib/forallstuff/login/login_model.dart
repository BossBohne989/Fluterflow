import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TXTEmail widget.
  FocusNode? tXTEmailFocusNode;
  TextEditingController? tXTEmailTextController;
  String? Function(BuildContext, String?)? tXTEmailTextControllerValidator;
  // State field(s) for TXTPassword widget.
  FocusNode? tXTPasswordFocusNode;
  TextEditingController? tXTPasswordTextController;
  late bool tXTPasswordVisibility;
  String? Function(BuildContext, String?)? tXTPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tXTPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tXTEmailFocusNode?.dispose();
    tXTEmailTextController?.dispose();

    tXTPasswordFocusNode?.dispose();
    tXTPasswordTextController?.dispose();
  }
}
