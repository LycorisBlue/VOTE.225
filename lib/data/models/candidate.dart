// To parse this JSON data, do
//
//     final candidates = candidatesFromJson(jsonString);

import 'dart:convert';

Candidates candidatesFromJson(String str) =>
    Candidates.fromJson(json.decode(str));

String candidatesToJson(Candidates data) => json.encode(data.toJson());

class Candidates {
  List<Candidate> candidates;

  Candidates({
    required this.candidates,
  });

  factory Candidates.fromJson(Map<String, dynamic> json) => Candidates(
        candidates: List<Candidate>.from(
            json["nodes"].map((x) => Candidate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(candidates.map((x) => x.toJson())),
      };
}

class Candidate {
  String documentId;
  String displayName;
  int age;
  String? city;
  String workTitle;
  String workExperience;
  DateTime createdAt;
  DateTime updatedAt;
  Election election;
  List<PlanKeyPoint> planKeyPoints;
  PoliticalParties politicalParties;
  List<PoliticalVision> politicalVisions;
  dynamic cover;

  Candidate({
    required this.documentId,
    required this.displayName,
    required this.age,
     this.city,
    required this.workTitle,
    required this.workExperience,
    required this.createdAt,
    required this.updatedAt,
    required this.election,
    required this.planKeyPoints,
    required this.politicalParties,
    required this.politicalVisions,
    required this.cover,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        documentId: json["documentId"],
        displayName: json["display_name"],
        age: json["age"],
        city: json["city"],
        workTitle: json["work_title"],
        workExperience: json["work_experience"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        election: Election.fromJson(json["election"]),
        planKeyPoints: List<PlanKeyPoint>.from(
            json["plan_key_points"].map((x) => PlanKeyPoint.fromJson(x))),
        politicalParties: PoliticalParties.fromJson(json["political_parties"]),
        politicalVisions: List<PoliticalVision>.from(
            json["political_visions"].map((x) => PoliticalVision.fromJson(x))),
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "documentId": documentId,
        "display_name": displayName,
        "age": age,
        "city": city,
        "work_title": workTitle,
        "work_experience": workExperience,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "election": election.toJson(),
        "plan_key_points":
            List<dynamic>.from(planKeyPoints.map((x) => x.toJson())),
        "political_parties": politicalParties.toJson(),
        "political_visions":
            List<dynamic>.from(politicalVisions.map((x) => x.toJson())),
        "cover": cover,
      };
}

class Election {
  int year;

  Election({
    required this.year,
  });

  factory Election.fromJson(Map<String, dynamic> json) => Election(
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
      };
}

class PlanKeyPoint {
  String value;

  PlanKeyPoint({
    required this.value,
  });

  factory PlanKeyPoint.fromJson(Map<String, dynamic> json) => PlanKeyPoint(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class PoliticalParties {
  String name;

  PoliticalParties({
    required this.name,
  });

  factory PoliticalParties.fromJson(Map<String, dynamic> json) =>
      PoliticalParties(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class PoliticalVision {
  String title;

  PoliticalVision({
    required this.title,
  });

  factory PoliticalVision.fromJson(Map<String, dynamic> json) =>
      PoliticalVision(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}
