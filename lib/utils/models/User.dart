// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int? idUser;
    String? nom;
    String? prenom;
    String? email;
    String? matricule;
    Profile? profile;
    List<StationElement>? stations;
    List<PompeElement>? pompes;

    User({
        this.idUser,
        this.nom,
        this.prenom,
        this.email,
        this.matricule,
        this.profile,
        this.stations,
        this.pompes,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["id_user"],
        nom: json["nom"],
        prenom: json["prenom"],
        email: json["email"],
        matricule: json["matricule"],
        profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        stations: json["stations"] == null ? [] : List<StationElement>.from(json["stations"]!.map((x) => StationElement.fromJson(x))),
        pompes: json["pompes"] == null ? [] : List<PompeElement>.from(json["pompes"]!.map((x) => PompeElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "nom": nom,
        "prenom": prenom,
        "email": email,
        "matricule": matricule,
        "profile": profile?.toJson(),
        "stations": stations == null ? [] : List<dynamic>.from(stations!.map((x) => x.toJson())),
        "pompes": pompes == null ? [] : List<dynamic>.from(pompes!.map((x) => x.toJson())),
    };
}

class PompeElement {
    PompePompe? pompe;
    String? dateDebut;

    PompeElement({
        this.pompe,
        this.dateDebut,
    });

    factory PompeElement.fromJson(Map<String, dynamic> json) => PompeElement(
        pompe: json["pompe"] == null ? null : PompePompe.fromJson(json["pompe"]),
        dateDebut: json["date_debut"],
    );

    Map<String, dynamic> toJson() => {
        "pompe": pompe?.toJson(),
        "date_debut": dateDebut,
    };
}

class PompePompe {
    int? idPompe;
    String? nomPompe;

    PompePompe({
        this.idPompe,
        this.nomPompe,
    });

    factory PompePompe.fromJson(Map<String, dynamic> json) => PompePompe(
        idPompe: json["id_pompe"],
        nomPompe: json["nom_pompe"],
    );

    Map<String, dynamic> toJson() => {
        "id_pompe": idPompe,
        "nom_pompe": nomPompe,
    };
}

class Profile {
    int? idProfile;
    String? nom;
    String? description;

    Profile({
        this.idProfile,
        this.nom,
        this.description,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        idProfile: json["id_profile"],
        nom: json["nom"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id_profile": idProfile,
        "nom": nom,
        "description": description,
    };
}

class StationElement {
    StationStation? station;
    String? dateDebut;

    StationElement({
        this.station,
        this.dateDebut,
    });

    factory StationElement.fromJson(Map<String, dynamic> json) => StationElement(
        station: json["station"] == null ? null : StationStation.fromJson(json["station"]),
        dateDebut: json["date_debut"],
    );

    Map<String, dynamic> toJson() => {
        "station": station?.toJson(),
        "date_debut": dateDebut,
    };
}

class StationStation {
    int? id;
    String? nomStation;
    String? adresse;

    StationStation({
        this.id,
        this.nomStation,
        this.adresse,
    });

    factory StationStation.fromJson(Map<String, dynamic> json) => StationStation(
        id: json["id"],
        nomStation: json["nom_station"],
        adresse: json["adresse"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom_station": nomStation,
        "adresse": adresse,
    };
}
