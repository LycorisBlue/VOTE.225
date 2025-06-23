import '../../../menu/controllers/menu_controller.dart';
import '/constants/app_export.dart';
import '/constants/assets_path.dart';
import '/app/menu/widgets/menu_item_widget.dart';

class MenuTab extends StatelessWidget {
  MenuTab({super.key});

  final MenusController controller = Get.find<MenusController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MenuItemWidget(
                    iconPath: AppIcon.iconCalendarElectoral,
                    title: 'Calendrier Electoral',
                    onTap: () => MyNavigation.goToCalendar(),
                    iconColor: AppColors.primaryColor,
                  ),
                  MenuItemWidget(
                    iconPath: AppIcon.iconProcessusElectoral,
                    title: 'Processus Electoral',
                    onTap: () => MyNavigation.goToElectoralProcess(),
                    iconColor: AppColors.primaryColor,
                  ),
                  MenuItemWidget(
                    iconPath: AppIcon.iconGlossaireElectoral,
                    title: 'Glossaire Electoral',
                    onTap: () => MyNavigation.goToGlossary(),
                    iconColor: AppColors.primaryColor,
                  ),
                  MenuItemWidget(
                    iconPath: AppIcon.iconFAQCitoyenne,
                    title: 'FAQ Citoyenne',
                    onTap: () => MyNavigation.goToFAQ(),
                    iconColor: AppColors.primaryColor,
                  ),
                  MenuItemWidget(
                    iconPath: AppIcon.iconParametres, // Utiliser une icône existante ou en créer une nouvelle
                    title: 'Lutte contre la Désinformation',
                    onTap: () => controller.handleMenuItemTap('disinformation'),
                    iconColor: AppColors.primaryColor,
                  ),
                  MenuItemWidget(
                    iconPath: AppIcon.iconParametres,
                    title: 'Paramètres',
                    onTap: () => MyNavigation.goToSettings(),
                    iconColor: AppColors.primaryColor,
                  ),
                  MenuItemWidget(
                    iconPath: AppIcon.iconAboutApp,
                    title: 'À propos de l\'application',
                    subtitle: 'v1.0.0',
                    onTap: () => MyNavigation.goToAbout(),
                    iconColor: AppColors.primaryColor,
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        'Menu',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.accentColor, // Orange
        ),
      ),
    );
  }
}
