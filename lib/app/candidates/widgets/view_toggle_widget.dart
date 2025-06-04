import '/constants/app_export.dart';
import '/app/candidates/controllers/candidates_controller.dart';

class ViewToggleWidget extends StatelessWidget {
  ViewToggleWidget({super.key});

  final CandidatesController controller = Get.find<CandidatesController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Bouton Liste
              _buildToggleButton(
                text: 'Liste',
                icon: Icons.list,
                isSelected: controller.isListView,
                onTap: () => controller.toggleViewType(ViewType.list),
              ),

              SizedBox(width: 8),

              // Bouton Grille
              _buildToggleButton(
                text: 'Grille',
                icon: Icons.grid_view,
                isSelected: controller.isGridView,
                onTap: () => controller.toggleViewType(ViewType.grid),
              ),
            ],
          ),
        ));
  }

  Widget _buildToggleButton({
    required String text,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.lightGreyColor,
          borderRadius: BorderRadiusStyle.roundedBorder8,
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.greyColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
            ),
            SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
