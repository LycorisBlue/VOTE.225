import '/constants/app_export.dart';
import '/app/assistance/controllers/assistance_controller.dart';

class LanguageSelector extends StatelessWidget {
  LanguageSelector({super.key});

  final AssistanceController controller = Get.find<AssistanceController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildLanguageButton(
            language: LocalLanguage.francais,
            text: 'Français',
          ),
          _buildLanguageButton(
            language: LocalLanguage.baoule,
            text: 'Baoulé',
          ),
          _buildLanguageButton(
            language: LocalLanguage.bethe,
            text: 'Béthé',
          ),
          _buildLanguageButton(
            language: LocalLanguage.dioula,
            text: 'Dioula',
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageButton({
    required LocalLanguage language,
    required String text,
  }) {
    return Obx(() {
      final isSelected = controller.selectedLocalLanguage.value == language;

      return GestureDetector(
        onTap: () => controller.changeLocalLanguage(language),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
            borderRadius: BorderRadiusStyle.roundedBorder8,
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : AppColors.greyColor.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
        ),
      );
    });
  }
}
