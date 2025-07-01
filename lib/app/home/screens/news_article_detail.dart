import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:templateproject/constants/assets_path.dart';
import 'package:templateproject/data/models/events.dart';

import '/app/home/controllers/home_crontroller.dart';
import '/constants/app_export.dart';

class ArticleDetailScreen extends StatelessWidget {
  ArticleDetailScreen({super.key});

  final controller = Get.find<HomeController>();
  final article = Get.arguments as Article;

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.titre,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: 11),
              Text(
                article.categorieEvenement!.titre,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentColor,
                ),
              ),
              SizedBox(height: 11),
              Row(
                children: [
                  CustomImageView(
                    svgPath: AppIcon.iconTime,
                    margin: EdgeInsets.only(right: 8),
                  ),
                  Text(
                    Utils.timeAgo(article.dateDebut!),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: 1.sw,
                height: 0.3.sh,
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
                  child: article.images.isNotEmpty
                      ? CustomImageView(
                          url: article.images[0],
                          width: 1.sw,
                          height: 0.3.sh,
                          fit: BoxFit.cover,
                        )
                      : CustomImageView(
                          imagePath: AppImage.alassaneOuattaraBanner,
                          width: 1.sw,
                          height: 0.3.sh,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
               SizedBox(height: 4),
              Text(
                article.election.titre,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(height: 16),
              Text(
                article.description ?? "Pas de Commentaire",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      // title: Text(
      //   'MENTIONS LÉGALES',
      //   style: TextStyle(
      //     fontSize: 18.sp,
      //     fontWeight: FontWeight.w600,
      //     color: AppColors.accentColor,
      //   ),
      // ),
      leading: Container(
        margin: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.accentColor,
            width: 1,
          ),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.accentColor,
            size: 22,
          ),
          onPressed: () => Get.back(),
          padding: EdgeInsets.zero,
        ),
      ),
      centerTitle: true,
    );
  }
}
