import 'dart:convert';

enum ProcessStepType { inscription, affichage, campagne, vote, depouillement }

class ElectoralProcess {
  final String id;
  final String title;
  final String description;
  final ProcessStepType type;
  final String iconName;

  ElectoralProcess({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.iconName,
  });

  // Getters utilitaires
  String get typeDisplayName {
    switch (type) {
      case ProcessStepType.inscription:
        return 'Inscription';
      case ProcessStepType.affichage:
        return 'Affichage';
      case ProcessStepType.campagne:
        return 'Campagne';
      case ProcessStepType.vote:
        return 'Vote';
      case ProcessStepType.depouillement:
        return 'Dépouillement';
    }
  }

  // Méthodes de sérialisation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type.name,
      'iconName': iconName,
    };
  }

  factory ElectoralProcess.fromMap(Map<String, dynamic> map) {
    return ElectoralProcess(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      type: ProcessStepType.values.firstWhere((e) => e.name == map['type']),
      iconName: map['iconName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ElectoralProcess.fromJson(String source) => ElectoralProcess.fromMap(json.decode(source));

  // Méthode copyWith pour immutabilité
  ElectoralProcess copyWith({
    String? id,
    String? title,
    String? description,
    ProcessStepType? type,
    String? iconName,
  }) {
    return ElectoralProcess(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      iconName: iconName ?? this.iconName,
    );
  }

  // Données d'exemple correspondant à la maquette
  static List<ElectoralProcess> getSampleProcessSteps() {
    return [
      ElectoralProcess(
        id: '1',
        title: 'Inscription sur la liste électorale',
        description: 'Conditions d\'inscription et documents nécessaires pour s\'inscrire sur la liste électorale',
        type: ProcessStepType.inscription,
        iconName: 'edit',
      ),
      ElectoralProcess(
        id: '2',
        title: 'Affichage des listes électorales',
        description: 'Vérification de votre inscription et procédure de réclamation',
        type: ProcessStepType.affichage,
        iconName: 'search',
      ),
      ElectoralProcess(
        id: '3',
        title: 'Campagne électorale',
        description: 'Période officielle, règles et modalités de la campagne',
        type: ProcessStepType.campagne,
        iconName: 'campaign',
      ),
      ElectoralProcess(
        id: '4',
        title: 'Jour du vote',
        description: 'Instructions et documents requis pour voter',
        type: ProcessStepType.vote,
        iconName: 'vote',
      ),
      ElectoralProcess(
        id: '5',
        title: 'Dépouillement et résultats',
        description: 'Processus de comptage et annonce des résultats',
        type: ProcessStepType.depouillement,
        iconName: 'results',
      ),
    ];
  }

  @override
  String toString() {
    return 'ElectoralProcess(id: $id, title: $title, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ElectoralProcess && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
