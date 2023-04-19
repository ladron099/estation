class Profile {
  int? idProfile;
  String? nom;
  String? description;

  Profile({this.idProfile, this.nom, this.description});

  Profile.fromJson(Map<String, dynamic> json) {
    idProfile = json['id_profile'];
    nom = json['nom'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_profile'] = this.idProfile;
    data['nom'] = this.nom;
    data['description'] = this.description;
    return data;
  }
}