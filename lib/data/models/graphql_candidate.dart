import 'dart:convert';

/// Modèle pour les données GraphQL des candidats
class GraphQLCandidate {
  final String? displayName;
  final int? age;
  final String? city;
  final String? workTitle;
  final int? workExperience;
  final String? createdAt;
  final String? updatedAt;
  final Election? election;
  final List<PlanKeyPoint>? planKeyPoints;
  final List<PoliticalParty>? politicalParties;
  final List<PoliticalVision>? politicalVisions;
  final Cover? cover;

  GraphQLCandidate({
    this.displayName,
    this.age,
    this.city,
    this.workTitle,
    this.workExperience,
    this.createdAt,
    this.updatedAt,
    this.election,
    this.planKeyPoints,
    this.politicalParties,
    this.politicalVisions,
    this.cover,
  });

  factory GraphQLCandidate.fromMap(Map<String, dynamic> map) {
    return GraphQLCandidate(
      displayName: map['display_name'],
      age: map['age']?.toInt(),
      city: map['city'],
      workTitle: map['work_title'],
      workExperience: map['work_experience']?.toInt(),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      election: map['election'] != null ? Election.fromMap(map['election']) : null,
      planKeyPoints: map['plan_key_points'] != null
          ? List<PlanKeyPoint>.from(
              map['plan_key_points']?.map((x) => PlanKeyPoint.fromMap(x)) ?? [],
            )
          : null,
      politicalParties: map['political_parties'] != null
          ? List<PoliticalParty>.from(
              map['political_parties']?.map((x) => PoliticalParty.fromMap(x)) ?? [],
            )
          : null,
      politicalVisions: map['political_visions'] != null
          ? List<PoliticalVision>.from(
              map['political_visions']?.map((x) => PoliticalVision.fromMap(x)) ?? [],
            )
          : null,
      cover: map['cover'] != null ? Cover.fromMap(map['cover']) : null,
    );
  }

  factory GraphQLCandidate.fromJson(String source) => GraphQLCandidate.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'display_name': displayName,
      'age': age,
      'city': city,
      'work_title': workTitle,
      'work_experience': workExperience,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'election': election?.toMap(),
      'plan_key_points': planKeyPoints?.map((x) => x.toMap()).toList(),
      'political_parties': politicalParties?.map((x) => x.toMap()).toList(),
      'political_visions': politicalVisions?.map((x) => x.toMap()).toList(),
      'cover': cover?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'GraphQLCandidate(displayName: $displayName, age: $age, city: $city, workTitle: $workTitle)';
  }
}

/// Modèle pour les données d'élection
class Election {
  final int? year;

  Election({this.year});

  factory Election.fromMap(Map<String, dynamic> map) {
    return Election(
      year: map['year']?.toInt(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'year': year,
    };
  }

  factory Election.fromJson(String source) => Election.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}

/// Modèle pour les points clés du programme
class PlanKeyPoint {
  final String? value;

  PlanKeyPoint({this.value});

  factory PlanKeyPoint.fromMap(Map<String, dynamic> map) {
    return PlanKeyPoint(
      value: map['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory PlanKeyPoint.fromJson(String source) => PlanKeyPoint.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}

/// Modèle pour les partis politiques
class PoliticalParty {
  final String? name;

  PoliticalParty({this.name});

  factory PoliticalParty.fromMap(Map<String, dynamic> map) {
    return PoliticalParty(
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory PoliticalParty.fromJson(String source) => PoliticalParty.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}

/// Modèle pour les visions politiques
class PoliticalVision {
  final String? title;

  PoliticalVision({this.title});

  factory PoliticalVision.fromMap(Map<String, dynamic> map) {
    return PoliticalVision(
      title: map['title'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory PoliticalVision.fromJson(String source) => PoliticalVision.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}

/// Modèle pour les images de couverture
class Cover {
  final String? url;

  Cover({this.url});

  factory Cover.fromMap(Map<String, dynamic> map) {
    return Cover(
      url: map['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory Cover.fromJson(String source) => Cover.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}

/// Modèle pour la réponse complète GraphQL
class GraphQLCandidatesResponse {
  final List<GraphQLCandidate>? nodes;

  GraphQLCandidatesResponse({this.nodes});

  factory GraphQLCandidatesResponse.fromMap(Map<String, dynamic> map) {
    return GraphQLCandidatesResponse(
      nodes: map['candidates_connection']?['nodes'] != null
          ? List<GraphQLCandidate>.from(
              map['candidates_connection']['nodes']?.map((x) => GraphQLCandidate.fromMap(x)) ?? [],
            )
          : null,
    );
  }

  factory GraphQLCandidatesResponse.fromJson(String source) => GraphQLCandidatesResponse.fromMap(json.decode(source));
}
