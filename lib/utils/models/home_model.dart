// To parse this JSON data, do
//
//     final homedata = homedataFromJson(jsonString);

import 'dart:convert';

Homedata homedataFromJson(String str) => Homedata.fromJson(json.decode(str));

String homedataToJson(Homedata data) => json.encode(data.toJson());

class Homedata {
    List<Carburant>? carburant;
    double? chiffreToday;
    List<CiterneJaugage>? citerneJaugage;

    Homedata({
        this.carburant,
        this.chiffreToday,
        this.citerneJaugage,
    });

    factory Homedata.fromJson(Map<String, dynamic> json) => Homedata(
        carburant: json["carburant"] == null ? [] : List<Carburant>.from(json["carburant"]!.map((x) => Carburant.fromJson(x))),
        chiffreToday: json["chiffreToday"]?.toDouble(),
        citerneJaugage: json["citerneJaugage"] == null ? [] : List<CiterneJaugage>.from(json["citerneJaugage"]!.map((x) => CiterneJaugage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "carburant": carburant == null ? [] : List<dynamic>.from(carburant!.map((x) => x.toJson())),
        "chiffreToday": chiffreToday,
        "citerneJaugage": citerneJaugage == null ? [] : List<dynamic>.from(citerneJaugage!.map((x) => x.toJson())),
    };
}

class Carburant {
    String? nomCarburant;
    double? prixCarburant;
    String? percentChange;
    bool? increase;

    Carburant({
        this.nomCarburant,
        this.prixCarburant,
        this.percentChange,
        this.increase,
    });

    factory Carburant.fromJson(Map<String, dynamic> json) => Carburant(
        nomCarburant: json["nomCarburant"],
        prixCarburant: json["prixCarburant"]?.toDouble(),
        percentChange: json["percentChange"],
        increase: json["increase"],
    );

    Map<String, dynamic> toJson() => {
        "nomCarburant": nomCarburant,
        "prixCarburant": prixCarburant,
        "percentChange": percentChange,
        "increase": increase,
    };
}

class CiterneJaugage {
    String? nomCiterne;
    double? jaugage;
    String? percentageLevel;
    String? nomProduit;

    CiterneJaugage({
        this.nomCiterne,
        this.jaugage,
        this.percentageLevel,
        this.nomProduit,
    });

    factory CiterneJaugage.fromJson(Map<String, dynamic> json) => CiterneJaugage(
        nomCiterne: json["nomCiterne"],
        jaugage: json["jaugage"]?.toDouble(),
        percentageLevel: json["percentageLevel"],
        nomProduit: json["nomProduit"],
    );

    Map<String, dynamic> toJson() => {
        "nomCiterne": nomCiterne,
        "jaugage": jaugage,
        "percentageLevel": percentageLevel,
        "nomProduit": nomProduit,
    };
}
