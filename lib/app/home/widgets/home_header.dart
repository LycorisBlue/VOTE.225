import '../controllers/home_crontroller.dart';
import '/constants/app_export.dart';
import '/constants/assets_path.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo 225 VOTES
          CustomImageView(
            imagePath: AppImage.logo225Votes,
            width: 120,
          ),

          // Sélecteur de langue
          Obx(() => GestureDetector(
                onTap: () => _showLanguageSelector(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                    border: Border.all(
                      color: AppColors.greyColor.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.language,
                        size: 16,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 4),
                      Text(
                        controller.selectedLanguage.value,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void _showLanguageSelector(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choisir la langue',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            _buildLanguageOption('FR', 'Français'),
            _buildLanguageOption('EN', 'English'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String code, String name) {
    return Obx(() => ListTile(
          title: Text(name),
          trailing: controller.selectedLanguage.value == code ? Icon(Icons.check, color: AppColors.primaryColor) : null,
          onTap: () {
            controller.changeLanguage(code);
            Get.back();
          },
        ));
  }
}
