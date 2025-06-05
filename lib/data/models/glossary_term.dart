import 'dart:convert';

class GlossaryTerm {
  final String id;
  final String term;
  final String definition;
  final String firstLetter;
  final List<String>? synonyms;
  final List<String>? tags;

  GlossaryTerm({
    required this.id,
    required this.term,
    required this.definition,
    required this.firstLetter,
    this.synonyms,
    this.tags,
  });

  // Getters utilitaires
  String get normalizedFirstLetter => firstLetter.toUpperCase();

  // Méthodes de sérialisation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'term': term,
      'definition': definition,
      'firstLetter': firstLetter,
      'synonyms': synonyms,
      'tags': tags,
    };
  }

  factory GlossaryTerm.fromMap(Map<String, dynamic> map) {
    return GlossaryTerm(
      id: map['id'] ?? '',
      term: map['term'] ?? '',
      definition: map['definition'] ?? '',
      firstLetter: map['firstLetter'] ?? '',
      synonyms: map['synonyms'] != null ? List<String>.from(map['synonyms']) : null,
      tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GlossaryTerm.fromJson(String source) => GlossaryTerm.fromMap(json.decode(source));

  // Méthode copyWith pour immutabilité
  GlossaryTerm copyWith({
    String? id,
    String? term,
    String? definition,
    String? firstLetter,
    List<String>? synonyms,
    List<String>? tags,
  }) {
    return GlossaryTerm(
      id: id ?? this.id,
      term: term ?? this.term,
      definition: definition ?? this.definition,
      firstLetter: firstLetter ?? this.firstLetter,
      synonyms: synonyms ?? this.synonyms,
      tags: tags ?? this.tags,
    );
  }

  // Données d'exemple pour la maquette
  static List<GlossaryTerm> getSampleGlossaryTerms() {
    return [
      // Termes commençant par A
      GlossaryTerm(
        id: '1',
        term: 'Abstention',
        definition: 'Non-participation d\'un électeur au vote lors d\'une élection.',
        firstLetter: 'A',
        tags: ['vote', 'participation'],
      ),
      GlossaryTerm(
        id: '2',
        term: 'Assesseur',
        definition: 'Membre du bureau de vote qui assiste le président dans ses fonctions.',
        firstLetter: 'A',
        tags: ['bureau de vote', 'personnel'],
      ),

      // Termes commençant par B
      GlossaryTerm(
        id: '3',
        term: 'Bureau de vote',
        definition: 'Local où se déroule le vote pendant les élections.',
        firstLetter: 'B',
        tags: ['vote', 'lieu'],
      ),
      GlossaryTerm(
        id: '4',
        term: 'Bulletin de vote',
        definition: 'Document officiel permettant d\'exprimer son choix.',
        firstLetter: 'B',
        tags: ['vote', 'document'],
      ),

      // Termes commençant par C
      GlossaryTerm(
        id: '5',
        term: 'CEI',
        definition: 'Commission Electorale Indépendante, organe chargé d\'organiser les élections.',
        firstLetter: 'C',
        tags: ['institution', 'organisation'],
      ),
      GlossaryTerm(
        id: '6',
        term: 'Circonscription',
        definition: 'Division territoriale électorale.',
        firstLetter: 'C',
        tags: ['territoire', 'division'],
      ),

      // Termes commençant par D
      GlossaryTerm(
        id: '7',
        term: 'Dépouillement',
        definition: 'Opération de comptage des votes après la fermeture du scrutin.',
        firstLetter: 'D',
        tags: ['vote', 'comptage'],
      ),

      // Termes commençant par E
      GlossaryTerm(
        id: '8',
        term: 'Électeur',
        definition: 'Citoyen inscrit sur les listes électorales et ayant le droit de voter.',
        firstLetter: 'E',
        tags: ['citoyen', 'droit de vote'],
      ),
      GlossaryTerm(
        id: '9',
        term: 'Enrôlement',
        definition: 'Processus d\'inscription sur les listes électorales.',
        firstLetter: 'E',
        tags: ['inscription', 'processus'],
      ),

      // Termes commençant par F
      GlossaryTerm(
        id: '10',
        term: 'Fraude électorale',
        definition: 'Manipulation illégale du processus électoral.',
        firstLetter: 'F',
        tags: ['illégal', 'manipulation'],
      ),

      // Termes commençant par G
      GlossaryTerm(
        id: '11',
        term: 'Géolocalisation',
        definition: 'Système permettant de localiser précisément les bureaux de vote.',
        firstLetter: 'G',
        tags: ['technologie', 'localisation'],
      ),

      // Termes commençant par I
      GlossaryTerm(
        id: '12',
        term: 'Isoloir',
        definition: 'Cabine permettant de voter en secret.',
        firstLetter: 'I',
        tags: ['vote', 'secret'],
      ),

      // Termes commençant par L
      GlossaryTerm(
        id: '13',
        term: 'Liste électorale',
        definition: 'Registre officiel des personnes habilitées à voter.',
        firstLetter: 'L',
        tags: ['registre', 'électeurs'],
      ),

      // Termes commençant par M
      GlossaryTerm(
        id: '14',
        term: 'Mandat',
        definition: 'Durée pendant laquelle un élu exerce ses fonctions.',
        firstLetter: 'M',
        tags: ['durée', 'fonction'],
      ),

      // Termes commençant par P
      GlossaryTerm(
        id: '15',
        term: 'Procuration',
        definition: 'Autorisation donnée à une autre personne de voter à sa place.',
        firstLetter: 'P',
        tags: ['autorisation', 'vote'],
      ),

      // Termes commençant par S
      GlossaryTerm(
        id: '16',
        term: 'Scrutin',
        definition: 'Opération de vote et mode d\'élection.',
        firstLetter: 'S',
        tags: ['vote', 'élection'],
      ),

      // Termes commençant par U
      GlossaryTerm(
        id: '17',
        term: 'Urne',
        definition: 'Boîte dans laquelle les électeurs déposent leur bulletin de vote.',
        firstLetter: 'U',
        tags: ['vote', 'matériel'],
      ),

      // Termes commençant par V
      GlossaryTerm(
        id: '18',
        term: 'Vote',
        definition: 'Expression du choix d\'un électeur lors d\'une élection.',
        firstLetter: 'V',
        tags: ['choix', 'expression'],
      ),
    ];
  }

  @override
  String toString() {
    return 'GlossaryTerm(id: $id, term: $term, firstLetter: $firstLetter)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GlossaryTerm && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
