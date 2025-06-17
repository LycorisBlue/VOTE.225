// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

Events eventsFromJson(String str) => Events.fromJson(json.decode(str));

String eventsToJson(Events data) => json.encode(data.toJson());

class Events {
  List<Article> articles;

  Events({
    required this.articles,
  });

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        articles:
            List<Article>.from(json["nodes"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  String documentId;
  String titre;
  String? description;
  DateTime? dateDebut;
  DateTime? dateFin;
  CategorieEvenement? categorieEvenement;
  List<dynamic> images;
  List<dynamic> videos;
  Election election;

  Article({
    required this.documentId,
    required this.titre,
    this.description,
    this.dateDebut,
    this.dateFin,
    this.categorieEvenement,
    required this.images,
    required this.videos,
    required this.election,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        documentId: json["documentId"],
        titre: json["titre"],
        description: json["description"],
        dateDebut: json["date_debut"] != null
            ? DateTime.parse(json["date_debut"])
            : null,
        dateFin:
            json["date_fin"] != null ? DateTime.parse(json["date_fin"]) : null,
        categorieEvenement: json["categorie_evenement"] != null
            ? CategorieEvenement.fromJson(json["categorie_evenement"])
            : null,
        images: List<dynamic>.from(json["images"].map((x) => x)),
        videos: List<dynamic>.from(json["videos"].map((x) => x)),
        election: Election.fromJson(json["election"]),
      );

  Map<String, dynamic> toJson() => {
        "documentId": documentId,
        "titre": titre,
        "description": description,
        "date_debut":
            "${dateDebut!.year.toString().padLeft(4, '0')}-${dateDebut!.month.toString().padLeft(2, '0')}-${dateDebut!.day.toString().padLeft(2, '0')}",
        "date_fin":
            "${dateFin!.year.toString().padLeft(4, '0')}-${dateFin!.month.toString().padLeft(2, '0')}-${dateFin!.day.toString().padLeft(2, '0')}",
        "categorie_evenement": categorieEvenement?.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "videos": List<dynamic>.from(videos.map((x) => x)),
        "election": election.toJson(),
      };
}

class CategorieEvenement {
  String titre;

  CategorieEvenement({
    required this.titre,
  });

  factory CategorieEvenement.fromJson(Map<String, dynamic> json) =>
      CategorieEvenement(
        titre: json["titre"],
      );

  Map<String, dynamic> toJson() => {
        "titre": titre,
      };
}

class Election {
  String titre;
  int year;

  Election({
    required this.titre,
    required this.year,
  });

  factory Election.fromJson(Map<String, dynamic> json) => Election(
        titre: json["titre"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "titre": titre,
        "year": year,
      };
}

