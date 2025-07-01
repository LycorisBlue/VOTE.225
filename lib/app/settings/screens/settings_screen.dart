import '/constants/app_export.dart';
import '/constants/assets_path.dart';
import '/app/settings/controllers/settings_controller.dart';
import '/app/settings/widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final SettingsController controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.lightGreyColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

            // Section Langue de l'Interface
            SettingsSection(
              children: [
                Obx(() => SettingsItem(
                      title: 'Langue de l\'Interface',
                      value: controller.languageDisplayName,
                      hasTrailingArrow: true,
                      onTap: () => controller.showLanguageSelector(),
                    )),
              ],
            ),

            SizedBox(height: 16),

            // Section Notifications
            SettingsSection(
              children: [
                Obx(() => SettingsItem(
                      title: 'Notifications',
                      hasToggle: true,
                      toggleValue: controller.notificationsEnabled.value,
                      onToggleChanged: (value) => controller.toggleNotifications(value),
                    )),
              ],
            ),

            SizedBox(height: 16),

            // Section Accessibilité
            SettingsSection(
              title: 'Accessibilité',
              children: [
                Obx(() => SettingsItem(
                      title: 'Taille du Texte',
                      value: controller.textSizeDisplayName,
                      hasTrailingArrow: true,
                      onTap: () => controller.showTextSizeSelector(),
                    )),
                Obx(() => SettingsItem(
                      title: 'Contraste',
                      value: controller.contrastDisplayName,
                      hasTrailingArrow: true,
                      onTap: () => controller.showContrastSelector(),
                    )),
              ],
            ),

            SizedBox(height: 16),

            // Section Informations Légales
            SettingsSection(
              title: 'Informations Légales',
              children: [
                SettingsItemWithIcon(
                  title: 'Politique de Confidentialité',
                  iconPath: AppIcon.iconParametres,
                  iconColor: AppColors.primaryColor,
                  onTap: () => MyNavigation.goToPrivacy(),
                ),
                SettingsItemWithIcon(
                  title: 'Conditions d\'Utilisation',
                  iconPath: AppIcon.iconParametres,
                  iconColor: AppColors.primaryColor,
                  onTap: () =>  MyNavigation.goToCGU(),
                ),
                SettingsItemWithIcon(
                  title: 'Mentions Légales',
                  iconPath: AppIcon.iconParametres,
                  iconColor: AppColors.primaryColor,
                  onTap: () =>  MyNavigation.goToMentionLegale(),
                ),
                SettingsItemWithIcon(
                  title: 'À propos de l\'Application',
                  iconPath: AppIcon.iconAboutApp,
                  iconColor: Colors.blue,
                  onTap: () => MyNavigation.goToAbout(),
                ),
              ],
            ),

            // Espacement final
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.lightGreyColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Paramètres',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.accentColor, // Orange comme sur la maquette
        ),
      ),
      leading: Container(
        margin: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.blackColor,
            width: 1,
          ),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
            size: 18,
          ),
          onPressed: () => controller.goBack(),
          padding: EdgeInsets.zero,
        ),
      ),
      centerTitle: false,
    );
  }
}
