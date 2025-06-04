import '/constants/app_export.dart';
import '/app/candidates/controllers/candidate_detail_controller.dart';

class CandidateDetailBanner extends StatelessWidget {
  CandidateDetailBanner({super.key});

  final CandidateDetailController controller = Get.find<CandidateDetailController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Bannière verte
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
        ),

        // Photo du candidat qui dépasse
        Positioned(
          left: 16,
          top: 40,
          bottom: -20, // Fait dépasser la photo vers le bas
          child: Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadiusStyle.roundedBorder8,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadiusStyle.roundedBorder6,
              child: CustomImageView(
                imagePath: controller.candidateImage,
                width: 72,
                height: 92,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Texte aligné avec le haut de l'image
        Positioned(
          left: 120, // Après l'image + espacement
          right: 16,
          top: 40, // Même niveau que le haut de l'image
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nom du candidat
              Text(
                controller.candidateName,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 4),

              // Parti politique
              Text(
                controller.candidateParty,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.whiteColor.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
