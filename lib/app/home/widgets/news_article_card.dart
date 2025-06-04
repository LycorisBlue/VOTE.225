import '../controllers/home_crontroller.dart';
import '/constants/app_export.dart';
import '/data/models/news_article.dart';

class NewsArticleCard extends StatelessWidget {
  final NewsArticle article;

  NewsArticleCard({
    super.key,
    required this.article,
  });

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.navigateToArticleDetail(article),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image de l'article
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder8,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusStyle.roundedBorder8,
                child: CustomImageView(
                  imagePath: article.imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: 12),

            // Contenu de l'article
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre de l'article
                  Text(
                    article.title,
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
                    article.source,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Source et temps
                  Row(
                    children: [

                      // Icône temps
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: AppColors.greyColor,
                      ),

                      SizedBox(width: 4),

                      // Temps écoulé
                      Text(
                        article.timeAgo,
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

            // Flèche de navigation
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
