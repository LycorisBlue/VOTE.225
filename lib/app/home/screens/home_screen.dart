import '/constants/app_export.dart';
import '/shared_components/layout/bottom_navigation/bn_contolleur.dart';
import '/shared_components/layout/bottom_navigation/bottom_navigation_bar.dart';
import '/app/home/screens/tabs/home_tab.dart';
import 'tabs/assistance_tab.dart';
import 'tabs/candidates_tab.dart';
import 'tabs/menu_tab.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final BNavigationController navigationController = Get.find<BNavigationController>();

  final List<Widget> pages = [
    HomeTab(), // Index 0 - Accueil
    CandidatesTab(), // Index 1 - Candidats
    AssistanceTab(), // Index 2 - Assistance
    MenuTab(), // Index 3 - Menu (mis à jour)
  ];

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(
        () => pages[navigationController.tabIndex.value],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
