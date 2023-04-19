import 'Profile.dart';

class User {
  int? idUser;
  String? nom;
  String? prenom;
  String? email;
  String? matricule;
  Profile? profile;

  User(
      {this.idUser,
      this.nom,
      this.prenom,
      this.email,
      this.matricule,
      this.profile});

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    matricule = json['matricule'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['email'] = this.email;
    data['matricule'] = this.matricule;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

