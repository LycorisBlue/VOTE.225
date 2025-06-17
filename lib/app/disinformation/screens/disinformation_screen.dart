import '/constants/app_export.dart';
import '/app/disinformation/controllers/disinformation_controller.dart';
import '/app/disinformation/screens/tabs/report_tab.dart';
import '/app/disinformation/screens/tabs/reports_list_tab.dart';
import '/app/disinformation/screens/tabs/tips_tab.dart';

class DisinformationScreen extends StatelessWidget {
  DisinformationScreen({super.key});

  final DisinformationController controller = Get.find<DisinformationController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MyAppScaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            // TabBar native de Flutter
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.primaryColor,
                      width: 3,
                    ),
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
                  Tab(text: 'Signaler'),
                  Tab(text: 'Signalements'),
                  Tab(text: 'Conseils'),
                ],
              ),
            ),

            // Contenu des onglets
            Expanded(
              child: TabBarView(
                children: [
                  ReportTab(),
                  ReportsListTab(),
                  TipsTab(),
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
        'Lutte contre la Désinformation',
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
