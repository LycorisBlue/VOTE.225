import 'dart:convert';

enum ThemeType { education, sante, economie, securite, environnement, emploi, logement, transport }

class ProjectTheme {
  final String id;
  final ThemeType type;
  final String title;
  final String description;
  final String iconName;

  ProjectTheme({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.iconName,
  });

  String get displayName {
    switch (type) {
      case ThemeType.education:
        return 'Éducation';
      case ThemeType.sante:
        return 'Santé';
      case ThemeType.economie:
        return 'Économie';
      case ThemeType.securite:
        return 'Sécurité';
      case ThemeType.environnement:
        return 'Environnement';
      case ThemeType.emploi:
        return 'Emploi';
      case ThemeType.logement:
        return 'Logement';
      case ThemeType.transport:
        return 'Transport';
    }
  }

  factory ProjectTheme.fromMap(Map<String, dynamic> map) {
    return ProjectTheme(
      id: map['id'] ?? '',
      type: ThemeType.values.firstWhere((e) => e.name == map['type']),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      iconName: map['iconName'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.name,
      'title': title,
      'description': description,
      'iconName': iconName,
    };
  }
}

class CandidateProject {
  final String candidateId;
  final String candidateName;
  final String party;
  final String? imageUrl;
  final String globalDescription;
  final List<ProjectPosition> positions;

  CandidateProject({
    required this.candidateId,
    required this.candidateName,
    required this.party,
    this.imageUrl,
    required this.globalDescription,
    required this.positions,
  });

  bool hasPositionForTheme(ThemeType theme) {
    return positions.any((pos) => pos.theme == theme);
  }

  ProjectPosition? getPositionForTheme(ThemeType theme) {
    try {
      return positions.firstWhere((pos) => pos.theme == theme);
    } catch (e) {
      return null;
    }
  }

