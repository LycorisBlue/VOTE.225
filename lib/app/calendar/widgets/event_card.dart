import '/constants/app_export.dart';
import '/data/models/electoral_event.dart';

class EventCard extends StatelessWidget {
  final ElectoralEvent event;

  const EventCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusStyle.roundedBorder12,
        border: Border.all(
          color: AppColors.lightGreyColor,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icône de l'événement
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _getEventColor().withOpacity(0.1),
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Center(
              child: Text(
                event.typeIcon,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),

          SizedBox(width: 12),

          // Contenu de l'événement
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre de l'événement
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),

                SizedBox(height: 4),

                // Date de l'événement
                Text(
                  event.formattedDate,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 8),

                // Description de l'événement
                Text(
                  event.description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                // Heure si disponible
                if (event.timeRange != null) ...[
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getEventColor().withOpacity(0.1),
                      borderRadius: BorderRadiusStyle.roundedBorder6,
                    ),
                    child: Text(
                      event.timeRange!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: _getEventColor(),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getEventColor() {
    switch (event.type) {
      case EventType.inscription:
        return AppColors.primaryColor;
      case EventType.campagne:
        return AppColors.accentColor;
      case EventType.scrutin:
        return AppColors.redColor;
      case EventType.validation:
        return AppColors.secondaryColor;
    }
  }
}
