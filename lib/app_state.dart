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
    await _safeInitAsync(() async {
      _MemberTalkRoom =
          await secureStorage.getBool('ff_MemberTalkRoom') ?? _MemberTalkRoom;
    });
    await _safeInitAsync(() async {
      _MemberPreHome =
          await secureStorage.getBool('ff_MemberPreHome') ?? _MemberPreHome;
    });
    await _safeInitAsync(() async {
      _MemberPreGoals =
          await secureStorage.getBool('ff_MemberPreGoals') ?? _MemberPreGoals;
    });
    await _safeInitAsync(() async {
      _isReady = await secureStorage.getString('ff_isReady') ?? _isReady;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DocumentReference? _activeChat;
  DocumentReference? get activeChat => _activeChat;
  set activeChat(DocumentReference? value) {
    _activeChat = value;
    value != null
        ? secureStorage.setString('ff_activeChat', value.path)
        : secureStorage.remove('ff_activeChat');
  }

  void deleteActiveChat() {
    secureStorage.delete(key: 'ff_activeChat');
  }

  String _team = '';
  String get team => _team;
  set team(String value) {
    _team = value;
  }

  String _teamImg = '';
  String get teamImg => _teamImg;
  set teamImg(String value) {
    _teamImg = value;
  }

  bool _searchMode = false;
  bool get searchMode => _searchMode;
  set searchMode(bool value) {
    _searchMode = value;
  }

  String _searchTeam = '';
  String get searchTeam => _searchTeam;
  set searchTeam(String value) {
    _searchTeam = value;
  }

  String _Teamname = '';
  String get Teamname => _Teamname;
  set Teamname(String value) {
    _Teamname = value;
  }

  String _WhichRoomJoin = '';
  String get WhichRoomJoin => _WhichRoomJoin;
  set WhichRoomJoin(String value) {
    _WhichRoomJoin = value;
  }

  String _TalkCountrie = '';
  String get TalkCountrie => _TalkCountrie;
  set TalkCountrie(String value) {
    _TalkCountrie = value;
  }

  bool _GameStart = false;
  bool get GameStart => _GameStart;
  set GameStart(bool value) {
    _GameStart = value;
  }

  bool _RoundRdy = false;
  bool get RoundRdy => _RoundRdy;
  set RoundRdy(bool value) {
    _RoundRdy = value;
  }

  String _TeamSpeech = '';
  String get TeamSpeech => _TeamSpeech;
  set TeamSpeech(String value) {
    _TeamSpeech = value;
  }

  List<String> _checkboxtrue = [];
  List<String> get checkboxtrue => _checkboxtrue;
  set checkboxtrue(List<String> value) {
    _checkboxtrue = value;
  }

  void addToCheckboxtrue(String value) {
    checkboxtrue.add(value);
  }

  void removeFromCheckboxtrue(String value) {
    checkboxtrue.remove(value);
  }

  void removeAtIndexFromCheckboxtrue(int index) {
    checkboxtrue.removeAt(index);
  }

  void updateCheckboxtrueAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkboxtrue[index] = updateFn(_checkboxtrue[index]);
  }

  void insertAtIndexInCheckboxtrue(int index, String value) {
    checkboxtrue.insert(index, value);
  }

  List<String> _checkboxteam = [];
  List<String> get checkboxteam => _checkboxteam;
  set checkboxteam(List<String> value) {
    _checkboxteam = value;
  }

  void addToCheckboxteam(String value) {
    checkboxteam.add(value);
  }

  void removeFromCheckboxteam(String value) {
    checkboxteam.remove(value);
  }

  void removeAtIndexFromCheckboxteam(int index) {
    checkboxteam.removeAt(index);
  }

  void updateCheckboxteamAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkboxteam[index] = updateFn(_checkboxteam[index]);
  }

  void insertAtIndexInCheckboxteam(int index, String value) {
    checkboxteam.insert(index, value);
  }

  List<String> _checkboxDisplayname = [];
  List<String> get checkboxDisplayname => _checkboxDisplayname;
  set checkboxDisplayname(List<String> value) {
    _checkboxDisplayname = value;
  }

  void addToCheckboxDisplayname(String value) {
    checkboxDisplayname.add(value);
  }

  void removeFromCheckboxDisplayname(String value) {
    checkboxDisplayname.remove(value);
  }

  void removeAtIndexFromCheckboxDisplayname(int index) {
    checkboxDisplayname.removeAt(index);
  }

  void updateCheckboxDisplaynameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkboxDisplayname[index] = updateFn(_checkboxDisplayname[index]);
  }

  void insertAtIndexInCheckboxDisplayname(int index, String value) {
    checkboxDisplayname.insert(index, value);
  }

  bool _checkBoxPublic = false;
  bool get checkBoxPublic => _checkBoxPublic;
  set checkBoxPublic(bool value) {
    _checkBoxPublic = value;
  }

  bool _checkBoxPrivate = false;
  bool get checkBoxPrivate => _checkBoxPrivate;
  set checkBoxPrivate(bool value) {
    _checkBoxPrivate = value;
  }

  bool _AddAgenda = false;
  bool get AddAgenda => _AddAgenda;
  set AddAgenda(bool value) {
    _AddAgenda = value;
  }

  DocumentReference? _activeGroupchat;
  DocumentReference? get activeGroupchat => _activeGroupchat;
  set activeGroupchat(DocumentReference? value) {
    _activeGroupchat = value;
  }

  bool _UserLeader = false;
  bool get UserLeader => _UserLeader;
  set UserLeader(bool value) {
    _UserLeader = value;
  }

  String _whichTheme = '';
  String get whichTheme => _whichTheme;
  set whichTheme(String value) {
    _whichTheme = value;
  }

  DocumentReference? _activAgreement;
  DocumentReference? get activAgreement => _activAgreement;
  set activAgreement(DocumentReference? value) {
    _activAgreement = value;
  }

  String _TalkTeam = '';
  String get TalkTeam => _TalkTeam;
  set TalkTeam(String value) {
    _TalkTeam = value;
  }

  String _TalkTeamname = '';
  String get TalkTeamname => _TalkTeamname;
  set TalkTeamname(String value) {
    _TalkTeamname = value;
  }

  bool _agreement = true;
  bool get agreement => _agreement;
  set agreement(bool value) {
    _agreement = value;
  }

  bool _LeaveTeam = false;
  bool get LeaveTeam => _LeaveTeam;
  set LeaveTeam(bool value) {
    _LeaveTeam = value;
  }

  bool _Communique = false;
  bool get Communique => _Communique;
  set Communique(bool value) {
    _Communique = value;
  }

  bool _checkagreement = false;
  bool get checkagreement => _checkagreement;
  set checkagreement(bool value) {
    _checkagreement = value;
  }

  bool _Agreementused = false;
  bool get Agreementused => _Agreementused;
  set Agreementused(bool value) {
    _Agreementused = value;
  }

  String _Email = '';
  String get Email => _Email;
  set Email(String value) {
    _Email = value;
  }

  String _Name = '';
  String get Name => _Name;
  set Name(String value) {
    _Name = value;
  }

  String _Password = '';
  String get Password => _Password;
  set Password(String value) {
    _Password = value;
  }

  String _UID = '';
  String get UID => _UID;
  set UID(String value) {
    _UID = value;
  }

  bool _CreatedGameInfo = false;
  bool get CreatedGameInfo => _CreatedGameInfo;
  set CreatedGameInfo(bool value) {
    _CreatedGameInfo = value;
  }

  bool _Generalgoals = false;
  bool get Generalgoals => _Generalgoals;
  set Generalgoals(bool value) {
    _Generalgoals = value;
  }

  bool _InfoText = false;
  bool get InfoText => _InfoText;
  set InfoText(bool value) {
    _InfoText = value;
  }

  bool _EndGame = false;
  bool get EndGame => _EndGame;
  set EndGame(bool value) {
    _EndGame = value;
  }

  bool _chatinfo = false;
  bool get chatinfo => _chatinfo;
  set chatinfo(bool value) {
    _chatinfo = value;
  }

  String _GameCode = '';
  String get GameCode => _GameCode;
  set GameCode(String value) {
    _GameCode = value;
    secureStorage.setString('ff_GameCode', value);
  }

  void deleteGameCode() {
    secureStorage.delete(key: 'ff_GameCode');
  }

  bool _MemberHome = false;
  bool get MemberHome => _MemberHome;
  set MemberHome(bool value) {
    _MemberHome = value;
    secureStorage.setBool('ff_MemberHome', value);
  }

  void deleteMemberHome() {
    secureStorage.delete(key: 'ff_MemberHome');
  }

  bool _MemberAbkommen = false;
  bool get MemberAbkommen => _MemberAbkommen;
  set MemberAbkommen(bool value) {
    _MemberAbkommen = value;
    secureStorage.setBool('ff_MemberAbkommen', value);
  }

  void deleteMemberAbkommen() {
    secureStorage.delete(key: 'ff_MemberAbkommen');
  }

  bool _MemberAbkommenCreate = false;
  bool get MemberAbkommenCreate => _MemberAbkommenCreate;
  set MemberAbkommenCreate(bool value) {
    _MemberAbkommenCreate = value;
    secureStorage.setBool('ff_MemberAbkommenCreate', value);
  }

  void deleteMemberAbkommenCreate() {
    secureStorage.delete(key: 'ff_MemberAbkommenCreate');
  }

  bool _MemberAbkommenInfo = false;
  bool get MemberAbkommenInfo => _MemberAbkommenInfo;
  set MemberAbkommenInfo(bool value) {
    _MemberAbkommenInfo = value;
    secureStorage.setBool('ff_MemberAbkommenInfo', value);
  }

  void deleteMemberAbkommenInfo() {
    secureStorage.delete(key: 'ff_MemberAbkommenInfo');
  }

  bool _MemberTalkRoom = false;
  bool get MemberTalkRoom => _MemberTalkRoom;
  set MemberTalkRoom(bool value) {
    _MemberTalkRoom = value;
    secureStorage.setBool('ff_MemberTalkRoom', value);
  }

  void deleteMemberTalkRoom() {
    secureStorage.delete(key: 'ff_MemberTalkRoom');
  }

  bool _MemberPreHome = false;
  bool get MemberPreHome => _MemberPreHome;
  set MemberPreHome(bool value) {
    _MemberPreHome = value;
    secureStorage.setBool('ff_MemberPreHome', value);
  }

  void deleteMemberPreHome() {
    secureStorage.delete(key: 'ff_MemberPreHome');
  }

  bool _MemberPreGoals = false;
  bool get MemberPreGoals => _MemberPreGoals;
  set MemberPreGoals(bool value) {
    _MemberPreGoals = value;
    secureStorage.setBool('ff_MemberPreGoals', value);
  }

  void deleteMemberPreGoals() {
    secureStorage.delete(key: 'ff_MemberPreGoals');
  }

  String _isReady = '';
  String get isReady => _isReady;
  set isReady(String value) {
    _isReady = value;
    secureStorage.setString('ff_isReady', value);
  }

  void deleteIsReady() {
    secureStorage.delete(key: 'ff_isReady');
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
