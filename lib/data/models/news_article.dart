import '/constants/assets_path.dart';

class NewsArticle {
  final String id;
  final String title;
  final String source;
  final String timeAgo;
  final String imagePath;
  final String? description;

  NewsArticle({
    required this.id,
    required this.title,
    required this.source,
    required this.timeAgo,
    required this.imagePath,
    this.description,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      source: json['source'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
      imagePath: json['imagePath'] ?? '',
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'source': source,
      'timeAgo': timeAgo,
      'imagePath': imagePath,
      'description': description,
    };
  }

  // Données d'exemple pour la maquette
  static List<NewsArticle> getSampleArticles() {
    return [
      NewsArticle(
        id: '1',
        title: 'Ouverture des inscriptions sur les listes électorales',
        source: 'Ministère de l\'Intérieur',
        timeAgo: 'Il y a 3 heures',
        imagePath: AppImage.inscriptionElectorale,
      ),
      NewsArticle(
        id: '2',
        title: 'Débat présidentiel : les grandes thématiques',
        source: 'RTI 2',
        timeAgo: 'Il y a 5 heures',
        imagePath: AppImage.debatPresidentiel,
      ),
      NewsArticle(
        id: '3',
        title: 'Comment vérifier votre bureau de vote ?',
        source: '225 vote',
        timeAgo: 'Il y a 1 jour',
        imagePath: AppImage.verificationVote,
      ),
    ];
  }
}
