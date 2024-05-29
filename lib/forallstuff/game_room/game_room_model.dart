import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'game_room_widget.dart' show GameRoomWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GameRoomModel extends FlutterFlowModel<GameRoomWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TxTToken widget.
  FocusNode? txTTokenFocusNode;
  TextEditingController? txTTokenTextController;
  String? Function(BuildContext, String?)? txTTokenTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txTTokenFocusNode?.dispose();
    txTTokenTextController?.dispose();
  }
}
