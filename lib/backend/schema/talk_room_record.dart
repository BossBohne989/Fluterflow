import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TalkRoomRecord extends FirestoreRecord {
  TalkRoomRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Teamname" field.
  String? _teamname;
  String get teamname => _teamname ?? '';
  bool hasTeamname() => _teamname != null;

  // "Thema" field.
  String? _thema;
  String get thema => _thema ?? '';
  bool hasThema() => _thema != null;

  // "TeamIMG" field.
  String? _teamIMG;
  String get teamIMG => _teamIMG ?? '';
  bool hasTeamIMG() => _teamIMG != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _teamname = snapshotData['Teamname'] as String?;
    _thema = snapshotData['Thema'] as String?;
    _teamIMG = snapshotData['TeamIMG'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Talk_Room')
          : FirebaseFirestore.instance.collectionGroup('Talk_Room');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Talk_Room').doc(id);

  static Stream<TalkRoomRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TalkRoomRecord.fromSnapshot(s));

  static Future<TalkRoomRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TalkRoomRecord.fromSnapshot(s));

  static TalkRoomRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TalkRoomRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TalkRoomRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TalkRoomRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TalkRoomRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TalkRoomRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTalkRoomRecordData({
  String? teamname,
  String? thema,
  String? teamIMG,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Teamname': teamname,
      'Thema': thema,
      'TeamIMG': teamIMG,
    }.withoutNulls,
  );

  return firestoreData;
}

class TalkRoomRecordDocumentEquality implements Equality<TalkRoomRecord> {
  const TalkRoomRecordDocumentEquality();

  @override
  bool equals(TalkRoomRecord? e1, TalkRoomRecord? e2) {
    return e1?.teamname == e2?.teamname &&
        e1?.thema == e2?.thema &&
        e1?.teamIMG == e2?.teamIMG;
  }

  @override
  int hash(TalkRoomRecord? e) =>
      const ListEquality().hash([e?.teamname, e?.thema, e?.teamIMG]);

  @override
  bool isValidKey(Object? o) => o is TalkRoomRecord;
}
