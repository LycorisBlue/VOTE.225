import 'package:shimmer/shimmer.dart';

import '/constants/app_export.dart';
import '/app/calendar/controllers/calendar_controller.dart';
import '/app/calendar/widgets/event_card.dart';

class EventsList extends StatelessWidget {
  EventsList({super.key});

  final CalendarController controller = Get.find<CalendarController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de la section
          Text(
            'Événements',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),

          SizedBox(height: 16),

          // Liste des événements
          Obx(() {
            if (controller.isLoading.value) {
              return _buildLoadingState();
            }

            if (controller.filteredEvents.isEmpty) {
              return _buildEmptyState();
            }

            return Column(
              children: controller.filteredEvents.map((event) => EventCard(event: event)).toList(),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 16),
            Text(
              'Chargement des événements...',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.event_note,
            size: 64,
            color: AppColors.greyColor,
          ),
          SizedBox(height: 16),
          Text(
            'Aucun événement trouvé',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyColor,
            ),
          ),
          SizedBox(height: 8),
          Obx(() => Text(
                controller.selectedFilter.value == null
                    ? 'Aucun événement prévu pour cette période'
                    : 'Aucun événement de type "${controller.activeFilterName.value}" trouvé',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                ),
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 16),
          CustomButton(
            text: 'Actualiser',
            onTap: () => controller.refreshEvents(),
            variant: ButtonVariant.Outline,
            width: 120,
          ),
        ],
      ),
    );
  }
}



class EventsShimmer extends StatelessWidget {
  const EventsShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Événements',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 16),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: List.generate(3, (_) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
