import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomRecord extends FirestoreRecord {
  RoomRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RoomName" field.
  String? _roomName;
  String get roomName => _roomName ?? '';
  bool hasRoomName() => _roomName != null;

  // "JoinCode" field.
  String? _joinCode;
  String get joinCode => _joinCode ?? '';
  bool hasJoinCode() => _joinCode != null;

  // "MembersInGame" field.
  int? _membersInGame;
  int get membersInGame => _membersInGame ?? 0;
  bool hasMembersInGame() => _membersInGame != null;

  // "WhichRound" field.
  int? _whichRound;
  int get whichRound => _whichRound ?? 0;
  bool hasWhichRound() => _whichRound != null;

  // "GameStart" field.
  bool? _gameStart;
  bool get gameStart => _gameStart ?? false;
  bool hasGameStart() => _gameStart != null;

  // "TalkStart" field.
  bool? _talkStart;
  bool get talkStart => _talkStart ?? false;
  bool hasTalkStart() => _talkStart != null;

  // "AgendaCreate" field.
  bool? _agendaCreate;
  bool get agendaCreate => _agendaCreate ?? false;
  bool hasAgendaCreate() => _agendaCreate != null;

  // "finishAgendaCreate" field.
  bool? _finishAgendaCreate;
  bool get finishAgendaCreate => _finishAgendaCreate ?? false;
  bool hasFinishAgendaCreate() => _finishAgendaCreate != null;

  // "Agendacount" field.
  int? _agendacount;
  int get agendacount => _agendacount ?? 0;
  bool hasAgendacount() => _agendacount != null;

  // "communique" field.
  String? _communique;
  String get communique => _communique ?? '';
  bool hasCommunique() => _communique != null;

  // "HowManyRounds" field.
  int? _howManyRounds;
  int get howManyRounds => _howManyRounds ?? 0;
  bool hasHowManyRounds() => _howManyRounds != null;

  void _initializeFields() {
    _roomName = snapshotData['RoomName'] as String?;
    _joinCode = snapshotData['JoinCode'] as String?;
    _membersInGame = castToType<int>(snapshotData['MembersInGame']);
    _whichRound = castToType<int>(snapshotData['WhichRound']);
    _gameStart = snapshotData['GameStart'] as bool?;
    _talkStart = snapshotData['TalkStart'] as bool?;
    _agendaCreate = snapshotData['AgendaCreate'] as bool?;
    _finishAgendaCreate = snapshotData['finishAgendaCreate'] as bool?;
    _agendacount = castToType<int>(snapshotData['Agendacount']);
    _communique = snapshotData['communique'] as String?;
    _howManyRounds = castToType<int>(snapshotData['HowManyRounds']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Room');

  static Stream<RoomRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoomRecord.fromSnapshot(s));

  static Future<RoomRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoomRecord.fromSnapshot(s));

  static RoomRecord fromSnapshot(DocumentSnapshot snapshot) => RoomRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoomRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoomRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoomRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoomRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoomRecordData({
  String? roomName,
  String? joinCode,
  int? membersInGame,
  int? whichRound,
  bool? gameStart,
  bool? talkStart,
  bool? agendaCreate,
  bool? finishAgendaCreate,
  int? agendacount,
  String? communique,
  int? howManyRounds,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RoomName': roomName,
      'JoinCode': joinCode,
      'MembersInGame': membersInGame,
      'WhichRound': whichRound,
      'GameStart': gameStart,
      'TalkStart': talkStart,
      'AgendaCreate': agendaCreate,
      'finishAgendaCreate': finishAgendaCreate,
      'Agendacount': agendacount,
      'communique': communique,
      'HowManyRounds': howManyRounds,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoomRecordDocumentEquality implements Equality<RoomRecord> {
  const RoomRecordDocumentEquality();

  @override
  bool equals(RoomRecord? e1, RoomRecord? e2) {
    return e1?.roomName == e2?.roomName &&
        e1?.joinCode == e2?.joinCode &&
        e1?.membersInGame == e2?.membersInGame &&
        e1?.whichRound == e2?.whichRound &&
        e1?.gameStart == e2?.gameStart &&
        e1?.talkStart == e2?.talkStart &&
        e1?.agendaCreate == e2?.agendaCreate &&
        e1?.finishAgendaCreate == e2?.finishAgendaCreate &&
        e1?.agendacount == e2?.agendacount &&
        e1?.communique == e2?.communique &&
        e1?.howManyRounds == e2?.howManyRounds;
  }

  @override
  int hash(RoomRecord? e) => const ListEquality().hash([
        e?.roomName,
        e?.joinCode,
        e?.membersInGame,
        e?.whichRound,
        e?.gameStart,
        e?.talkStart,
        e?.agendaCreate,
        e?.finishAgendaCreate,
        e?.agendacount,
        e?.communique,
        e?.howManyRounds
      ]);

  @override
  bool isValidKey(Object? o) => o is RoomRecord;
}
