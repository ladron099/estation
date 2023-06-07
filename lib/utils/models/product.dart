// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    int? idProduit;
    String? nomProduit;
    double? prixAchat;
    double? prixVente;
    Service? service;
    Type? type;
    List<Action>? actions;

    Product({
        this.idProduit,
        this.nomProduit,
        this.prixAchat,
        this.prixVente,
        this.service,
        this.type,
        this.actions,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        idProduit: json["id_produit"],
        nomProduit: json["nom_produit"],
        prixAchat: json["prix_achat"]?.toDouble(),
        prixVente: json["prix_vente"]?.toDouble(),
        service: json["service"] == null ? null : Service.fromJson(json["service"]),
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
        actions: json["actions"] == null ? [] : List<Action>.from(json["actions"]!.map((x) => Action.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_produit": idProduit,
        "nom_produit": nomProduit,
        "prix_achat": prixAchat,
        "prix_vente": prixVente,
        "service": service?.toJson(),
        "type": type?.toJson(),
        "actions": actions == null ? [] : List<dynamic>.from(actions!.map((x) => x.toJson())),
    };
}

class Action {
    int? idAction;
    Produit? produit;
    DateTime? dateAction;
    String? quantite;
    String? action;

    Action({
        this.idAction,
        this.produit,
        this.dateAction,
        this.quantite,
        this.action,
    });

    factory Action.fromJson(Map<String, dynamic> json) => Action(
        idAction: json["id_action"],
        produit: json["produit"] == null ? null : Produit.fromJson(json["produit"]),
        dateAction: json["date_action"] == null ? null : DateTime.parse(json["date_action"]),
        quantite: json["quantite"],
        action: json["action"],
    );

    Map<String, dynamic> toJson() => {
        "id_action": idAction,
        "produit": produit?.toJson(),
        "date_action": dateAction?.toIso8601String(),
        "quantite": quantite,
        "action": action,
    };
}

class Produit {
    int? idProduit;
    String? nomProduit;
    double? prixAchat;
    double? prixVente;
    Type? type;

    Produit({
        this.idProduit,
        this.nomProduit,
        this.prixAchat,
        this.prixVente,
        this.type,
    });

    factory Produit.fromJson(Map<String, dynamic> json) => Produit(
        idProduit: json["id_produit"],
        nomProduit: json["nom_produit"],
        prixAchat: json["prix_achat"]?.toDouble(),
        prixVente: json["prix_vente"]?.toDouble(),
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
    );

    Map<String, dynamic> toJson() => {
        "id_produit": idProduit,
        "nom_produit": nomProduit,
        "prix_achat": prixAchat,
        "prix_vente": prixVente,
        "type": type?.toJson(),
    };
}

class Type {
    int? idType;
    String? nomType;
    String? unite;

    Type({
        this.idType,
        this.nomType,
        this.unite,
    });

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        idType: json["id_type"],
        nomType: json["nom_type"],
        unite: json["unite"],
    );

    Map<String, dynamic> toJson() => {
        "id_type": idType,
        "nom_type": nomType,
        "unite": unite,
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
