import '/constants/assets_path.dart';
import '../controllers/home_crontroller.dart';
import '/constants/app_export.dart';
import '../../../data/models/events.dart';

class NewsArticleCard extends StatelessWidget {
  final Article article;

  NewsArticleCard({
    super.key,
    required this.article,
  });

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MyNavigation.goToArticleDetail(article),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder8,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusStyle.roundedBorder8,
                child:  article.images.isNotEmpty ? CustomImageView(
                  url: article.images[0],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ): CustomImageView(
                  imagePath: AppImage.alassaneOuattaraBanner,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.titre,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 8),

                  Text(
                    article.description ?? article.categorieEvenement!.titre,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: AppColors.greyColor,
                      ),

                      SizedBox(width: 4),

                      Text(
                        Utils.timeAgo(article.dateDebut!),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
