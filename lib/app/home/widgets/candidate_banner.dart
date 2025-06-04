import '/constants/app_export.dart';
import '/constants/assets_path.dart';

class CandidateBanner extends StatelessWidget {
  const CandidateBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder12,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusStyle.roundedBorder12,
        child: Stack(
          children: [
            // Image de fond
            CustomImageView(
              imagePath: AppImage.alassaneOuattaraBanner,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),

            // Overlay gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),

            // Contenu texte
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alassane Ouattara candidat en 2025',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: AppColors.whiteColor,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '16 Avril 2025',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Indicateurs de pagination (points)
            Positioned(
              bottom: 16,
              right: 16,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDot(true),
                  SizedBox(width: 6),
                  _buildDot(false),
                  SizedBox(width: 6),
                  _buildDot(false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.whiteColor : AppColors.whiteColor.withOpacity(0.5),
      ),
    );
  }
}
