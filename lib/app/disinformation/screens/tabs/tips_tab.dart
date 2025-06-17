import '/constants/app_export.dart';
import '/constants/assets_path.dart';

class TipsTab extends StatelessWidget {
  const TipsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),

          // Liste des conseils
          _buildTipCard(
            image: AppImage.voteElectoralImage,
            title: 'Comment identifier une fake news',
            description: 'Guide pratique pour vérifier la fiabilité des informations',
            onTap: () => MyNavigation.goToTipDetail('fake-news'),
          ),

          SizedBox(height: 16),

          _buildTipCard(
            image: AppImage.voteElectoralImage,
            title: 'Les sources fiables d\'information',
            description: 'Liste des médias et sources officielles recommandées',
            onTap: () => MyNavigation.goToTipDetail('sources-fiables'),
          ),

          SizedBox(height: 16),

          _buildTipCard(
            image: AppImage.voteElectoralImage,
            title: 'Vérifier avant de partager',
            description: 'Étapes essentielles avant de diffuser une information',
            onTap: () => MyNavigation.goToTipDetail('verifier-partager'),
          ),

          SizedBox(height: 16),

          _buildTipCard(
            image: AppImage.voteElectoralImage,
            title: 'Reconnaître les manipulations d\'images',
            description: 'Techniques pour détecter les photos et vidéos modifiées',
            onTap: () => MyNavigation.goToTipDetail('manipulations-images'),
          ),

          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildTipCard({
    required String image,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusStyle.roundedBorder12,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            width: double.infinity,
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: CustomImageView(
                imagePath: image,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Contenu texte
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    height: 1.3,
                  ),
                ),

                SizedBox(height: 8),

                // Description
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                    height: 1.4,
                  ),
                ),

                SizedBox(height: 12),

                // Bouton "Lire plus"
                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    children: [
                      Text(
                        'Lire plus',
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
}
