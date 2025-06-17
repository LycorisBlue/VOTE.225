import '/app/home/controllers/home_crontroller.dart';
import '/constants/app_export.dart';

class ArticleDetailScreen extends StatelessWidget {
  ArticleDetailScreen({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
  
            ],
          ),
        );
      }),
      );
  }

}
