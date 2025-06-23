import 'package:templateproject/constants/assets_path.dart';

import '/constants/app_export.dart';
import '/data/models/candidate.dart';
import '/app/candidates/controllers/candidates_controller.dart';

class CandidateGridCard extends StatelessWidget {
  final Candidate candidate;

  CandidateGridCard({
    super.key,
    required this.candidate,
  });

  final CandidatesController controller = Get.find<CandidatesController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MyNavigation.goToCandidateDetail(candidate),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadiusStyle.roundedBorder12,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: candidate.cover != null
                      ? CustomImageView(
                          url: candidate.cover,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      : CustomImageView(
                          imagePath: AppImage.alassaneOuattaraBanner,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                ),
              ),

              SizedBox(height: 12),

              Text(
                candidate.displayName,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 4),

              Text(
                candidate.politicalParties.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 12),

              GestureDetector(
                  onTap: () {}, //=> controller.toggleFavorite(candidate.id),
                  child:
                      // Obx(() {
                      // final updatedCandidate =
                      //     controller.allCandidates.firstWhere((c) => c.documentId == candidate.id, orElse: () => candidate);

                      // return
                      Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      //color: updatedCandidate.isFavorite ? AppColors.primaryColor : AppColors.primaryColor,
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      // updatedCandidate.isFavorite ? Icons.check :
                      Icons.add,
                      color: AppColors.whiteColor,
                      size: 18,
                    ),
                  )
                  // ;}),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
