import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _activeChat =
          (await secureStorage.getString('ff_activeChat'))?.ref ?? _activeChat;
    });
    await _safeInitAsync(() async {
      _GameCode = await secureStorage.getString('ff_GameCode') ?? _GameCode;
    });
    await _safeInitAsync(() async {
      _MemberHome = await secureStorage.getBool('ff_MemberHome') ?? _MemberHome;
    });
    await _safeInitAsync(() async {
      _MemberAbkommen =
          await secureStorage.getBool('ff_MemberAbkommen') ?? _MemberAbkommen;
    });
    await _safeInitAsync(() async {
      _MemberAbkommenCreate =
          await secureStorage.getBool('ff_MemberAbkommenCreate') ??
              _MemberAbkommenCreate;
    });
    await _safeInitAsync(() async {
      _MemberAbkommenInfo =
          await secureStorage.getBool('ff_MemberAbkommenInfo') ??
              _MemberAbkommenInfo;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DocumentReference? _activeChat;
  DocumentReference? get activeChat => _activeChat;
  set activeChat(DocumentReference? _value) {
    _activeChat = _value;
    _value != null
        ? secureStorage.setString('ff_activeChat', _value.path)
        : secureStorage.remove('ff_activeChat');
  }

  void deleteActiveChat() {
    secureStorage.delete(key: 'ff_activeChat');
  }

  String _team = '';
  String get team => _team;
  set team(String _value) {
    _team = _value;
  }

  String _teamImg = '';
  String get teamImg => _teamImg;
  set teamImg(String _value) {
    _teamImg = _value;
  }

  bool _searchMode = false;
  bool get searchMode => _searchMode;
  set searchMode(bool _value) {
    _searchMode = _value;
  }

  String _searchTeam = '';
  String get searchTeam => _searchTeam;
  set searchTeam(String _value) {
    _searchTeam = _value;
  }

  String _Teamname = '';
  String get Teamname => _Teamname;
  set Teamname(String _value) {
    _Teamname = _value;
  }

  String _WhichRoomJoin = '';
  String get WhichRoomJoin => _WhichRoomJoin;
  set WhichRoomJoin(String _value) {
    _WhichRoomJoin = _value;
  }

  String _TalkCountrie = '';
  String get TalkCountrie => _TalkCountrie;
  set TalkCountrie(String _value) {
    _TalkCountrie = _value;
  }

  bool _GameStart = false;
  bool get GameStart => _GameStart;
  set GameStart(bool _value) {
    _GameStart = _value;
  }

  bool _RoundRdy = false;
  bool get RoundRdy => _RoundRdy;
  set RoundRdy(bool _value) {
    _RoundRdy = _value;
  }

  String _TeamSpeech = '';
  String get TeamSpeech => _TeamSpeech;
  set TeamSpeech(String _value) {
    _TeamSpeech = _value;
  }

  List<String> _checkboxtrue = [];
  List<String> get checkboxtrue => _checkboxtrue;
  set checkboxtrue(List<String> _value) {
    _checkboxtrue = _value;
  }

  void addToCheckboxtrue(String _value) {
    _checkboxtrue.add(_value);
  }

  void removeFromCheckboxtrue(String _value) {
    _checkboxtrue.remove(_value);
  }

  void removeAtIndexFromCheckboxtrue(int _index) {
    _checkboxtrue.removeAt(_index);
  }

  void updateCheckboxtrueAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkboxtrue[_index] = updateFn(_checkboxtrue[_index]);
  }

  void insertAtIndexInCheckboxtrue(int _index, String _value) {
    _checkboxtrue.insert(_index, _value);
  }

  List<String> _checkboxteam = [];
  List<String> get checkboxteam => _checkboxteam;
  set checkboxteam(List<String> _value) {
    _checkboxteam = _value;
  }

  void addToCheckboxteam(String _value) {
    _checkboxteam.add(_value);
  }

  void removeFromCheckboxteam(String _value) {
    _checkboxteam.remove(_value);
  }

  void removeAtIndexFromCheckboxteam(int _index) {
    _checkboxteam.removeAt(_index);
  }

  void updateCheckboxteamAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkboxteam[_index] = updateFn(_checkboxteam[_index]);
  }

  void insertAtIndexInCheckboxteam(int _index, String _value) {
    _checkboxteam.insert(_index, _value);
  }

  List<String> _checkboxDisplayname = [];
  List<String> get checkboxDisplayname => _checkboxDisplayname;
  set checkboxDisplayname(List<String> _value) {
    _checkboxDisplayname = _value;
  }

  void addToCheckboxDisplayname(String _value) {
    _checkboxDisplayname.add(_value);
  }

  void removeFromCheckboxDisplayname(String _value) {
    _checkboxDisplayname.remove(_value);
  }

  void removeAtIndexFromCheckboxDisplayname(int _index) {
    _checkboxDisplayname.removeAt(_index);
  }

  void updateCheckboxDisplaynameAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkboxDisplayname[_index] = updateFn(_checkboxDisplayname[_index]);
  }

  void insertAtIndexInCheckboxDisplayname(int _index, String _value) {
    _checkboxDisplayname.insert(_index, _value);
  }

  bool _checkBoxPublic = false;
  bool get checkBoxPublic => _checkBoxPublic;
  set checkBoxPublic(bool _value) {
    _checkBoxPublic = _value;
  }

  bool _checkBoxPrivate = false;
  bool get checkBoxPrivate => _checkBoxPrivate;
  set checkBoxPrivate(bool _value) {
    _checkBoxPrivate = _value;
  }

  bool _AddAgenda = false;
  bool get AddAgenda => _AddAgenda;
  set AddAgenda(bool _value) {
    _AddAgenda = _value;
  }

  DocumentReference? _activeGroupchat;
  DocumentReference? get activeGroupchat => _activeGroupchat;
  set activeGroupchat(DocumentReference? _value) {
    _activeGroupchat = _value;
  }

  bool _UserLeader = false;
  bool get UserLeader => _UserLeader;
  set UserLeader(bool _value) {
    _UserLeader = _value;
  }

  String _whichTheme = '';
  String get whichTheme => _whichTheme;
  set whichTheme(String _value) {
    _whichTheme = _value;
  }

  DocumentReference? _activAgreement;
  DocumentReference? get activAgreement => _activAgreement;
  set activAgreement(DocumentReference? _value) {
    _activAgreement = _value;
  }

  String _TalkTeam = '';
  String get TalkTeam => _TalkTeam;
  set TalkTeam(String _value) {
    _TalkTeam = _value;
  }

  String _TalkTeamname = '';
  String get TalkTeamname => _TalkTeamname;
  set TalkTeamname(String _value) {
    _TalkTeamname = _value;
  }

  bool _agreement = true;
  bool get agreement => _agreement;
  set agreement(bool _value) {
    _agreement = _value;
  }

  bool _LeaveTeam = false;
  bool get LeaveTeam => _LeaveTeam;
  set LeaveTeam(bool _value) {
    _LeaveTeam = _value;
  }

  bool _Communique = false;
  bool get Communique => _Communique;
  set Communique(bool _value) {
    _Communique = _value;
  }

  bool _checkagreement = false;
  bool get checkagreement => _checkagreement;
  set checkagreement(bool _value) {
    _checkagreement = _value;
  }

  bool _Agreementused = false;
  bool get Agreementused => _Agreementused;
  set Agreementused(bool _value) {
    _Agreementused = _value;
  }

  String _Email = '';
  String get Email => _Email;
  set Email(String _value) {
    _Email = _value;
  }

  String _Name = '';
  String get Name => _Name;
  set Name(String _value) {
    _Name = _value;
  }

  String _Password = '';
  String get Password => _Password;
  set Password(String _value) {
    _Password = _value;
  }

  String _UID = '';
  String get UID => _UID;
  set UID(String _value) {
    _UID = _value;
  }

  bool _CreatedGameInfo = false;
  bool get CreatedGameInfo => _CreatedGameInfo;
  set CreatedGameInfo(bool _value) {
    _CreatedGameInfo = _value;
  }

  bool _Generalgoals = false;
  bool get Generalgoals => _Generalgoals;
  set Generalgoals(bool _value) {
    _Generalgoals = _value;
  }

  bool _InfoText = false;
  bool get InfoText => _InfoText;
  set InfoText(bool _value) {
    _InfoText = _value;
  }

  bool _EndGame = false;
  bool get EndGame => _EndGame;
  set EndGame(bool _value) {
    _EndGame = _value;
  }

  bool _chatinfo = false;
  bool get chatinfo => _chatinfo;
  set chatinfo(bool _value) {
    _chatinfo = _value;
  }

  String _GameCode = '';
  String get GameCode => _GameCode;
  set GameCode(String _value) {
    _GameCode = _value;
    secureStorage.setString('ff_GameCode', _value);
  }

  void deleteGameCode() {
    secureStorage.delete(key: 'ff_GameCode');
  }

  bool _MemberHome = false;
  bool get MemberHome => _MemberHome;
  set MemberHome(bool _value) {
    _MemberHome = _value;
    secureStorage.setBool('ff_MemberHome', _value);
  }

  void deleteMemberHome() {
    secureStorage.delete(key: 'ff_MemberHome');
  }

  bool _MemberAbkommen = false;
  bool get MemberAbkommen => _MemberAbkommen;
  set MemberAbkommen(bool _value) {
    _MemberAbkommen = _value;
    secureStorage.setBool('ff_MemberAbkommen', _value);
  }

  void deleteMemberAbkommen() {
    secureStorage.delete(key: 'ff_MemberAbkommen');
  }

  bool _MemberAbkommenCreate = false;
  bool get MemberAbkommenCreate => _MemberAbkommenCreate;
  set MemberAbkommenCreate(bool _value) {
    _MemberAbkommenCreate = _value;
    secureStorage.setBool('ff_MemberAbkommenCreate', _value);
  }

  void deleteMemberAbkommenCreate() {
    secureStorage.delete(key: 'ff_MemberAbkommenCreate');
  }

  bool _MemberAbkommenInfo = false;
  bool get MemberAbkommenInfo => _MemberAbkommenInfo;
  set MemberAbkommenInfo(bool _value) {
    _MemberAbkommenInfo = _value;
    secureStorage.setBool('ff_MemberAbkommenInfo', _value);
  }

  void deleteMemberAbkommenInfo() {
    secureStorage.delete(key: 'ff_MemberAbkommenInfo');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
