import '/constants/app_export.dart';
import '/app/faq/controllers/faq_controller.dart';
import '/app/faq/widgets/faq_search_bar.dart';
import '/app/faq/widgets/faq_filters.dart';
import '/app/faq/widgets/faq_list.dart';

class FAQScreen extends StatelessWidget {
  FAQScreen({super.key});

  final FAQController controller = Get.find<FAQController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshFAQItems();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),

              // Barre de recherche
              FAQSearchBar(),

              // Filtres par catégorie
              FAQFilters(),

              SizedBox(height: 8),

              // Liste des questions FAQ
              FAQList(),

              // Espacement final
              SizedBox(height: 32),
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
        title: Text(
          'FAQ',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.accentColor, // Orange comme sur la maquette
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
        centerTitle: true);
  }
}
