import 'dart:convert';

class BureauVote {
  final String id;
  final String nom;
  final String adresse;
  final double latitude;
  final double longitude;
  final String heureOuverture;
  final String heureFermeture;
  final String? telephone;
  final String? commune;
  final String? quartier;
  final bool isActif;

  BureauVote({
    required this.id,
    required this.nom,
    required this.adresse,
    required this.latitude,
    required this.longitude,
    required this.heureOuverture,
    required this.heureFermeture,
    this.telephone,
    this.commune,
    this.quartier,
    this.isActif = true,
  });

  // Getters utilitaires
  String get horaires => 'Ouvert de $heureOuverture à $heureFermeture';

  String get adresseComplete {
    String adresseFinale = adresse;
    if (commune != null) {
      adresseFinale += ', $commune';
    }
    return adresseFinale;
  }

  // Méthodes de sérialisation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'adresse': adresse,
      'latitude': latitude,
      'longitude': longitude,
      'heureOuverture': heureOuverture,
      'heureFermeture': heureFermeture,
      'telephone': telephone,
      'commune': commune,
      'quartier': quartier,
      'isActif': isActif,
    };
  }

  factory BureauVote.fromMap(Map<String, dynamic> map) {
    return BureauVote(
      id: map['id'] ?? '',
      nom: map['nom'] ?? '',
      adresse: map['adresse'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      heureOuverture: map['heureOuverture'] ?? '07:00',
      heureFermeture: map['heureFermeture'] ?? '18:00',
      telephone: map['telephone'],
      commune: map['commune'],
      quartier: map['quartier'],
      isActif: map['isActif'] ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory BureauVote.fromJson(String source) => BureauVote.fromMap(json.decode(source));

  // Méthode copyWith pour immutabilité
  BureauVote copyWith({
    String? id,
    String? nom,
    String? adresse,
    double? latitude,
    double? longitude,
    String? heureOuverture,
    String? heureFermeture,
    String? telephone,
    String? commune,
    String? quartier,
    bool? isActif,
  }) {
    return BureauVote(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      adresse: adresse ?? this.adresse,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      heureOuverture: heureOuverture ?? this.heureOuverture,
      heureFermeture: heureFermeture ?? this.heureFermeture,
      telephone: telephone ?? this.telephone,
      commune: commune ?? this.commune,
      quartier: quartier ?? this.quartier,
      isActif: isActif ?? this.isActif,
    );
  }

  // Données d'exemple pour la maquette
  static List<BureauVote> getSampleBureaux() {
    return [
      BureauVote(
        id: '1',
        nom: 'Bureau de Vote Central',
        adresse: '123 Avenue de la République',
        latitude: 5.3364,
        longitude: -4.0267,
        heureOuverture: '07:00',
        heureFermeture: '18:00',
        commune: 'Abidjan',
        quartier: 'Plateau',
        telephone: '+225 01 02 03 04 05',
      ),
      BureauVote(
        id: '2',
        nom: 'Bureau de Vote Adjamé',
        adresse: 'Rue des Écoles',
        latitude: 5.3525,
        longitude: -4.0267,
        heureOuverture: '07:00',
        heureFermeture: '18:00',
        commune: 'Abidjan',
        quartier: 'Adjamé',
      ),
      BureauVote(
        id: '3',
        nom: 'Bureau de Vote Treichville',
        adresse: 'Boulevard de Marseille',
        latitude: 5.3106,
        longitude: -4.0081,
        heureOuverture: '07:00',
        heureFermeture: '18:00',
        commune: 'Abidjan',
        quartier: 'Treichville',
      ),
      BureauVote(
        id: '4',
        nom: 'Bureau de Vote Cocody',
        adresse: 'Avenue de la Paix',
        latitude: 5.3444,
        longitude: -3.9738,
        heureOuverture: '07:00',
        heureFermeture: '18:00',
        commune: 'Abidjan',
        quartier: 'Cocody',
      ),
      BureauVote(
        id: '5',
        nom: 'Bureau de Vote Yopougon',
        adresse: 'Rue du Commerce',
        latitude: 5.3364,
        longitude: -4.0889,
        heureOuverture: '07:00',
        heureFermeture: '18:00',
        commune: 'Abidjan',
        quartier: 'Yopougon',
      ),
    ];
  }

  @override
  String toString() {
    return 'BureauVote(id: $id, nom: $nom, adresse: $adresse, commune: $commune)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BureauVote && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
