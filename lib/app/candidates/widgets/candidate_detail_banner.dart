import 'package:templateproject/constants/assets_path.dart';

import '/constants/app_export.dart';

class CandidateDetailBanner extends StatelessWidget {
  const CandidateDetailBanner(
      {super.key,
      required this.nom,
      required this.politicalPartiesNom,
      this.imageUrl});

  final String nom;
  final String politicalPartiesNom;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
        ),
        Positioned(
          left: 16,
          top: 40,
          bottom: -20,
          child: Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadiusStyle.roundedBorder8,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadiusStyle.roundedBorder6,
              child: imageUrl != null ? CustomImageView(
                url: imageUrl,
                width: 72,
                height: 92,
                fit: BoxFit.cover,
              ): CustomImageView(
                imagePath: AppImage.alassaneOuattaraBanner,
                width: 72,
                height: 92,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 120,
          right: 16,
          top: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nom,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                politicalPartiesNom,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.whiteColor.withValues(alpha: 0.9),
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
