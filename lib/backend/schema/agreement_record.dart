import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgreementRecord extends FirestoreRecord {
  AgreementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Descripton" field.
  String? _descripton;
  String get descripton => _descripton ?? '';
  bool hasDescripton() => _descripton != null;

  // "Teams" field.
  List<String>? _teams;
  List<String> get teams => _teams ?? const [];
  bool hasTeams() => _teams != null;

  // "StatusCol" field.
  Color? _statusCol;
  Color? get statusCol => _statusCol;
  bool hasStatusCol() => _statusCol != null;

  // "Status" field.
  List<bool>? _status;
  List<bool> get status => _status ?? const [];
  bool hasStatus() => _status != null;

  // "GameRoom" field.
  String? _gameRoom;
  String get gameRoom => _gameRoom ?? '';
  bool hasGameRoom() => _gameRoom != null;

  // "UserIDs" field.
  List<String>? _userIDs;
  List<String> get userIDs => _userIDs ?? const [];
  bool hasUserIDs() => _userIDs != null;

  // "check" field.
  int? _check;
  int get check => _check ?? 0;
  bool hasCheck() => _check != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _descripton = snapshotData['Descripton'] as String?;
    _teams = getDataList(snapshotData['Teams']);
    _statusCol = getSchemaColor(snapshotData['StatusCol']);
    _status = getDataList(snapshotData['Status']);
    _gameRoom = snapshotData['GameRoom'] as String?;
    _userIDs = getDataList(snapshotData['UserIDs']);
    _check = castToType<int>(snapshotData['check']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Agreement');

  static Stream<AgreementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgreementRecord.fromSnapshot(s));

  static Future<AgreementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgreementRecord.fromSnapshot(s));

  static AgreementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AgreementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgreementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgreementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgreementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgreementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgreementRecordData({
  String? title,
  String? descripton,
  Color? statusCol,
  String? gameRoom,
  int? check,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Descripton': descripton,
      'StatusCol': statusCol,
      'GameRoom': gameRoom,
      'check': check,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgreementRecordDocumentEquality implements Equality<AgreementRecord> {
  const AgreementRecordDocumentEquality();

  @override
  bool equals(AgreementRecord? e1, AgreementRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.descripton == e2?.descripton &&
        listEquality.equals(e1?.teams, e2?.teams) &&
        e1?.statusCol == e2?.statusCol &&
        listEquality.equals(e1?.status, e2?.status) &&
        e1?.gameRoom == e2?.gameRoom &&
        listEquality.equals(e1?.userIDs, e2?.userIDs) &&
        e1?.check == e2?.check;
  }

  @override
  int hash(AgreementRecord? e) => const ListEquality().hash([
        e?.title,
        e?.descripton,
        e?.teams,
        e?.statusCol,
        e?.status,
        e?.gameRoom,
        e?.userIDs,
        e?.check
      ]);

  @override
  bool isValidKey(Object? o) => o is AgreementRecord;
}
