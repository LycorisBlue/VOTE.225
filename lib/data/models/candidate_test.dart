import 'dart:convert';
import '/constants/assets_path.dart';

class Candidate {
  final String id;
  final String firstName;
  final String lastName;
  final String party;
  final String imagePath;
  final String? description;
  final bool isFavorite;

  // Nouvelles propriétés pour le détail
  final int age;
  final String status; // député, ministre, etc.
  final String city;
  final String district;
  final int experienceYears;
  final String currentFunction;
  final List<String> politicalVision;
  final List<ProgramPoint> programPoints;

  Candidate({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.party,
    required this.imagePath,
    this.description,
    this.isFavorite = false,
    required this.age,
    required this.status,
    required this.city,
    required this.district,
    required this.experienceYears,
    required this.currentFunction,
    required this.politicalVision,
    required this.programPoints,
  });

  // Nom complet du candidat
  String get fullName => '$firstName $lastName';

  // Localisation complète
  String get fullLocation => '$city, $district';

  // Expérience formatée
  String get formattedExperience => '$experienceYears ans d\'expérience';

  // Méthodes de sérialisation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'party': party,
      'imagePath': imagePath,
      'description': description,
      'isFavorite': isFavorite,
      'age': age,
      'status': status,
      'city': city,
      'district': district,
      'experienceYears': experienceYears,
      'currentFunction': currentFunction,
      'politicalVision': politicalVision,
      'programPoints': programPoints.map((x) => x.toMap()).toList(),
    };
  }

  factory Candidate.fromMap(Map<String, dynamic> map) {
    return Candidate(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      party: map['party'] ?? '',
      imagePath: map['imagePath'] ?? '',
      description: map['description'],
      isFavorite: map['isFavorite'] ?? false,
      age: map['age']?.toInt() ?? 0,
      status: map['status'] ?? '',
      city: map['city'] ?? '',
      district: map['district'] ?? '',
      experienceYears: map['experienceYears']?.toInt() ?? 0,
      currentFunction: map['currentFunction'] ?? '',
      politicalVision: List<String>.from(map['politicalVision'] ?? []),
      programPoints: List<ProgramPoint>.from(
        map['programPoints']?.map((x) => ProgramPoint.fromMap(x)) ?? [],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Candidate.fromJson(String source) => Candidate.fromMap(json.decode(source));

  // Méthode copyWith pour immutabilité
  Candidate copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? party,
    String? imagePath,
    String? description,
    bool? isFavorite,
    int? age,
    String? status,
    String? city,
    String? district,
    int? experienceYears,
    String? currentFunction,
    List<String>? politicalVision,
    List<ProgramPoint>? programPoints,
  }) {
    return Candidate(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      party: party ?? this.party,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      age: age ?? this.age,
      status: status ?? this.status,
      city: city ?? this.city,
      district: district ?? this.district,
      experienceYears: experienceYears ?? this.experienceYears,
      currentFunction: currentFunction ?? this.currentFunction,
      politicalVision: politicalVision ?? this.politicalVision,
      programPoints: programPoints ?? this.programPoints,
    );
  }

  // Données d'exemple pour la maquette
  static List<Candidate> getSampleCandidates() {
    return [
      Candidate(
        id: '1',
        firstName: 'Estelle',
        lastName: 'N\'Guessan',
        party: 'PECI',
        imagePath: AppImage.profil,
        description: 'Candidate expérimentée en politique économique',
        age: 45,
        status: 'députée',
        city: 'Abidjan',
        district: 'Cocody',
        experienceYears: 12,
        currentFunction: 'Députée',
        politicalVision: ['Développement durable', 'Égalité des genres'],
        programPoints: [
          ProgramPoint(number: 1, title: 'Réformes économiques et développement'),
          ProgramPoint(number: 2, title: 'Éducation et formation professionnelle'),
        ],
      ),
      Candidate(
        id: '2',
        firstName: 'Blaise',
        lastName: 'Kouadio',
        party: 'FPI',
        imagePath: AppImage.profil,
        description: 'Ancien ministre et défenseur des droits humains',
        age: 53,
        status: 'député',
        city: 'Abidjan',
        district: 'Plateau',
        experienceYears: 15,
        currentFunction: 'Député',
        politicalVision: ['Nationalisme économique', 'souveraineté industrielle'],
        programPoints: [
          ProgramPoint(number: 1, title: 'Réformes institutionnelles et gouvernance démocratique'),
          ProgramPoint(number: 2, title: 'Réconciliation nationale et cohésion sociale'),
          ProgramPoint(number: 3, title: 'Projet de société à venir'),
        ],
      ),
      Candidate(
        id: '3',
        firstName: 'Mamadou',
        lastName: 'Diabaté',
        party: 'RDN',
        imagePath: AppImage.profil,
        description: 'Entrepreneur et leader communautaire',
        age: 48,
        status: 'entrepreneur',
        city: 'Bouaké',
        district: 'Centre',
        experienceYears: 10,
        currentFunction: 'Entrepreneur',
        politicalVision: ['Innovation technologique', 'Entrepreneuriat jeune'],
        programPoints: [
          ProgramPoint(number: 1, title: 'Développement économique rural'),
          ProgramPoint(number: 2, title: 'Innovation et technologie'),
        ],
      ),
      Candidate(
        id: '4',
        firstName: 'Jean-Paul',
        lastName: 'Yao',
        party: 'MCR',
        imagePath: AppImage.profil,
        description: 'Professeur d\'université et intellectuel',
        age: 58,
        status: 'professeur',
        city: 'Yamoussoukro',
        district: 'Lacs',
        experienceYears: 20,
        currentFunction: 'Professeur d\'Université',
        politicalVision: ['Éducation pour tous', 'Recherche scientifique'],
        programPoints: [
          ProgramPoint(number: 1, title: 'Réforme de l\'enseignement supérieur'),
          ProgramPoint(number: 2, title: 'Promotion de la recherche'),
        ],
      ),
      Candidate(
        id: '5',
        firstName: 'Awa',
        lastName: 'Koné',
        party: 'UPI',
        imagePath: AppImage.profil,
        description: 'Militante pour l\'égalité des genres',
        age: 41,
        status: 'militante',
        city: 'San-Pédro',
        district: 'Sud-Ouest',
        experienceYears: 8,
        currentFunction: 'Militante',
        politicalVision: ['Égalité des genres', 'Justice sociale'],
        programPoints: [
          ProgramPoint(number: 1, title: 'Promotion de l\'égalité femme-homme'),
          ProgramPoint(number: 2, title: 'Protection sociale renforcée'),
        ],
      ),
    ];
  }

  @override
  String toString() {
    return 'Candidate(id: $id, firstName: $firstName, lastName: $lastName, party: $party, age: $age, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Candidate && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

// Classe pour les points du programme
class ProgramPoint {
  final int number;
  final String title;
  final String? description;

  ProgramPoint({
    required this.number,
    required this.title,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'title': title,
      'description': description,
    };
  }

  factory ProgramPoint.fromMap(Map<String, dynamic> map) {
    return ProgramPoint(
      number: map['number']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgramPoint.fromJson(String source) => ProgramPoint.fromMap(json.decode(source));
}
