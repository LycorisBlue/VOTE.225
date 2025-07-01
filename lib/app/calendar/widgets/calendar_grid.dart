import 'package:shimmer/shimmer.dart';
import 'package:table_calendar/table_calendar.dart';
import '/constants/app_export.dart';
import '/app/calendar/controllers/calendar_controller.dart';

class CalendarGrid extends StatelessWidget {
  CalendarGrid({super.key});

  final CalendarController controller = Get.find<CalendarController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Obx(() => TableCalendar(
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            focusedDay: controller.focusedDay.value,
            selectedDayPredicate: (day) {
              return isSameDay(controller.selectedDay.value, day);
            },
            eventLoader: (day) {
              return controller.getEventsForCalendar(day);
            },
            startingDayOfWeek: controller.startingDayOfWeek,
            calendarFormat: controller.calendarFormat,
            onDaySelected: (selectedDay, focusedDay) {
              controller.selectDay(selectedDay, focusedDay);
            },
            onPageChanged: (focusedDay) {
              controller.focusedDay.value = focusedDay;
            },
            // Style du calendrier
            calendarStyle: CalendarStyle(
              // Style des jours normaux
              defaultTextStyle: TextStyle(
                fontSize: 16.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
              // Style des weekends
              weekendTextStyle: TextStyle(
                fontSize: 16.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
              // Style du jour sélectionné
              selectedTextStyle: TextStyle(
                fontSize: 16.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
              selectedDecoration: BoxDecoration(
                color: AppColors.tertiaryColor,
                shape: BoxShape.circle,
              ),
              // Style du jour actuel
              todayTextStyle: TextStyle(
                fontSize: 16.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
              todayDecoration: BoxDecoration(
                color: AppColors.accentColor,
                shape: BoxShape.circle,
              ),
              // Style des jours avec événements
              markerDecoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              // Espacement
              cellMargin: EdgeInsets.all(4),
              cellAlignment: Alignment.center,
              // Masquer les marqueurs par défaut car on utilise un style personnalisé
              markersMaxCount: 0,
            ),
            // Style de l'en-tête
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: false,
              leftChevronVisible: false,
              rightChevronVisible: false,
              headerPadding: EdgeInsets.zero,
              headerMargin: EdgeInsets.zero,
              titleTextStyle:
                  TextStyle(fontSize: 0), // Caché car on utilise notre header
            ),
            // Style des jours de la semaine
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontSize: 14.sp,
                color: AppColors.greyColor,
                fontWeight: FontWeight.w600,
              ),
              weekendStyle: TextStyle(
                fontSize: 14.sp,
                color: AppColors.greyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Builder personnalisé pour les jours avec événements
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final hasEvents = controller.hasEventsOnDay(day);

                return Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: hasEvents ? AppColors.tertiaryColor : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: hasEvents ? AppColors.primaryColor : AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
              outsideBuilder: (context, day, focusedDay) {
                return Container(
                  margin: EdgeInsets.all(4),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.greyColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}

class CalendarShimmerGrid extends StatelessWidget {
  const CalendarShimmerGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 7 * 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (_, __) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
