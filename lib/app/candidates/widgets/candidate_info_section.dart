import '../controllers/candidate_detail_controller.dart';
import '/constants/app_export.dart';

class CandidateInfoSection extends StatelessWidget {
  CandidateInfoSection({super.key});

  final CandidateDetailController controller = Get.find<CandidateDetailController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          // Colonne gauche - Âge et Expérience
          Expanded(
            child: Column(
              children: [
                _buildInfoCard(
                  icon: Icons.person,
                  title: controller.candidateAge,
                  subtitle: controller.candidateStatus,
                ),
                SizedBox(height: 12),
                _buildInfoCard(
                  icon: Icons.history,
                  title: 'Expérience',
                  subtitle: controller.candidateExperience,
                ),
              ],
            ),
          ),

          SizedBox(width: 12),

          // Colonne droite - Localisation et Fonction
          Expanded(
            child: Column(
              children: [
                _buildInfoCard(
                  icon: Icons.location_on,
                  title: controller.candidateLocation.split(',')[0], // Ville
                  subtitle: controller.candidateLocation.split(',').length > 1
                      ? controller.candidateLocation.split(',')[1].trim() // District
                      : '',
                ),
                SizedBox(height: 12),
                _buildInfoCard(
                  icon: Icons.work,
                  title: 'Fonction',
                  subtitle: controller.candidateFunction,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      // Suppression des boxShadow et des bordures
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icône et titre
          Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: AppColors.greyColor,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          SizedBox(height: 4),

          // Sous-titre
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
