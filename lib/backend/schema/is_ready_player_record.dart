import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IsReadyPlayerRecord extends FirestoreRecord {
  IsReadyPlayerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Player" field.
  String? _player;
  String get player => _player ?? '';
  bool hasPlayer() => _player != null;

  // "isReady" field.
  bool? _isReady;
  bool get isReady => _isReady ?? false;
  bool hasIsReady() => _isReady != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _player = snapshotData['Player'] as String?;
    _isReady = snapshotData['isReady'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('IsReadyPlayer')
          : FirebaseFirestore.instance.collectionGroup('IsReadyPlayer');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('IsReadyPlayer').doc(id);

  static Stream<IsReadyPlayerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IsReadyPlayerRecord.fromSnapshot(s));

  static Future<IsReadyPlayerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IsReadyPlayerRecord.fromSnapshot(s));

  static IsReadyPlayerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IsReadyPlayerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IsReadyPlayerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IsReadyPlayerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IsReadyPlayerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IsReadyPlayerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIsReadyPlayerRecordData({
  String? player,
  bool? isReady,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Player': player,
      'isReady': isReady,
    }.withoutNulls,
  );

  return firestoreData;
}

class IsReadyPlayerRecordDocumentEquality
    implements Equality<IsReadyPlayerRecord> {
  const IsReadyPlayerRecordDocumentEquality();

  @override
  bool equals(IsReadyPlayerRecord? e1, IsReadyPlayerRecord? e2) {
    return e1?.player == e2?.player && e1?.isReady == e2?.isReady;
  }

  @override
  int hash(IsReadyPlayerRecord? e) =>
      const ListEquality().hash([e?.player, e?.isReady]);

  @override
  bool isValidKey(Object? o) => o is IsReadyPlayerRecord;
}
