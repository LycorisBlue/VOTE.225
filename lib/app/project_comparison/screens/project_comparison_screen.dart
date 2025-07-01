import '/constants/app_export.dart';
import '/app/project_comparison/controllers/project_comparison_controller.dart';
import '/app/project_comparison/widgets/all_projects_tab.dart';
import '/app/project_comparison/widgets/compare_tab.dart';

class ProjectComparisonScreen extends StatelessWidget {
  ProjectComparisonScreen({super.key});

  final ProjectComparisonController controller = Get.find<ProjectComparisonController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MyAppScaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            // TabBar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 3,
                  ),
                ),
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.greyColor,
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  Tab(text: 'Tous les Projets'),
                  Tab(text: 'Comparer'),
                ],
              ),
            ),

            // Contenu des onglets
            Expanded(
              child: TabBarView(
                children: [
                  AllProjectsTab(),
                  CompareTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Projet de Société',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.accentColor,
        ),
      ),
      leading: Container(
        margin: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.blackColor,
            width: 1,
          ),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
            size: 18,
          ),
          onPressed: () => controller.goBack(),
          padding: EdgeInsets.zero,
        ),
      ),
      centerTitle: false,
    );
  }
}
