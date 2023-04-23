class Profile {
    Profile({
        this.idProfile,
        this.nom,
        this.description,
    });

    int? idProfile;
    String? nom;
    String? description;

    Profile copyWith({
        int? idProfile,
        String? nom,
        String? description,
    }) => 
        Profile(
            idProfile: idProfile ?? this.idProfile,
            nom: nom ?? this.nom,
            description: description ?? this.description,
        );

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