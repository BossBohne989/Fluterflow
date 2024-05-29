import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlobalGoalsRecord extends FirestoreRecord {
  GlobalGoalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "GlobalGoal" field.
  String? _globalGoal;
  String get globalGoal => _globalGoal ?? '';
  bool hasGlobalGoal() => _globalGoal != null;

  // "Team" field.
  String? _team;
  String get team => _team ?? '';
  bool hasTeam() => _team != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _globalGoal = snapshotData['GlobalGoal'] as String?;
    _team = snapshotData['Team'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('GlobalGoals')
          : FirebaseFirestore.instance.collectionGroup('GlobalGoals');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('GlobalGoals').doc(id);

  static Stream<GlobalGoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlobalGoalsRecord.fromSnapshot(s));

  static Future<GlobalGoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GlobalGoalsRecord.fromSnapshot(s));

  static GlobalGoalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlobalGoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlobalGoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlobalGoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlobalGoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlobalGoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlobalGoalsRecordData({
  String? globalGoal,
  String? team,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'GlobalGoal': globalGoal,
      'Team': team,
    }.withoutNulls,
  );

  return firestoreData;
}

class GlobalGoalsRecordDocumentEquality implements Equality<GlobalGoalsRecord> {
  const GlobalGoalsRecordDocumentEquality();

  @override
  bool equals(GlobalGoalsRecord? e1, GlobalGoalsRecord? e2) {
    return e1?.globalGoal == e2?.globalGoal && e1?.team == e2?.team;
  }

  @override
  int hash(GlobalGoalsRecord? e) =>
      const ListEquality().hash([e?.globalGoal, e?.team]);

  @override
  bool isValidKey(Object? o) => o is GlobalGoalsRecord;
}
