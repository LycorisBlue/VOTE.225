import '/constants/app_export.dart';

class CandidateInfoSection extends StatelessWidget {
  const CandidateInfoSection(
      {super.key,
      required this.age,
      required this.experience,
       this.ville,
      required this.fonction});
  final int age;
  final String experience;
  final String? ville;
  final String fonction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                _buildInfoCard(
                  icon: Icons.person,
                  title: "$age ans",
                  subtitle: fonction,
                ),
                SizedBox(height: 12),
                _buildInfoCard(
                  icon: Icons.history,
                  title: 'Expérience',
                  subtitle: experience,
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
                  title: "Ville", // Ville
                  subtitle: ville ?? "--",
                ),
                SizedBox(height: 12),
                _buildInfoCard(
                  icon: Icons.work,
                  title: 'Fonction',
                  subtitle: fonction,
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
