import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getOtherUser(
  List<String> userList,
  String authUser,
  String chatname,
) {
  if (chatname.isNotEmpty) {
    return chatname;
  } else if (userList.first == authUser)
    return userList.last;
  else if (userList.last == authUser) return userList.first;
}

String? getUser(
  List<String> userid,
  String authid,
) {
  if (userid[0] == authid) {
    return userid[1];
  } else {
    return userid[0];
  }
}

String createDisplayname(String email) {
  final splitted = email.split('@');
  String displayname = splitted[0];
  return displayname;
}

int addPlayerinTeam(int playerInTeam) {
  int nowPlayerInTeam = playerInTeam + 1;
  return nowPlayerInTeam;
}

String? searchTeam(
  String teamname,
  String userteam,
) {
  String team1, team2;
  final splitted = teamname.split('@');

  if (userteam == splitted[0])
    return splitted[0];
  else if (userteam == splitted[1]) return splitted[1];
}

int roundTimer(
  int round,
  double roundOne,
  double roundTwo,
  double roundThree,
  double roundFour,
  double roundFive,
) {
  switch (round) {
    case 1:
      {
        round++;
        return roundOne as int;
      }
    case 2:
      {
        round++;
        return roundTwo as int;
      }
    case 3:
      {
        round++;
        return roundThree as int;
      }
    case 4:
      {
        round++;
        return roundFour as int;
      }
    case 5:
      {
        round++;
        return roundFive as int;
      }
  }
  return 0;
}

int updateRound(int round) {
  round = round + 1;
  return round;
}

double changeFormat(double roundtime) {
  double tempsek, tempmili;

  tempsek = roundtime * 60;
  tempmili = tempsek * 1000;
  roundtime = tempmili;
  return roundtime;
}

double changeFormatBack(double timeback) {
  double tempsek, tempmin;

  tempsek = timeback / 1000;
  tempmin = tempsek / 60;
  timeback = tempmin;
  return timeback;
}

bool checkteam(
  String userTeam,
  List<String> groupTeam,
) {
  if (groupTeam.contains(userTeam)) {
    return true;
  } else {
    return false;
  }
}

Color changecolor(Color button) {
  if (button == Colors.white) {
    return Colors.green;
  } else {
    return Colors.white;
  }
}

bool checkagreement(
  List<String> teams,
  List<bool> status,
) {
  int counttrue = 0;
  int countfalse = 0;

  if (status.length == teams.length) {
    for (int i = 0; i < teams.length; i++) {
      if (status[i] == true) {
        counttrue++;
      } else {
        countfalse++;
      }
    }
    if (counttrue > countfalse) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

int downrankRound(int round) {
  round = round - 1;
  return round;
}

String? teamIMG(
  List<String> teams,
  String? userTeam,
) {
  if (teams.first == userTeam)
    return teams.last;
  else if (teams.last == userTeam) return teams.first;
}

int? checkID(List<String> agendas) {
  int count = agendas.length;

  return count++;
}

List<String> addPlayerInAgreement(
  List<String> teamListID,
  String userID,
) {
  // Hinzufügen der userID zur entsprechenden Liste, wenn sie noch nicht vorhanden ist
  teamListID.add(userID);
  return teamListID;
}

String? getOtherDisplayname(
  List<String> userid,
  String authid,
  List<String> displayname,
) {
  for (int i = 0; i < userid.length; i++) {
    if (userid[i] == authid) {
      return displayname[i];
    }
  }
}

int subPlayerinTeam(int playerInTeam) {
  int nowPlayerInTeam = playerInTeam - 1;
  return nowPlayerInTeam;
}
