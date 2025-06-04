import '../../controllers/home_crontroller.dart';
import '/constants/app_export.dart';
import '/app/home/widgets/home_header.dart';
import '/app/home/widgets/candidate_banner.dart';
import '/app/home/widgets/news_section.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.refreshNews();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header avec logo et sélecteur de langue
              HomeHeader(),

              SizedBox(height: 16),

              // Bannière du candidat
              CandidateBanner(),

              SizedBox(height: 24),

              // Section des actualités
              NewsSection(),

              // Espacement pour la bottom navigation
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
