// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);

import 'dart:convert';

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
        services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
        users: json["users"] == null ? [] : List<UserElement>.from(json["users"]!.map((x) => UserElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom_station": nomStation,
        "adresse": adresse,
        "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
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
    UserUser? user;
    String? dateDebut;

    UserElement({
        this.user,
        this.dateDebut,
    });

    factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        user: json["user"] == null ? null : UserUser.fromJson(json["user"]),
        dateDebut: json["date_debut"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "date_debut": dateDebut,
    };
}

class UserUser {
    int? idUser;
    String? nom;
    String? prenom;
    String? email;
    String? matricule;
    Profile? profile;

    UserUser({
        this.idUser,
        this.nom,
        this.prenom,
        this.email,
        this.matricule,
        this.profile,
    });

    factory UserUser.fromJson(Map<String, dynamic> json) => UserUser(
        idUser: json["id_user"],
        nom: json["nom"],
        prenom: json["prenom"],
        email: json["email"],
        matricule: json["matricule"],
        profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "nom": nom,
        "prenom": prenom,
        "email": email,
        "matricule": matricule,
        "profile": profile?.toJson(),
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
