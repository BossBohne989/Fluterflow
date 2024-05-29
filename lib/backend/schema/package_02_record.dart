import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Package02Record extends FirestoreRecord {
  Package02Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "country_Name" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  bool hasCountryName() => _countryName != null;

  // "country_IMG" field.
  String? _countryIMG;
  String get countryIMG => _countryIMG ?? '';
  bool hasCountryIMG() => _countryIMG != null;

  // "Player_Team" field.
  int? _playerTeam;
  int get playerTeam => _playerTeam ?? 0;
  bool hasPlayerTeam() => _playerTeam != null;

  // "Player_Max" field.
  int? _playerMax;
  int get playerMax => _playerMax ?? 0;
  bool hasPlayerMax() => _playerMax != null;

  void _initializeFields() {
    _countryName = snapshotData['country_Name'] as String?;
    _countryIMG = snapshotData['country_IMG'] as String?;
    _playerTeam = castToType<int>(snapshotData['Player_Team']);
    _playerMax = castToType<int>(snapshotData['Player_Max']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Package_02');

  static Stream<Package02Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Package02Record.fromSnapshot(s));

  static Future<Package02Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Package02Record.fromSnapshot(s));

  static Package02Record fromSnapshot(DocumentSnapshot snapshot) =>
      Package02Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Package02Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Package02Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Package02Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Package02Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPackage02RecordData({
  String? countryName,
  String? countryIMG,
  int? playerTeam,
  int? playerMax,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'country_Name': countryName,
      'country_IMG': countryIMG,
      'Player_Team': playerTeam,
      'Player_Max': playerMax,
    }.withoutNulls,
  );

  return firestoreData;
}

class Package02RecordDocumentEquality implements Equality<Package02Record> {
  const Package02RecordDocumentEquality();

  @override
  bool equals(Package02Record? e1, Package02Record? e2) {
    return e1?.countryName == e2?.countryName &&
        e1?.countryIMG == e2?.countryIMG &&
        e1?.playerTeam == e2?.playerTeam &&
        e1?.playerMax == e2?.playerMax;
  }

  @override
  int hash(Package02Record? e) => const ListEquality()
      .hash([e?.countryName, e?.countryIMG, e?.playerTeam, e?.playerMax]);

  @override
  bool isValidKey(Object? o) => o is Package02Record;
}