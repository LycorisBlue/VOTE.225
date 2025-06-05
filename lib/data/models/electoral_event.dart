import 'dart:convert';

enum EventType { inscription, campagne, scrutin, validation }

class ElectoralEvent {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final EventType type;
  final String? timeRange;

  ElectoralEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    this.timeRange,
  });

  // Getters utilitaires
  String get formattedDate {
    final months = [
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String get typeDisplayName {
    switch (type) {
      case EventType.inscription:
        return 'Inscriptions';
      case EventType.campagne:
        return 'Campagne';
      case EventType.scrutin:
        return 'Scrutin';
      case EventType.validation:
        return 'Validation';
    }
  }

  String get typeIcon {
    switch (type) {
      case EventType.inscription:
        return '📝';
      case EventType.campagne:
        return '📢';
      case EventType.scrutin:
        return '🗳️';
      case EventType.validation:
        return '✅';
    }
  }

  // Méthodes de sérialisation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'type': type.name,
      'timeRange': timeRange,
    };
  }

  factory ElectoralEvent.fromMap(Map<String, dynamic> map) {
    return ElectoralEvent(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: DateTime.parse(map['date']),
      type: EventType.values.firstWhere((e) => e.name == map['type']),
      timeRange: map['timeRange'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ElectoralEvent.fromJson(String source) => ElectoralEvent.fromMap(json.decode(source));

  // Méthode copyWith pour immutabilité
  ElectoralEvent copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    EventType? type,
    String? timeRange,
  }) {
    return ElectoralEvent(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      type: type ?? this.type,
      timeRange: timeRange ?? this.timeRange,
    );
  }

  // Données d'exemple pour la maquette
  static List<ElectoralEvent> getSampleEvents() {
    return [
      ElectoralEvent(
        id: '1',
        title: 'Début des inscriptions',
        description: 'Ouverture des bureaux d\'inscription sur les listes électorales',
        date: DateTime(2025, 5, 5),
        type: EventType.inscription,
      ),
      ElectoralEvent(
        id: '2',
        title: 'Début de la campagne',
        description: 'Lancement officiel de la campagne électorale',
        date: DateTime(2025, 5, 15),
        type: EventType.campagne,
      ),
      ElectoralEvent(
        id: '3',
        title: 'Validation des candidatures',
        description: 'Publication de la liste officielle des candidats',
        date: DateTime(2025, 5, 20),
        type: EventType.validation,
      ),
      ElectoralEvent(
        id: '4',
        title: 'Jour du scrutin',
        description: 'Ouverture des bureaux de vote de 7h à 18h',
        date: DateTime(2025, 5, 27),
        type: EventType.scrutin,
        timeRange: '7h à 18h',
      ),
    ];
  }

  @override
  String toString() {
    return 'ElectoralEvent(id: $id, title: $title, date: $date, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ElectoralEvent && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
