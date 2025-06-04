import '/constants/app_export.dart';

class MenuItemWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final Color? iconColor;

  const MenuItemWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Row(
            children: [
              // Icône
              Container(
                width: 24,
                height: 24,
                child: CustomImageView(
                  svgPath: iconPath,
                  color: iconColor ?? AppColors.primaryColor,
                  width: 24,
                  height: 24,
                ),
              ),

              SizedBox(width: 16),

              // Texte
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ),
                    if (subtitle != null) ...[
                      SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Flèche
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.greyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
