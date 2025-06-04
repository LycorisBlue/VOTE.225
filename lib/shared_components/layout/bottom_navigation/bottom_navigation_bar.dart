import '/constants/app_export.dart';
import '/constants/assets_path.dart';
import '/shared_components/layout/bottom_navigation/bn_contolleur.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});

  final BNavigationController navigationController = Get.put(BNavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.whiteColor,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.greyColor,
          selectedFontSize: 12.sp,
          unselectedFontSize: 12.sp,
          currentIndex: navigationController.tabIndex.value,
          onTap: navigationController.changeTabIndex,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(AppIcon.iconHome, 0),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(AppIcon.iconCandidates, 1),
              label: 'Candidats',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(AppIcon.iconAssistance, 2),
              label: 'Assistance',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(AppIcon.iconMenu, 3),
              label: 'Menu',
            ),
          ],
        ));
  }

  Widget _buildIcon(String iconPath, int index) {
    final isSelected = navigationController.tabIndex.value == index;

    return Container(
      padding: EdgeInsets.all(4),
      child: CustomImageView(
        svgPath: iconPath,
        width: 24,
        height: 24,
        color: isSelected ? AppColors.primaryColor : AppColors.greyColor,
      ),
    );
  }
}
