import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/teams_bs_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/info_page_buttom_sheets/agenda_bs/agenda_bs_widget.dart';
import '/info_page_buttom_sheets/chat_bs/chat_bs_widget.dart';
import '/info_page_buttom_sheets/phases_bs/phases_bs_widget.dart';
import 'w_t_o_information_page_widget.dart' show WTOInformationPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WTOInformationPageModel
    extends FlutterFlowModel<WTOInformationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
