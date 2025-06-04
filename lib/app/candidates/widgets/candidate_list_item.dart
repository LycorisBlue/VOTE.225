import '/constants/app_export.dart';
import '/data/models/candidate.dart';
import '/app/candidates/controllers/candidates_controller.dart';

class CandidateListItem extends StatelessWidget {
  final Candidate candidate;

  CandidateListItem({
    super.key,
    required this.candidate,
  });

  final CandidatesController controller = Get.find<CandidatesController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.navigateToCandidateDetail(candidate),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border(
            bottom: BorderSide(
              color: AppColors.lightGreyColor,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            // Photo du candidat
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipOval(
                child: CustomImageView(
                  imagePath: candidate.imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: 12),

            // Informations du candidat
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom du candidat
                  Text(
                    candidate.fullName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 4),

                  // Parti politique
                  Text(
                    candidate.party,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Flèche de navigation
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
