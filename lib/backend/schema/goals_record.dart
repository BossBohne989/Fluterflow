import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalsRecord extends FirestoreRecord {
  GoalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  bool hasGoal() => _goal != null;

  // "TargetsToAgenda" field.
  String? _targetsToAgenda;
  String get targetsToAgenda => _targetsToAgenda ?? '';
  bool hasTargetsToAgenda() => _targetsToAgenda != null;

  // "Team" field.
  String? _team;
  String get team => _team ?? '';
  bool hasTeam() => _team != null;

  // "TeamIMG" field.
  String? _teamIMG;
  String get teamIMG => _teamIMG ?? '';
  bool hasTeamIMG() => _teamIMG != null;

  // "private" field.
  bool? _private;
  bool get private => _private ?? false;
  bool hasPrivate() => _private != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _goal = snapshotData['Goal'] as String?;
    _targetsToAgenda = snapshotData['TargetsToAgenda'] as String?;
    _team = snapshotData['Team'] as String?;
    _teamIMG = snapshotData['TeamIMG'] as String?;
    _private = snapshotData['private'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Goals')
          : FirebaseFirestore.instance.collectionGroup('Goals');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Goals').doc(id);

  static Stream<GoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalsRecord.fromSnapshot(s));

  static Future<GoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalsRecord.fromSnapshot(s));

  static GoalsRecord fromSnapshot(DocumentSnapshot snapshot) => GoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalsRecordData({
  String? goal,
  String? targetsToAgenda,
  String? team,
  String? teamIMG,
  bool? private,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Goal': goal,
      'TargetsToAgenda': targetsToAgenda,
      'Team': team,
      'TeamIMG': teamIMG,
      'private': private,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalsRecordDocumentEquality implements Equality<GoalsRecord> {
  const GoalsRecordDocumentEquality();

  @override
  bool equals(GoalsRecord? e1, GoalsRecord? e2) {
    return e1?.goal == e2?.goal &&
        e1?.targetsToAgenda == e2?.targetsToAgenda &&
        e1?.team == e2?.team &&
        e1?.teamIMG == e2?.teamIMG &&
        e1?.private == e2?.private;
  }

  @override
  int hash(GoalsRecord? e) => const ListEquality()
      .hash([e?.goal, e?.targetsToAgenda, e?.team, e?.teamIMG, e?.private]);

  @override
  bool isValidKey(Object? o) => o is GoalsRecord;
}