  factory CandidateProject.fromMap(Map<String, dynamic> map) {
    return CandidateProject(
      candidateId: map['candidateId'] ?? '',
      candidateName: map['candidateName'] ?? '',
      party: map['party'] ?? '',
      imageUrl: map['imageUrl'],
      globalDescription: map['globalDescription'] ?? '',
      positions: List<ProjectPosition>.from(
        map['positions']?.map((x) => ProjectPosition.fromMap(x)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'candidateId': candidateId,
      'candidateName': candidateName,
      'party': party,
      'imageUrl': imageUrl,
      'globalDescription': globalDescription,
      'positions': positions.map((x) => x.toMap()).toList(),
    };
  }

  static List<CandidateProject> getSampleProjects() {
    return [
      CandidateProject(
        candidateId: '1',
        candidateName: 'Awa Koné',
        party: 'UPI',
        globalDescription: 'Réformes économiques et modernisation de l\'État',
        positions: [
          ProjectPosition(
            theme: ThemeType.education,
            content:
                'L\'éducation est le pilier fondamental du développement d\'un pays. Elle façonne les citoyens de demain, soutient l\'économie et renforce la cohésion sociale...',
          ),
          ProjectPosition(
            theme: ThemeType.sante,
            content:
                'Amélioration du système de santé publique avec construction de nouveaux hôpitaux et formation du personnel médical.',
          ),
          ProjectPosition(
            theme: ThemeType.economie,
            content: 'Diversification économique et promotion de l\'entrepreneuriat local pour créer des emplois durables.',
          ),
          ProjectPosition(
            theme: ThemeType.securite,
            content: 'Renforcement des forces de sécurité et amélioration de la sécurité urbaine.',
          ),
          ProjectPosition(
            theme: ThemeType.environnement,
            content: 'Protection de l\'environnement et promotion des énergies renouvelables.',
          ),
          ProjectPosition(
            theme: ThemeType.emploi,
            content: 'Création d\'emplois dans les secteurs porteurs et formation professionnelle adaptée.',
          ),
        ],
      ),
      CandidateProject(
        candidateId: '2',
        candidateName: 'Mamadou Diabaté',
        party: 'RDN',
        globalDescription: 'Redynamiser l\'économie et renforcer la protection sociale',
        positions: [
          ProjectPosition(
            theme: ThemeType.education,
            content:
                'À l\'heure du numérique, des mutations économiques et des enjeux environnementaux, l\'école ne peut plus rester figée dans un modèle hérité du siècle passé...',
          ),
          ProjectPosition(
            theme: ThemeType.economie,
            content: 'Modernisation de l\'économie ivoirienne par la transformation digitale et l\'innovation.',
          ),
          ProjectPosition(
            theme: ThemeType.securite,
            content: 'Modernisation des équipements de sécurité et formation continue des agents.',
          ),
          ProjectPosition(
            theme: ThemeType.environnement,
            content: 'Politique environnementale ambitieuse avec reforestation massive.',
          ),
          ProjectPosition(
            theme: ThemeType.transport,
            content: 'Amélioration des infrastructures de transport et développement des transports en commun.',
          ),
        ],
      ),
      CandidateProject(
        candidateId: '3',
        candidateName: 'Estelle N\'Guessan',
        party: 'PECI',
        globalDescription: 'Priorité à l\'éducation et à l\'innovation',
        positions: [
          ProjectPosition(
            theme: ThemeType.education,
            content: 'Réforme complète du système éducatif avec intégration du numérique et formation des enseignants.',
          ),
          ProjectPosition(
            theme: ThemeType.sante,
            content: 'Modernisation des infrastructures de santé et amélioration de l\'accès aux soins.',
          ),
          ProjectPosition(
            theme: ThemeType.emploi,
            content: 'Programme d\'insertion professionnelle pour les jeunes et développement de l\'économie numérique.',
          ),
          ProjectPosition(
            theme: ThemeType.logement,
            content: 'Construction de logements sociaux et amélioration de l\'habitat urbain.',
          ),
        ],
      ),
      CandidateProject(
        candidateId: '4',
        candidateName: 'Blaise Kouadio',
        party: 'FPI',
        globalDescription: 'Innovation technologique et transition énergétique au cœur du projet',
        positions: [
          ProjectPosition(
            theme: ThemeType.environnement,
            content: 'Transition énergétique vers les énergies renouvelables et protection de la biodiversité.',
          ),
          ProjectPosition(
            theme: ThemeType.economie,
            content: 'Développement de l\'économie verte et promotion des technologies propres.',
          ),
          ProjectPosition(
            theme: ThemeType.transport,
            content: 'Développement des transports écologiques et amélioration de la mobilité urbaine.',
          ),
          ProjectPosition(
            theme: ThemeType.securite,
            content: 'Sécurité renforcée avec des technologies modernes de surveillance.',
          ),
          ProjectPosition(
            theme: ThemeType.logement,
            content: 'Construction d\'éco-quartiers et promotion de l\'habitat durable.',
          ),
        ],
      ),
      CandidateProject(
        candidateId: '5',
        candidateName: 'Jean-Paul Yao',
        party: 'MCR',
        globalDescription: 'Pour une Côte d\'Ivoire souveraine et solidaire dans l\'Afrique',
        positions: [
          ProjectPosition(
            theme: ThemeType.economie,
            content: 'Souveraineté économique et développement des filières agricoles locales.',
          ),
          ProjectPosition(
            theme: ThemeType.education,
            content: 'Valorisation des langues locales dans l\'enseignement et préservation du patrimoine culturel.',
          ),
          ProjectPosition(
            theme: ThemeType.sante,
            content: 'Développement de la médecine traditionnelle en complément de la médecine moderne.',
          ),
          ProjectPosition(
            theme: ThemeType.emploi,
            content: 'Promotion de l\'artisanat local et développement des coopératives agricoles.',
          ),
        ],
      ),
    ];
  }
}

class ProjectPosition {
  final ThemeType theme;
  final String content;

  ProjectPosition({
    required this.theme,
    required this.content,
  });

  factory ProjectPosition.fromMap(Map<String, dynamic> map) {
    return ProjectPosition(
      theme: ThemeType.values.firstWhere((e) => e.name == map['theme']),
      content: map['content'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'theme': theme.name,
      'content': content,
    };
  }
}

class ProjectComparison {
  final List<CandidateProject> candidates;
  final List<ThemeType> selectedThemes;

  ProjectComparison({
    required this.candidates,
    required this.selectedThemes,
  });

  List<ThemeType> getCommonThemes() {
    if (candidates.length < 2) return [];

    final firstCandidateThemes = candidates.first.positions.map((p) => p.theme).toSet();
    final commonThemes = <ThemeType>{};

    for (final theme in firstCandidateThemes) {
      if (candidates.every((candidate) => candidate.hasPositionForTheme(theme))) {
        commonThemes.add(theme);
      }
    }

    return commonThemes.where((theme) => selectedThemes.contains(theme)).toList();
  }
}
