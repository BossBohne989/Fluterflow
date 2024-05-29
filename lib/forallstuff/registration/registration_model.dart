import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'registration_widget.dart' show RegistrationWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationModel extends FlutterFlowModel<RegistrationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TxTEmail widget.
  FocusNode? txTEmailFocusNode;
  TextEditingController? txTEmailTextController;
  String? Function(BuildContext, String?)? txTEmailTextControllerValidator;
  // State field(s) for TxTPassword widget.
  FocusNode? txTPasswordFocusNode;
  TextEditingController? txTPasswordTextController;
  late bool txTPasswordVisibility;
  String? Function(BuildContext, String?)? txTPasswordTextControllerValidator;
  // State field(s) for TxTConfirmPassword widget.
  FocusNode? txTConfirmPasswordFocusNode;
  TextEditingController? txTConfirmPasswordTextController;
  late bool txTConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      txTConfirmPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txTPasswordVisibility = false;
    txTConfirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txTEmailFocusNode?.dispose();
    txTEmailTextController?.dispose();

    txTPasswordFocusNode?.dispose();
    txTPasswordTextController?.dispose();

    txTConfirmPasswordFocusNode?.dispose();
    txTConfirmPasswordTextController?.dispose();
  }
}
