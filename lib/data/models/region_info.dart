import 'dart:convert';

class RegionInfo {
  final String id;
  final String nom;
  final String chefLieu;
  final int bureauxDeVote;
  final int population;

  RegionInfo({
    required this.id,
    required this.nom,
    required this.chefLieu,
    required this.bureauxDeVote,
    required this.population,
  });

  // Getters utilitaires
  String get populationFormatted {
    if (population >= 1000000) {
      double millions = population / 1000000;
      return '${millions.toStringAsFixed(millions % 1 == 0 ? 0 : 1)}M';
    } else if (population >= 1000) {
      return '${(population / 1000).toStringAsFixed(0)}K';
    }
    return population.toString();
  }

  String get bureauxDeVoteFormatted {
    return bureauxDeVote.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  String get populationComplete {
    return population.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  // Méthodes de sérialisation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'chefLieu': chefLieu,
      'bureauxDeVote': bureauxDeVote,
      'population': population,
    };
  }

  factory RegionInfo.fromMap(Map<String, dynamic> map) {
    return RegionInfo(
      id: map['id'] ?? '',
      nom: map['nom'] ?? '',
      chefLieu: map['chefLieu'] ?? '',
      bureauxDeVote: map['bureauxDeVote']?.toInt() ?? 0,
      population: map['population']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegionInfo.fromJson(String source) => RegionInfo.fromMap(json.decode(source));

  // Méthode copyWith pour immutabilité
  RegionInfo copyWith({
    String? id,
    String? nom,
    String? chefLieu,
    int? bureauxDeVote,
    int? population,
  }) {
    return RegionInfo(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      chefLieu: chefLieu ?? this.chefLieu,
      bureauxDeVote: bureauxDeVote ?? this.bureauxDeVote,
      population: population ?? this.population,
    );
  }

  // Données d'exemple pour toutes les régions de Côte d'Ivoire
  static List<RegionInfo> getSampleRegionsData() {
    return [
      RegionInfo(
        id: 'gbeke',
        nom: 'Région du Gbêkê',
        chefLieu: 'Bouaké',
        bureauxDeVote: 1245,
        population: 1023450,
      ),
      RegionInfo(
        id: 'abidjan',
        nom: 'Région d\'Abidjan',
        chefLieu: 'Abidjan',
        bureauxDeVote: 2856,
        population: 4707404,
      ),
      RegionInfo(
        id: 'savanes',
        nom: 'Région des Savanes',
        chefLieu: 'Korhogo',
        bureauxDeVote: 982,
        population: 1507374,
      ),
      RegionInfo(
        id: 'denguele',
        nom: 'Région du Denguélé',
        chefLieu: 'Odienné',
        bureauxDeVote: 456,
        population: 293200,
      ),
      RegionInfo(
        id: 'lacs',
        nom: 'Région des Lacs',
        chefLieu: 'Dimbokro',
        bureauxDeVote: 687,
        population: 570817,
      ),
      RegionInfo(
        id: 'lagunes',
        nom: 'Région des Lagunes',
        chefLieu: 'Dabou',
        bureauxDeVote: 1134,
        population: 1377913,
      ),
      RegionInfo(
        id: 'montagnes',
        nom: 'Région des Montagnes',
        chefLieu: 'Man',
        bureauxDeVote: 892,
        population: 1148958,
      ),
      RegionInfo(
        id: 'bas_sassandra',
        nom: 'Région du Bas-Sassandra',
        chefLieu: 'San-Pédro',
        bureauxDeVote: 743,
        population: 799050,
      ),
      RegionInfo(
        id: 'goh_djiboua',
        nom: 'Région du Gôh-Djiboua',
        chefLieu: 'Gagnoa',
        bureauxDeVote: 865,
        population: 787035,
      ),
      RegionInfo(
        id: 'comoe',
        nom: 'Région de la Comoé',
        chefLieu: 'Abengourou',
        bureauxDeVote: 534,
        population: 538824,
      ),
      RegionInfo(
        id: 'zanzan',
        nom: 'Région du Zanzan',
        chefLieu: 'Bondoukou',
        bureauxDeVote: 398,
        population: 367432,
      ),
      RegionInfo(
        id: 'woroba',
        nom: 'Région du Woroba',
        chefLieu: 'Séguéla',
        bureauxDeVote: 423,
        population: 456789,
      ),
      RegionInfo(
        id: 'marahoue',
        nom: 'Région de la Marahoué',
        chefLieu: 'Bouaflé',
        bureauxDeVote: 612,
        population: 512340,
      ),
      RegionInfo(
        id: 'haut_sassandra',
        nom: 'Région du Haut-Sassandra',
        chefLieu: 'Daloa',
        bureauxDeVote: 789,
        population: 634567,
      ),
    ];
  }

  // Méthode pour obtenir les informations d'une région par son nom
  static RegionInfo? getRegionByName(String regionName) {
    final regions = getSampleRegionsData();

    // Mapping des noms de régions qui peuvent être retournés par la carte
    final regionMapping = {
      'Gbêkê': 'gbeke',
      'Gbeke': 'gbeke',
      'Abidjan': 'abidjan',
      'Savanes': 'savanes',
      'Denguélé': 'denguele',
      'Denguelé': 'denguele',
      'Lacs': 'lacs',
      'Lagunes': 'lagunes',
      'Montagnes': 'montagnes',
      'Bas-Sassandra': 'bas_sassandra',
      'Gôh-Djiboua': 'goh_djiboua',
      'Comoé': 'comoe',
      'Comoe': 'comoe',
      'Zanzan': 'zanzan',
      'Woroba': 'woroba',
      'Marahoué': 'marahoue',
      'Marahoue': 'marahoue',
      'Haut-Sassandra': 'haut_sassandra',
    };

    final regionId = regionMapping[regionName];
    if (regionId != null) {
      return regions.firstWhere(
        (region) => region.id == regionId,
        orElse: () => regions.first, // Retourne une région par défaut
      );
    }

    return null;
  }

  @override
  String toString() {
    return 'RegionInfo(id: $id, nom: $nom, chefLieu: $chefLieu, bureauxDeVote: $bureauxDeVote, population: $population)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RegionInfo && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
