import '/constants/app_export.dart';

class DetailSectionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> items;
  final bool showCheckmarks;

  const DetailSectionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
    this.showCheckmarks = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusStyle.roundedBorder12,
        border: Border.all(
          color: AppColors.greyColor.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête avec icône et titre
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.primaryColor,
                size: 24.sp,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Liste des éléments
          ...items.map((item) => _buildListItem(item)).toList(),
        ],
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icône de validation verte ou puce
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(top: 2),
            child: showCheckmarks
                ? Icon(
                    Icons.check_circle,
                    color: AppColors.primaryColor,
                    size: 16,
                  )
                : Container(
                    width: 6,
                    height: 6,
                    margin: EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
          ),

          SizedBox(width: 8),

          // Texte de l'élément
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.greyColor,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
