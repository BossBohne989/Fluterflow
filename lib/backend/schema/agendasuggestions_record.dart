import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendasuggestionsRecord extends FirestoreRecord {
  AgendasuggestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Agenda" field.
  String? _agenda;
  String get agenda => _agenda ?? '';
  bool hasAgenda() => _agenda != null;

  // "Team" field.
  String? _team;
  String get team => _team ?? '';
  bool hasTeam() => _team != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _agenda = snapshotData['Agenda'] as String?;
    _team = snapshotData['Team'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Agendasuggestions')
          : FirebaseFirestore.instance.collectionGroup('Agendasuggestions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Agendasuggestions').doc(id);

  static Stream<AgendasuggestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgendasuggestionsRecord.fromSnapshot(s));

  static Future<AgendasuggestionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AgendasuggestionsRecord.fromSnapshot(s));

  static AgendasuggestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AgendasuggestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgendasuggestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgendasuggestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgendasuggestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgendasuggestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgendasuggestionsRecordData({
  String? agenda,
  String? team,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Agenda': agenda,
      'Team': team,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgendasuggestionsRecordDocumentEquality
    implements Equality<AgendasuggestionsRecord> {
  const AgendasuggestionsRecordDocumentEquality();

  @override
  bool equals(AgendasuggestionsRecord? e1, AgendasuggestionsRecord? e2) {
    return e1?.agenda == e2?.agenda && e1?.team == e2?.team;
  }

  @override
  int hash(AgendasuggestionsRecord? e) =>
      const ListEquality().hash([e?.agenda, e?.team]);

  @override
  bool isValidKey(Object? o) => o is AgendasuggestionsRecord;
}
