import 'dart:convert';

import 'package:flutter/material.dart';

enum SettingsItemType { navigation, toggle, selection }

enum LanguageOption { francais, english }

enum TextSizeOption { petit, moyen, grand }

enum ContrastOption { normal, eleve }

class SettingsOption {
  final String id;
  final String title;
  final String? subtitle;
  final String? value;
  final SettingsItemType type;
  final String? iconPath;
  final bool hasIcon;
  final bool isEnabled;
  final VoidCallback? onTap;
  final Function(bool)? onToggle;
  final List<String>? possibleValues;

  SettingsOption({
    required this.id,
    required this.title,
    this.subtitle,
    this.value,
    required this.type,
    this.iconPath,
    this.hasIcon = false,
    this.isEnabled = true,
    this.onTap,
    this.onToggle,
    this.possibleValues,
  });

  // Méthodes de sérialisation
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'value': value,
      'type': type.name,
      'iconPath': iconPath,
      'hasIcon': hasIcon,
      'isEnabled': isEnabled,
      'possibleValues': possibleValues,
    };
  }

  factory SettingsOption.fromMap(Map<String, dynamic> map) {
    return SettingsOption(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'],
      value: map['value'],
      type: SettingsItemType.values.firstWhere((e) => e.name == map['type']),
      iconPath: map['iconPath'],
      hasIcon: map['hasIcon'] ?? false,
      isEnabled: map['isEnabled'] ?? true,
      possibleValues: map['possibleValues'] != null ? List<String>.from(map['possibleValues']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsOption.fromJson(String source) => SettingsOption.fromMap(json.decode(source));

  // Méthode copyWith pour immutabilité
  SettingsOption copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? value,
    SettingsItemType? type,
    String? iconPath,
    bool? hasIcon,
    bool? isEnabled,
    VoidCallback? onTap,
    Function(bool)? onToggle,
    List<String>? possibleValues,
  }) {
    return SettingsOption(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      value: value ?? this.value,
      type: type ?? this.type,
      iconPath: iconPath ?? this.iconPath,
      hasIcon: hasIcon ?? this.hasIcon,
      isEnabled: isEnabled ?? this.isEnabled,
      onTap: onTap ?? this.onTap,
      onToggle: onToggle ?? this.onToggle,
      possibleValues: possibleValues ?? this.possibleValues,
    );
  }

  @override
  String toString() {
    return 'SettingsOption(id: $id, title: $title, type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SettingsOption && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

// Classe pour les sections de paramètres
class SettingsSection {
  final String id;
  final String? title;
  final List<SettingsOption> options;

  SettingsSection({
    required this.id,
    this.title,
    required this.options,
  });

  factory SettingsSection.fromMap(Map<String, dynamic> map) {
    return SettingsSection(
      id: map['id'] ?? '',
      title: map['title'],
      options: List<SettingsOption>.from(
        map['options']?.map((x) => SettingsOption.fromMap(x)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }
}
