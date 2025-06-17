import '/constants/assets_path.dart';
import '/constants/app_export.dart';
import '/data/models/candidate.dart';
import '/app/candidates/controllers/candidates_controller.dart';

class CandidateListItem extends StatelessWidget {
  final Candidate candidate;

  CandidateListItem({
    super.key,
    required this.candidate,
  });

  final controller = Get.find<CandidatesController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, //=> controller.navigateToCandidateDetail(candidate),
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
            Container(
              width: 50,
              height: 50,
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
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : CustomImageView(
                        imagePath: AppImage.alassaneOuattaraBanner,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    candidate.displayName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                    maxLines: 1,
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
                  ),
                ],
              ),
            ),

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
