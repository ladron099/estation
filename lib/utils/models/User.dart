 

import 'dart:convert';

import 'package:estation/utils/models/Profile.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.idUser,
        this.nom,
        this.prenom,
        this.email,
        this.matricule,
        this.profile,
    });

    int? idUser;                                                                                                                                                                                                                                                                              
    String? nom;
    String? prenom;
    String? email;
    String? matricule;
    Profile? profile;

    User copyWith({
        int? idUser,
        String? nom,
        String? prenom,
        String? email,
        String? matricule,
        Profile? profile,
    }) => 
        User(
            idUser: idUser ?? this.idUser,
            nom: nom ?? this.nom,
            prenom: prenom ?? this.prenom,
            email: email ?? this.email,
            matricule: matricule ?? this.matricule,
            profile: profile ?? this.profile,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
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


