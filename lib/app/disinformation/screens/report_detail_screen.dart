import 'package:templateproject/data/models/disinformation.dart';

import '/constants/app_export.dart';
import '/constants/assets_path.dart';

class ReportDetailScreen extends StatelessWidget {
  const ReportDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupérer le signalement passé en argument
    final DisinformationReport report = Get.arguments as DisinformationReport;

    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge de statut
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: _getStatusBackgroundColor(report.status),
                borderRadius: BorderRadiusStyle.roundedBorder8,
              ),
              child: Text(
                report.statusDisplayName,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: _getStatusTextColor(report.status),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 20),

            // Titre du signalement
            Text(
              report.title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
                height: 1.3,
              ),
            ),

            SizedBox(height: 12),

            // Date et catégorie
            Row(
              children: [
                Text(
                  report.formattedDate,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Text(
                    'politique',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Signalement anonyme
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: AppColors.greyColor,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  'Signalement anonyme',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Description détaillée
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                borderRadius: BorderRadiusStyle.roundedBorder8,
              ),
              child: Text(
                'Une information circule sur les réseaux sociaux concernant des irrégularités dans le processus électoral de la région Sud. Selon ces allégations, plusieurs bureaux de vote auraient connu des anomalies dans le décompte des voix.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                  height: 1.4,
                ),
              ),
            ),

            SizedBox(height: 24),

            // Section capture d'écran
            Text(
              'Capture d\'écran du signalement :',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),

            SizedBox(height: 12),

            // Image
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder8,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyColor.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusStyle.roundedBorder8,
                child: CustomImageView(
                  imagePath: AppImage.voteElectoralImage,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 32),
          ],
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
        'Détail du Signalement',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.accentColor, // Orange
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
      centerTitle: false,
    );
  }

  Color _getStatusBackgroundColor(ReportStatus status) {
    switch (status) {
      case ReportStatus.enAttente:
        return Color(0xFFFFF3CD); // Jaune clair
      case ReportStatus.verifie:
        return AppColors.primaryColor.withOpacity(0.1);
      case ReportStatus.faux:
        return Colors.red.withOpacity(0.1);
    }
  }

  Color _getStatusTextColor(ReportStatus status) {
    switch (status) {
      case ReportStatus.enAttente:
        return Color(0xFF856404); // Jaune foncé
      case ReportStatus.verifie:
        return AppColors.primaryColor;
      case ReportStatus.faux:
        return Colors.red;
    }
  }
}
