import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupeMessageRecord extends FirestoreRecord {
  GroupeMessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "ts" field.
  DateTime? _ts;
  DateTime? get ts => _ts;
  bool hasTs() => _ts != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "Team" field.
  String? _team;
  String get team => _team ?? '';
  bool hasTeam() => _team != null;

  // "lastmessage" field.
  String? _lastmessage;
  String get lastmessage => _lastmessage ?? '';
  bool hasLastmessage() => _lastmessage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _ts = snapshotData['ts'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _user = snapshotData['user'] as String?;
    _team = snapshotData['Team'] as String?;
    _lastmessage = snapshotData['lastmessage'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Groupe_Message')
          : FirebaseFirestore.instance.collectionGroup('Groupe_Message');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Groupe_Message').doc(id);

  static Stream<GroupeMessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupeMessageRecord.fromSnapshot(s));

  static Future<GroupeMessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupeMessageRecord.fromSnapshot(s));

  static GroupeMessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupeMessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupeMessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupeMessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupeMessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupeMessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupeMessageRecordData({
  String? message,
  DateTime? ts,
  String? uid,
  String? user,
  String? team,
  String? lastmessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'ts': ts,
      'uid': uid,
      'user': user,
      'Team': team,
      'lastmessage': lastmessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupeMessageRecordDocumentEquality
    implements Equality<GroupeMessageRecord> {
  const GroupeMessageRecordDocumentEquality();

  @override
  bool equals(GroupeMessageRecord? e1, GroupeMessageRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.ts == e2?.ts &&
        e1?.uid == e2?.uid &&
        e1?.user == e2?.user &&
        e1?.team == e2?.team &&
        e1?.lastmessage == e2?.lastmessage;
  }

  @override
  int hash(GroupeMessageRecord? e) => const ListEquality()
      .hash([e?.message, e?.ts, e?.uid, e?.user, e?.team, e?.lastmessage]);

  @override
  bool isValidKey(Object? o) => o is GroupeMessageRecord;
}