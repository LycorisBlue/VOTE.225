import 'package:templateproject/data/models/disinformation.dart';

import '/constants/app_export.dart';

class ReportsListTab extends StatelessWidget {
  const ReportsListTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DisinformationReport> reports = DisinformationReport.getSampleReports();

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: reports.length,
      itemBuilder: (context, index) {
        final report = reports[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadiusStyle.roundedBorder12,
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête avec statut et date
              Row(
                children: [
                  // Icône de statut
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: _getStatusColor(report.status),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getStatusIcon(report.status),
                      color: AppColors.whiteColor,
                      size: 14,
                    ),
                  ),
                  SizedBox(width: 8),
                  // Date
                  Text(
                    report.formattedDate,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  // Badge de statut
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(report.status).withOpacity(0.1),
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                    ),
                    child: Text(
                      report.statusDisplayName,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: _getStatusColor(report.status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              // Titre du signalement
              Text(
                report.title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 12),

              // Bouton "Voir détails"
              GestureDetector(
                onTap: () {
                  // Navigation vers les détails du signalement
                  _showReportDetails(context, report);
                },
                child: Row(
                  children: [
                    Text(
                      'Voir détails',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getStatusColor(ReportStatus status) {
    switch (status) {
      case ReportStatus.enAttente:
        return AppColors.accentColor; // Orange
      case ReportStatus.verifie:
        return AppColors.primaryColor; // Vert
      case ReportStatus.faux:
        return Colors.red;
    }
  }

  IconData _getStatusIcon(ReportStatus status) {
    switch (status) {
      case ReportStatus.enAttente:
        return Icons.schedule;
      case ReportStatus.verifie:
        return Icons.check;
      case ReportStatus.faux:
        return Icons.close;
    }
  }

  void _showReportDetails(BuildContext context, DisinformationReport report) {
    MyNavigation.goToReportDetail(report);
  }

}
