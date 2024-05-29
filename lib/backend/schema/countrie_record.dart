import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountrieRecord extends FirestoreRecord {
  CountrieRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Team_Leader" field.
  bool? _teamLeader;
  bool get teamLeader => _teamLeader ?? false;
  bool hasTeamLeader() => _teamLeader != null;

  // "Max_Player" field.
  int? _maxPlayer;
  int get maxPlayer => _maxPlayer ?? 0;
  bool hasMaxPlayer() => _maxPlayer != null;

  // "Player_Team" field.
  int? _playerTeam;
  int get playerTeam => _playerTeam ?? 0;
  bool hasPlayerTeam() => _playerTeam != null;

  // "country_IMG" field.
  String? _countryIMG;
  String get countryIMG => _countryIMG ?? '';
  bool hasCountryIMG() => _countryIMG != null;

  // "country_Name" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  bool hasCountryName() => _countryName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _teamLeader = snapshotData['Team_Leader'] as bool?;
    _maxPlayer = castToType<int>(snapshotData['Max_Player']);
    _playerTeam = castToType<int>(snapshotData['Player_Team']);
    _countryIMG = snapshotData['country_IMG'] as String?;
    _countryName = snapshotData['country_Name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('countrie')
          : FirebaseFirestore.instance.collectionGroup('countrie');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('countrie').doc(id);

  static Stream<CountrieRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountrieRecord.fromSnapshot(s));

  static Future<CountrieRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountrieRecord.fromSnapshot(s));

  static CountrieRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountrieRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountrieRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountrieRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountrieRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountrieRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountrieRecordData({
  bool? teamLeader,
  int? maxPlayer,
  int? playerTeam,
  String? countryIMG,
  String? countryName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Team_Leader': teamLeader,
      'Max_Player': maxPlayer,
      'Player_Team': playerTeam,
      'country_IMG': countryIMG,
      'country_Name': countryName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountrieRecordDocumentEquality implements Equality<CountrieRecord> {
  const CountrieRecordDocumentEquality();

  @override
  bool equals(CountrieRecord? e1, CountrieRecord? e2) {
    return e1?.teamLeader == e2?.teamLeader &&
        e1?.maxPlayer == e2?.maxPlayer &&
        e1?.playerTeam == e2?.playerTeam &&
        e1?.countryIMG == e2?.countryIMG &&
        e1?.countryName == e2?.countryName;
  }

  @override
  int hash(CountrieRecord? e) => const ListEquality().hash([
        e?.teamLeader,
        e?.maxPlayer,
        e?.playerTeam,
        e?.countryIMG,
        e?.countryName
      ]);

  @override
  bool isValidKey(Object? o) => o is CountrieRecord;
}
