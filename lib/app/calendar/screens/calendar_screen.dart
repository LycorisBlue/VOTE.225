import '/constants/app_export.dart';
import '/app/calendar/controllers/calendar_controller.dart';
import '/app/calendar/widgets/calendar_grid.dart';
import '/app/calendar/widgets/event_filters.dart';
import '/app/calendar/widgets/events_list.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});

  final CalendarController controller = Get.find<CalendarController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshEvents();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              CalendarGrid(),
              EventFilters(),
              EventsList(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Calendrier Electoral',
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
            onPressed: () => Get.back(),
            padding: EdgeInsets.zero,
          ),
        ),
      
      centerTitle: true,
    );
  }
}
