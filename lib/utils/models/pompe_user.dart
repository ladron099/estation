// To parse this JSON data, do
//
//     final pompeuser = pompeuserFromJson(jsonString);

import 'dart:convert';

import 'package:estation/utils/models/User.dart';

Pompeuser pompeuserFromJson(String str) => Pompeuser.fromJson(json.decode(str));

String pompeuserToJson(Pompeuser data) => json.encode(data.toJson());

class Pompeuser {
    int? idPompeUser;
    Pompe? pompe;
    User? user;
    DateTime? dateDebut;
    DateTime? dateFin;
    bool? releve;

    Pompeuser({
        this.idPompeUser,
        this.pompe,
        this.user,
        this.dateDebut,
        this.dateFin,
        this.releve,
    });

    factory Pompeuser.fromJson(Map<String, dynamic> json) => Pompeuser(
        idPompeUser: json["idPompeUser"],
        pompe: json["pompe"] == null ? null : Pompe.fromJson(json["pompe"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        dateDebut: json["dateDebut"] == null ? null : DateTime.parse(json["dateDebut"]),
        dateFin: json["dateFin"] == null ? null : DateTime.parse(json["dateFin"]),
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

class Pompe {
    int? idPompe;
    String? nomPompe;

    Pompe({
        this.idPompe,
        this.nomPompe,
    });

    factory Pompe.fromJson(Map<String, dynamic> json) => Pompe(
        idPompe: json["id_pompe"],
        nomPompe: json["nom_pompe"],
    );

    Map<String, dynamic> toJson() => {
        "id_pompe": idPompe,
        "nom_pompe": nomPompe,
    };
}
 

