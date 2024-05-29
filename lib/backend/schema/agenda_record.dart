import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendaRecord extends FirestoreRecord {
  AgendaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Agendas" field.
  List<String>? _agendas;
  List<String> get agendas => _agendas ?? const [];
  bool hasAgendas() => _agendas != null;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _agendas = getDataList(snapshotData['Agendas']);
    _id = castToType<int>(snapshotData['ID']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Agenda')
          : FirebaseFirestore.instance.collectionGroup('Agenda');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Agenda').doc(id);

  static Stream<AgendaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgendaRecord.fromSnapshot(s));

  static Future<AgendaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgendaRecord.fromSnapshot(s));

  static AgendaRecord fromSnapshot(DocumentSnapshot snapshot) => AgendaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgendaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgendaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgendaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgendaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgendaRecordData({
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgendaRecordDocumentEquality implements Equality<AgendaRecord> {
  const AgendaRecordDocumentEquality();

  @override
  bool equals(AgendaRecord? e1, AgendaRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.agendas, e2?.agendas) && e1?.id == e2?.id;
  }

  @override
  int hash(AgendaRecord? e) => const ListEquality().hash([e?.agendas, e?.id]);

  @override
  bool isValidKey(Object? o) => o is AgendaRecord;
}
