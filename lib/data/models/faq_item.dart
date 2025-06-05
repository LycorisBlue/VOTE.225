import 'dart:convert';

enum FAQCategory { inscription, vote, resultats }

class FAQItem {
  final String id;
  final String question;
  final String answer;
  final FAQCategory category;
  final List<String>? tags;
  final bool hasLink;
  final String? linkUrl;
  final String? linkText;

  FAQItem({
    required this.id,
    required this.question,
    required this.answer,
    required this.category,
    this.tags,
    this.hasLink = false,
    this.linkUrl,
    this.linkText,
  });

  // Getters utilitaires
  String get categoryDisplayName {
    switch (category) {
      case FAQCategory.inscription:
        return 'Inscription';
      case FAQCategory.vote:
        return 'Vote';
      case FAQCategory.resultats:
        return 'Résultats';
    }
  }

  String get categoryIcon {
    switch (category) {
      case FAQCategory.inscription:
        return '📝';
      case FAQCategory.vote:
        return '🗳️';
      case FAQCategory.resultats:
        return '📊';
    }
  }

  // Méthodes de sérialisation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'category': category.name,
      'tags': tags,
      'hasLink': hasLink,
      'linkUrl': linkUrl,
      'linkText': linkText,
    };
  }

  factory FAQItem.fromMap(Map<String, dynamic> map) {
    return FAQItem(
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
      category: FAQCategory.values.firstWhere((e) => e.name == map['category']),
      tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
      hasLink: map['hasLink'] ?? false,
      linkUrl: map['linkUrl'],
      linkText: map['linkText'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FAQItem.fromJson(String source) => FAQItem.fromMap(json.decode(source));

  // Méthode copyWith pour immutabilité
  FAQItem copyWith({
    String? id,
    String? question,
    String? answer,
    FAQCategory? category,
    List<String>? tags,
    bool? hasLink,
    String? linkUrl,
    String? linkText,
  }) {
    return FAQItem(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      hasLink: hasLink ?? this.hasLink,
      linkUrl: linkUrl ?? this.linkUrl,
      linkText: linkText ?? this.linkText,
    );
  }

  // Données d'exemple pour la maquette
  static List<FAQItem> getSampleFAQItems() {
    return [
      FAQItem(
        id: '1',
        question: 'Comment s\'inscrire sur la liste électorale ?',
        answer:
            'Conditions : Être ivoirien, avoir au moins 18 ans, jouir de ses droits civils et politiques.\n\nDocuments : CNI ou récépissé, certificat de nationalité, ou extrait d\'acte de naissance.\n\nLieu : Centres d\'enrôlement de la CEI partout dans le pays.\n\nPériode : Pendant les campagnes de révision de la liste électorale organisées par la CEI.\n\nVérification : En ligne sur',
        category: FAQCategory.inscription,
        hasLink: true,
        linkUrl: 'https://www.cei.ci',
        linkText: 'www.cei.ci',
        tags: ['inscription', 'documents', 'CNI', 'CEI'],
      ),
      FAQItem(
        id: '2',
        question: 'Quels documents sont nécessaires pour voter ?',
        answer:
            'Pour voter, vous devez présenter obligatoirement votre carte d\'électeur en cours de validité. Cette carte doit être accompagnée d\'une pièce d\'identité officielle (CNI, passeport, ou récépissé de demande de CNI).\n\nSans ces documents, l\'accès au bureau de vote vous sera refusé.',
        category: FAQCategory.vote,
        tags: ['vote', 'documents', 'carte électeur', 'CNI'],
      ),
      FAQItem(
        id: '3',
        question: 'Où trouver mon bureau de vote ?',
        answer:
            'Votre bureau de vote est indiqué sur votre carte d\'électeur. Vous pouvez également :\n\n• Consulter le site web de la CEI\n• Vous rendre dans les centres d\'information de la CEI\n• Appeler le numéro vert de la CEI\n• Demander dans votre mairie\n\nIl est important de vérifier cette information avant le jour du scrutin.',
        category: FAQCategory.vote,
        tags: ['bureau de vote', 'localisation', 'carte électeur'],
      ),
      FAQItem(
        id: '4',
        question: 'Comment vérifier mon inscription ?',
        answer:
            'Vous pouvez vérifier votre inscription sur la liste électorale de plusieurs façons :\n\n• En ligne sur le portail de la CEI\n• En vous rendant physiquement dans un centre CEI\n• En consultant les listes affichées dans les mairies\n• Par téléphone via le service client CEI\n\nCette vérification est gratuite et accessible 24h/24 en ligne.',
        category: FAQCategory.inscription,
        tags: ['vérification', 'inscription', 'liste électorale'],
      ),
      FAQItem(
        id: '5',
        question: 'Quand auront lieu les prochaines élections ?',
        answer:
            'Le calendrier électoral est établi par la Commission Électorale Indépendante (CEI) et publié officiellement.\n\nPour connaître les dates exactes des prochaines élections :\n• Consultez le site officiel de la CEI\n• Suivez les annonces officielles du gouvernement\n• Consultez la presse nationale\n\nLes dates sont généralement annoncées plusieurs mois à l\'avance.',
        category: FAQCategory.resultats,
        tags: ['calendrier', 'élections', 'dates', 'CEI'],
      ),
    ];
  }

  @override
  String toString() {
    return 'FAQItem(id: $id, question: $question, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FAQItem && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
