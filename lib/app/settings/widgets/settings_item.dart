import '/constants/app_export.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? value;
  final Widget? leadingIcon;
  final bool hasTrailingArrow;
  final bool hasToggle;
  final bool toggleValue;
  final VoidCallback? onTap;
  final Function(bool)? onToggleChanged;
  final EdgeInsetsGeometry? margin;

  const SettingsItem({
    super.key,
    required this.title,
    this.subtitle,
    this.value,
    this.leadingIcon,
    this.hasTrailingArrow = false,
    this.hasToggle = false,
    this.toggleValue = false,
    this.onTap,
    this.onToggleChanged,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: hasToggle ? null : onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Row(
            children: [
              // Icône de gauche si présente
              if (leadingIcon != null) ...[
                leadingIcon!,
                SizedBox(width: 12),
              ],

              // Contenu principal
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ),

                    // Sous-titre si présent
                    if (subtitle != null) ...[
                      SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Valeur affichée si présente
              if (value != null && !hasToggle) ...[
                SizedBox(width: 8),
                Text(
                  value!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],

              // Toggle switch si activé
              if (hasToggle) ...[
                SizedBox(width: 8),
                Switch(
                  value: toggleValue,
                  onChanged: onToggleChanged,
                  activeColor: AppColors.primaryColor,
                  activeTrackColor: AppColors.primaryColor.withOpacity(0.3),
                  inactiveThumbColor: AppColors.greyColor,
                  inactiveTrackColor: AppColors.lightGreyColor,
                ),
              ],

              // Flèche de navigation si activée
              if (hasTrailingArrow && !hasToggle) ...[
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.greyColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Widget spécialisé pour les éléments avec icône colorée
class SettingsItemWithIcon extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String iconPath;
  final Color iconColor;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;

  const SettingsItemWithIcon({
    super.key,
    required this.title,
    this.subtitle,
    required this.iconPath,
    required this.iconColor,
    this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      title: title,
      subtitle: subtitle,
      hasTrailingArrow: true,
      onTap: onTap,
      margin: margin,
      leadingIcon: Container(
        width: 24,
        height: 24,
        child: CustomImageView(
          svgPath: iconPath,
          color: iconColor,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}

// Widget pour les sections de paramètres
class SettingsSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;

  const SettingsSection({
    super.key,
    this.title,
    required this.children,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de la section si présent
          if (title != null) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                title!,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyColor,
                ),
              ),
            ),
          ],

          // Éléments de la section
          ...children,
        ],
      ),
    );
  }
}
