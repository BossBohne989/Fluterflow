import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future<DocumentReference?> test(BuildContext context) async {
  List<ChatRecord>? referenc;

  referenc = await queryChatRecordOnce(
    queryBuilder: (chatRecord) => chatRecord.where(
      'Team',
      arrayContains: FFAppState().team,
    ),
  );

  return null;
}
