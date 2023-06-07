// To parse this JSON data, do
//
//     final releve = releveFromJson(jsonString);

import 'dart:convert';

import 'package:estation/utils/models/pompe_user.dart';

import 'User.dart';

Releve releveFromJson(String str) => Releve.fromJson(json.decode(str));

String releveToJson(Releve data) => json.encode(data.toJson());

class Releve {
  List<ReleveElement>? releve;
  String? msg;

  Releve({
    this.releve,
    this.msg,
  });

  factory Releve.fromJson(Map<String, dynamic> json) => Releve(
        releve: json["releve"] == null
            ? []
            : List<ReleveElement>.from(
                json["releve"]!.map((x) => ReleveElement.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "releve": releve == null
            ? []
            : List<dynamic>.from(releve!.map((x) => x.toJson())),
        "msg": msg,
      };
}

class ReleveElement {
  int? idReleve;
  PompeUser? pompeUser;
  DateTime? dateReleve;
  int? compteur;

  ReleveElement({
    this.idReleve,
    this.pompeUser,
    this.dateReleve,
    this.compteur,
  });

  factory ReleveElement.fromJson(Map<String, dynamic> json) => ReleveElement(
        idReleve: json["id_releve"],
        pompeUser: json["pompeUser"] == null
            ? null
            : PompeUser.fromJson(json["pompeUser"]),
        dateReleve: json["date_releve"] == null
            ? null
            : DateTime.parse(json["date_releve"]),
        compteur: json["compteur"],
      );

  Map<String, dynamic> toJson() => {
        "id_releve": idReleve,
        "pompeUser": pompeUser?.toJson(),
        "date_releve": dateReleve?.toIso8601String(),
        "compteur": compteur,
      };
}

class PompeUser {
  int? idPompeUser;
  Pompe? pompe;
  User? user;
  DateTime? dateDebut;
  DateTime? dateFin;
  bool? releve;

  PompeUser({
    this.idPompeUser,
    this.pompe,
    this.user,
    this.dateDebut,
    this.dateFin,
    this.releve,
  });

  factory PompeUser.fromJson(Map<String, dynamic> json) => PompeUser(
        idPompeUser: json["idPompeUser"],
        pompe: json["pompe"] == null ? null : Pompe.fromJson(json["pompe"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        dateDebut: json["dateDebut"] == null
            ? null
            : DateTime.parse(json["dateDebut"]),
        dateFin:
            json["dateFin"] == null ? null : DateTime.parse(json["dateFin"]),
        releve: json["releve"],
      );

  Map<String, dynamic> toJson() => {
        "idPompeUser": idPompeUser,
        "pompe": pompe?.toJson(),
        "user": user?.toJson(),
        "dateDebut": dateDebut?.toIso8601String(),
        "dateFin": dateFin?.toIso8601String(),
        "releve": releve,
      };
}
