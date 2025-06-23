import '/constants/app_export.dart';
import '/data/models/electoral_process.dart';
import '/app/electoral_process/controllers/electoral_process_controller.dart';

class ProcessStepCard extends StatelessWidget {
  final ElectoralProcess processStep;

  const ProcessStepCard({
    super.key,
    required this.processStep,
  });

  @override
  Widget build(BuildContext context) {
    final ElectoralProcessController controller = Get.find<ElectoralProcessController>();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusStyle.roundedBorder12,
        border: Border.all(
          color: AppColors.greyColor.withOpacity(0.3), // Bordure plus visible
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02), // Ombre réduite de 0.05 à 0.02
            blurRadius: 4, // Flou réduit de 8 à 4
            offset: Offset(0, 1), // Décalage réduit de 2 à 1
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icône verte dans un cercle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getIconData(processStep.iconName),
              color: AppColors.whiteColor,
              size: 20,
            ),
          ),

          SizedBox(width: 16),

          // Contenu texte
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre de l'étape
                Text(
                  processStep.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                    height: 1.3,
                  ),
                ),

                SizedBox(height: 8),

                // Description
                Text(
                  processStep.description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                    height: 1.4,
                  ),
                ),

                SizedBox(height: 12),

                // Bouton "En savoir plus"
                GestureDetector(
                  onTap: () => controller.goToStepDetail(processStep),
                  child: Row(
                    children: [
                      Text(
                        'En savoir plus',
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
          ),
        ],
      ),
    );
  }

  // Méthode pour obtenir l'icône appropriée selon le nom
  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'edit':
        return Icons.edit_document;
      case 'search':
        return Icons.search;
      case 'campaign':
        return Icons.campaign;
      case 'vote':
        return Icons.how_to_vote;
      case 'results':
        return Icons.poll;
      default:
        return Icons.info;
    }
  }
}
