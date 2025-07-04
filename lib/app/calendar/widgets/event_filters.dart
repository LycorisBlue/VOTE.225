import 'package:shimmer/shimmer.dart';

import '/constants/app_export.dart';
import '/app/calendar/controllers/calendar_controller.dart';
import '/data/models/electoral_event.dart';

class EventFilters extends StatelessWidget {
  EventFilters({super.key});

  final CalendarController controller = Get.find<CalendarController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Obx(() => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterButton(
                  text: 'Tous',
                  isSelected: controller.selectedFilter.value == null,
                  onTap: () => controller.showAllEvents(),
                ),
                SizedBox(width: 8),
                _buildFilterButton(
                  text: 'Inscriptions',
                  isSelected:
                      controller.selectedFilter.value == "Inscription",
                  onTap: () => controller.showInscriptionEvents(),
                ),
                SizedBox(width: 8),
                _buildFilterButton(
                  text: 'Campagne',
                  isSelected:
                      controller.selectedFilter.value == "Campagne",
                  onTap: () => controller.showCampaignEvents(),
                ),
                SizedBox(width: 8),
                _buildFilterButton(
                  text: 'Scrutin',
                  isSelected:
                      controller.selectedFilter.value == "Scrutin",
                  onTap: () => controller.showScrutinEvents(),
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
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.greyColor.withOpacity(0.3),
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

class FiltersShimmer extends StatelessWidget {
  const FiltersShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    child: Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(4, (_) {
            return Container(
              margin: EdgeInsets.only(right: 8),
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        ),
      ),
    ),
  );
  }
}
