import 'package:flutter/material.dart';
import '/utils/helpers/app_extension.dart';

class AppColors {
  // Couleurs principales basées sur le Figma (constantes)
  static const Color primaryColor = Color(0xFF05A559); // Vert principal
  static const Color secondaryColor = Color(0xFF17C014); // Vert secondaire
  static const Color tertiaryColor = Color(0xFFAEE9AD); // Noir tertiaire
  static const Color accentColor = Color(0xFFEC8035); // Orange accent

  // Couleurs de base
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);

  // Nuances de gris du Figma
  static const Color greyColor = Color(0xFF8E98A8); // Gris moyen
  static const Color lightGreyColor = Color(0xFFF3F4F6); // Gris très clair
  static const Color darkGreyColor = Color(0xFF6B7280); // Gris foncé
  static const Color mediumGreyColor = Color(0xFF9CA3AF); // Gris moyen clair

  // Couleurs spécifiques du Figma
  static const Color greyBlue = Color(0xFFD3D7DF); // Gris bleuté

  // Couleurs d'état et utilitaires
  static const Color redColor = Color(0xFFEF4444); // Rouge pour erreurs
  static const Color redLabelColors = Color(0xFFF16063);
  static const Color warningColor = Color(0xFFF59E0B); // Jaune/orange warning

  // Couleurs dérivées (non-constantes car calculées)
  static final Color primaryLight05 = lighten(primaryColor, 0.05);
  static final Color primaryColorDark05 = darken(primaryColor, 0.05);

  // Couleurs utilisant fromHex pour compatibilité (non-constantes)
  static final Color customGrey = fromHex("#9CA3AF");
}

Color darken(Color color, double amount) {
  assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');
  int r = color.red;
  int g = color.green;
  int b = color.blue;

  double decrease = 1 - amount;

  r = (r * decrease).round().clamp(0, 255);
  g = (g * decrease).round().clamp(0, 255);
  b = (b * decrease).round().clamp(0, 255);

  return Color.fromRGBO(r, g, b, 1);
}

Color lighten(Color color, double amount) {
  assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');

  int r = color.red;
  int g = color.green;
  int b = color.blue;

  double increase = 1 + amount;

  r = (r * increase).round().clamp(0, 255);
  g = (g * increase).round().clamp(0, 255);
  b = (b * increase).round().clamp(0, 255);

  return Color.fromRGBO(r, g, b, 1);
}

Color getComplementaryColor(Color color, {int? index}) {
  HSLColor hslColor = HSLColor.fromColor(color);
  HSLColor complementary;
  if (index != null) {
    complementary = hslColor.withHue((hslColor.hue + index * 30.0) % 360.0);
  } else {
    complementary = hslColor.withHue((hslColor.hue + 180.0) % 360.0);
  }

  return complementary.toColor();
}
