// lib/data/models/disinformation_report.dart

import 'dart:convert';

enum ReportStatus { enAttente, verifie, faux }

class DisinformationReport {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final ReportStatus status;

  DisinformationReport({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });

  // Getters utilitaires
  String get formattedDate {
    final months = ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin', 'Juil', 'Août', 'Sep', 'Oct', 'Nov', 'Déc'];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String get statusDisplayName {
    switch (status) {
      case ReportStatus.enAttente:
        return 'En attente';
      case ReportStatus.verifie:
        return 'Vérifié - vrai';
      case ReportStatus.faux:
        return 'Vérifié - faux';
    }
  }

  String get statusIcon {
    switch (status) {
      case ReportStatus.enAttente:
        return '⏳';
      case ReportStatus.verifie:
        return '✅';
      case ReportStatus.faux:
        return '❌';
    }
  }

  // Méthodes de sérialisation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'status': status.name,
    };
  }

  factory DisinformationReport.fromMap(Map<String, dynamic> map) {
    return DisinformationReport(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: DateTime.parse(map['date']),
      status: ReportStatus.values.firstWhere((e) => e.name == map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DisinformationReport.fromJson(String source) => DisinformationReport.fromMap(json.decode(source));

  // Données d'exemple pour la maquette
  static List<DisinformationReport> getSampleReports() {
    return [
      DisinformationReport(
        id: '1',
        title: 'Information concernant les résultats électoraux dans la région de Bouaké',
        description: 'Fausse information sur les résultats électoraux...',
        date: DateTime(2024, 1, 12),
        status: ReportStatus.enAttente,
      ),
      DisinformationReport(
        id: '2',
        title: 'Déclaration sur la politique sanitaire nationale',
        description: 'Déclaration véridique confirmée...',
        date: DateTime(2024, 1, 11),
        status: ReportStatus.verifie,
      ),
      DisinformationReport(
        id: '3',
        title: 'Rumeur sur les investissements étrangers',
        description: 'Rumeur non fondée sur les investissements...',
        date: DateTime(2024, 1, 10),
        status: ReportStatus.faux,
      ),
      DisinformationReport(
        id: '4',
        title: 'Déclaration sur la politique sanitaire nationale',
        description: 'Autre déclaration véridique...',
        date: DateTime(2024, 1, 11),
        status: ReportStatus.verifie,
      ),
      DisinformationReport(
        id: '5',
        title: 'Information concernant les résultats électoraux dans la région de Bouaké',
        description: 'Autre information en attente de vérification...',
        date: DateTime(2024, 1, 12),
        status: ReportStatus.enAttente,
      ),
    ];
  }

  @override
  String toString() {
    return 'DisinformationReport(id: $id, title: $title, status: $status, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DisinformationReport && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
