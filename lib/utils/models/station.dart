// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);

import 'dart:convert';

import 'package:estation/utils/models/User.dart';

Station stationFromJson(String str) => Station.fromJson(json.decode(str));

String stationToJson(Station data) => json.encode(data.toJson());

class Station {
  int? id;
  String? nomStation;
  String? adresse;
  List<Service>? services;
  List<UserElement>? users;

  Station({
    this.id,
    this.nomStation,
    this.adresse,
    this.services,
    this.users,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json["id"],
        nomStation: json["nom_station"],
        adresse: json["adresse"],
        services: json["services"] == null
            ? []
            : List<Service>.from(
                json["services"]!.map((x) => Service.fromJson(x))),
        users: json["users"] == null
            ? []
            : List<UserElement>.from(
                json["users"]!.map((x) => UserElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_station": nomStation,
        "adresse": adresse,
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
        "users": users == null
            ? []
            : List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}

class Service {
  int? id;
  String? nomService;
  String? description;

  Service({
    this.id,
    this.nomService,
    this.description,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        nomService: json["nom_service"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_service": nomService,
        "description": description,
      };
}

class UserElement {
  User? user;
  DateTime? dateDebut;
  DateTime? dateFin;

  UserElement({
    this.user,
    this.dateDebut,
    this.dateFin,
  });

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        dateDebut: json["date_debut"] == null
            ? null
            : DateTime.parse(json["date_debut"]),
        dateFin:
            json["date_fin"] == null ? null : DateTime.parse(json["date_fin"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "date_debut": dateDebut?.toIso8601String(),
        "date_fin": dateFin?.toIso8601String(),
      };
}
