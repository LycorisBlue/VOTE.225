import '/data/models/candidate.dart';
import '/constants/app_export.dart';

class PoliticalVisionSection extends StatelessWidget {
  const PoliticalVisionSection({super.key, required this.politicalVisions});

  final List<PoliticalVision> politicalVisions;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vision Politique',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: politicalVisions.asMap().entries.map((entry) {
              int index = entry.key;
              String vision = entry.value.title;
              return _buildVisionTag(
                text: vision,
                isOrange: index % 2 == 0, // Alterne entre orange et vert
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildVisionTag({
    required String text,
    required bool isOrange,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isOrange ? AppColors.accentColor : AppColors.primaryColor,
        borderRadius: BorderRadiusStyle.roundedBorder8,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icône
          Icon(
            isOrange ? Icons.trending_up : Icons.eco,
            size: 18,
            color: AppColors.whiteColor,
          ),

          SizedBox(width: 8),

          // Texte
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
