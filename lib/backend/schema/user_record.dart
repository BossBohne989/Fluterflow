import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "Team" field.
  String? _team;
  String get team => _team ?? '';
  bool hasTeam() => _team != null;

  // "TeamIMG" field.
  String? _teamIMG;
  String get teamIMG => _teamIMG ?? '';
  bool hasTeamIMG() => _teamIMG != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Team_Leader" field.
  bool? _teamLeader;
  bool get teamLeader => _teamLeader ?? false;
  bool hasTeamLeader() => _teamLeader != null;

  // "GameCode" field.
  String? _gameCode;
  String get gameCode => _gameCode ?? '';
  bool hasGameCode() => _gameCode != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _password = snapshotData['password'] as String?;
    _team = snapshotData['Team'] as String?;
    _teamIMG = snapshotData['TeamIMG'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _teamLeader = snapshotData['Team_Leader'] as bool?;
    _gameCode = snapshotData['GameCode'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('User')
          : FirebaseFirestore.instance.collectionGroup('User');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('User').doc(id);

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? password,
  String? team,
  String? teamIMG,
  String? photoUrl,
  String? phoneNumber,
  bool? teamLeader,
  String? gameCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'password': password,
      'Team': team,
      'TeamIMG': teamIMG,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'Team_Leader': teamLeader,
      'GameCode': gameCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.password == e2?.password &&
        e1?.team == e2?.team &&
        e1?.teamIMG == e2?.teamIMG &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.teamLeader == e2?.teamLeader &&
        e1?.gameCode == e2?.gameCode;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.password,
        e?.team,
        e?.teamIMG,
        e?.photoUrl,
        e?.phoneNumber,
        e?.teamLeader,
        e?.gameCode
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
