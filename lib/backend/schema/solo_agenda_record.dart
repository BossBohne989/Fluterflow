import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SoloAgendaRecord extends FirestoreRecord {
  SoloAgendaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Agenda" field.
  String? _agenda;
  String get agenda => _agenda ?? '';
  bool hasAgenda() => _agenda != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _agenda = snapshotData['Agenda'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('solo_Agenda')
          : FirebaseFirestore.instance.collectionGroup('solo_Agenda');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('solo_Agenda').doc(id);

  static Stream<SoloAgendaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SoloAgendaRecord.fromSnapshot(s));

  static Future<SoloAgendaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SoloAgendaRecord.fromSnapshot(s));

  static SoloAgendaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SoloAgendaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SoloAgendaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SoloAgendaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SoloAgendaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SoloAgendaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSoloAgendaRecordData({
  String? agenda,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Agenda': agenda,
    }.withoutNulls,
  );

  return firestoreData;
}

class SoloAgendaRecordDocumentEquality implements Equality<SoloAgendaRecord> {
  const SoloAgendaRecordDocumentEquality();

  @override
  bool equals(SoloAgendaRecord? e1, SoloAgendaRecord? e2) {
    return e1?.agenda == e2?.agenda;
  }

  @override
  int hash(SoloAgendaRecord? e) => const ListEquality().hash([e?.agenda]);

  @override
  bool isValidKey(Object? o) => o is SoloAgendaRecord;
}
