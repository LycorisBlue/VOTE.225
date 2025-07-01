import '/constants/app_export.dart';
import '/data/models/region_info.dart';

class RegionInfoSection extends StatelessWidget {
  final RegionInfo regionInfo;
  final VoidCallback? onClose;

  const RegionInfoSection({
    super.key,
    required this.regionInfo,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Titre de la région
          Text(
            regionInfo.nom,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),

          SizedBox(height: 4),

          // Sous-titre "Détails électoraux"
          Text(
            'Détails électoraux',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 24),

          // Première ligne : Chef-lieu et Bureaux de vote
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chef-lieu de région
              Expanded(
                child: _buildInfoItem(
                  icon: Icons.location_on,
                  label: 'Chef-lieu de région :',
                  value: regionInfo.chefLieu,
                ),
              ),

              SizedBox(width: 24),

              // Bureaux de vote
              Expanded(
                child: _buildInfoItem(
                  icon: Icons.people,
                  label: 'Bureaux de vote :',
                  value: regionInfo.bureauxDeVoteFormatted,
                ),
              ),
            ],
          ),

          SizedBox(height: 32),

          // Deuxième ligne : Population seule
          _buildInfoItem(
            icon: Icons.person,
            label: 'Population',
            value: regionInfo.populationComplete,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icône et label sur la même ligne
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: AppColors.accentColor, // Orange
            ),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.accentColor, // Orange
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 8),

        // Valeur en dessous
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
