import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatGroupeRecord extends FirestoreRecord {
  ChatGroupeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "users" field.
  List<String>? _users;
  List<String> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "ts" field.
  DateTime? _ts;
  DateTime? get ts => _ts;
  bool hasTs() => _ts != null;

  // "user_names" field.
  List<String>? _userNames;
  List<String> get userNames => _userNames ?? const [];
  bool hasUserNames() => _userNames != null;

  // "Team" field.
  List<String>? _team;
  List<String> get team => _team ?? const [];
  bool hasTeam() => _team != null;

  // "TeamIMG" field.
  String? _teamIMG;
  String get teamIMG => _teamIMG ?? '';
  bool hasTeamIMG() => _teamIMG != null;

  // "ChatName" field.
  List<String>? _chatName;
  List<String> get chatName => _chatName ?? const [];
  bool hasChatName() => _chatName != null;

  // "importantmessage" field.
  bool? _importantmessage;
  bool get importantmessage => _importantmessage ?? false;
  bool hasImportantmessage() => _importantmessage != null;

  // "importantmessagetext" field.
  String? _importantmessagetext;
  String get importantmessagetext => _importantmessagetext ?? '';
  bool hasImportantmessagetext() => _importantmessagetext != null;

  // "groupchat" field.
  bool? _groupchat;
  bool get groupchat => _groupchat ?? false;
  bool hasGroupchat() => _groupchat != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['users']);
    _lastMessage = snapshotData['last_message'] as String?;
    _ts = snapshotData['ts'] as DateTime?;
    _userNames = getDataList(snapshotData['user_names']);
    _team = getDataList(snapshotData['Team']);
    _teamIMG = snapshotData['TeamIMG'] as String?;
    _chatName = getDataList(snapshotData['ChatName']);
    _importantmessage = snapshotData['importantmessage'] as bool?;
    _importantmessagetext = snapshotData['importantmessagetext'] as String?;
    _groupchat = snapshotData['groupchat'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chat_Groupe');

  static Stream<ChatGroupeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatGroupeRecord.fromSnapshot(s));

  static Future<ChatGroupeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatGroupeRecord.fromSnapshot(s));

  static ChatGroupeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatGroupeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatGroupeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatGroupeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatGroupeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatGroupeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatGroupeRecordData({
  String? lastMessage,
  DateTime? ts,
  String? teamIMG,
  bool? importantmessage,
  String? importantmessagetext,
  bool? groupchat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_message': lastMessage,
      'ts': ts,
      'TeamIMG': teamIMG,
      'importantmessage': importantmessage,
      'importantmessagetext': importantmessagetext,
      'groupchat': groupchat,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatGroupeRecordDocumentEquality implements Equality<ChatGroupeRecord> {
  const ChatGroupeRecordDocumentEquality();

  @override
  bool equals(ChatGroupeRecord? e1, ChatGroupeRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.ts == e2?.ts &&
        listEquality.equals(e1?.userNames, e2?.userNames) &&
        listEquality.equals(e1?.team, e2?.team) &&
        e1?.teamIMG == e2?.teamIMG &&
        listEquality.equals(e1?.chatName, e2?.chatName) &&
        e1?.importantmessage == e2?.importantmessage &&
        e1?.importantmessagetext == e2?.importantmessagetext &&
        e1?.groupchat == e2?.groupchat;
  }

  @override
  int hash(ChatGroupeRecord? e) => const ListEquality().hash([
        e?.users,
        e?.lastMessage,
        e?.ts,
        e?.userNames,
        e?.team,
        e?.teamIMG,
        e?.chatName,
        e?.importantmessage,
        e?.importantmessagetext,
        e?.groupchat
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatGroupeRecord;
}
