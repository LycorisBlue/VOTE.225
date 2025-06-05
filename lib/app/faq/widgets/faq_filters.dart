import '/constants/app_export.dart';
import '/app/faq/controllers/faq_controller.dart';
import '/data/models/faq_item.dart';

class FAQFilters extends StatelessWidget {
  FAQFilters({super.key});

  final FAQController controller = Get.find<FAQController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Obx(() => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterButton(
                  text: 'Tous',
                  isSelected: controller.selectedCategory.value == null,
                  onTap: () => controller.showAllItems(),
                ),
                SizedBox(width: 8),
                _buildFilterButton(
                  text: 'Inscription',
                  isSelected: controller.selectedCategory.value == FAQCategory.inscription,
                  onTap: () => controller.showInscriptionItems(),
                ),
                SizedBox(width: 8),
                _buildFilterButton(
                  text: 'Vote',
                  isSelected: controller.selectedCategory.value == FAQCategory.vote,
                  onTap: () => controller.showVoteItems(),
                ),
                SizedBox(width: 8),
                _buildFilterButton(
                  text: 'Résultats',
                  isSelected: controller.selectedCategory.value == FAQCategory.resultats,
                  onTap: () => controller.showResultsItems(),
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildFilterButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.lightGreyColor,
          borderRadius: BorderRadiusStyle.roundedBorder16,
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
            color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
