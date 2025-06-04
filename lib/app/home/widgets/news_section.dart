import '../controllers/home_crontroller.dart';
import '/constants/app_export.dart';
import '/app/home/widgets/news_article_card.dart';

class NewsSection extends StatelessWidget {
  NewsSection({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de la section
          Text(
            'Actualités Électorales',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),

          SizedBox(height: 16),

          // Liste des articles
          Obx(() {
            if (controller.isLoading.value) {
              return _buildLoadingState();
            }

            if (controller.newsArticles.isEmpty) {
              return _buildEmptyState();
            }

            return Column(
              children: controller.newsArticles.map((article) => NewsArticleCard(article: article)).toList(),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Column(
      children: List.generate(
        3,
        (index) => Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              // Image placeholder
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
              ),

              SizedBox(width: 12),

              // Contenu placeholder
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.lightGreyColor,
                        borderRadius: BorderRadiusStyle.roundedBorder4,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 14,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColors.lightGreyColor,
                        borderRadius: BorderRadiusStyle.roundedBorder4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.article_outlined,
            size: 64,
            color: AppColors.greyColor,
          ),
          SizedBox(height: 16),
          Text(
            'Aucune actualité disponible',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          CustomButton(
            text: 'Actualiser',
            onTap: () => controller.refreshNews(),
            variant: ButtonVariant.Outline,
            width: 120,
          ),
        ],
      ),
    );
  }
}
