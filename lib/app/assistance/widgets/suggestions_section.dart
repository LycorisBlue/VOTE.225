import '/constants/app_export.dart';
import '/app/assistance/controllers/assistance_controller.dart';

class SuggestionsSection extends StatelessWidget {
  SuggestionsSection({super.key});

  final AssistanceController controller = Get.find<AssistanceController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de la section
          Text(
            'Essayez de dire :',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),

          SizedBox(height: 12),

          // Boutons de suggestions
          Row(
            children: [
              Expanded(
                child: _buildSuggestionButton(
                  controller.suggestions[0],
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildSuggestionButton(
                  controller.suggestions[1],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionButton(String suggestion) {
    return GestureDetector(
      onTap: () => controller.useSuggestion(suggestion),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadiusStyle.roundedBorder8,
          border: Border.all(
            color: AppColors.greyColor.withOpacity(0.3),
            width: .5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          suggestion,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
