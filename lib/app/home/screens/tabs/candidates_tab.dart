import '/constants/app_export.dart';
import '/app/candidates/controllers/candidates_controller.dart';
import '/app/candidates/widgets/candidate_grid_card.dart';
import '/app/candidates/widgets/candidate_list_item.dart';
import '/app/candidates/widgets/view_toggle_widget.dart';

class CandidatesTab extends StatelessWidget {
  CandidatesTab({super.key});

  final CandidatesController controller = Get.find<CandidatesController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.refreshCandidates();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),

              // Barre de recherche
              _buildSearchBar(),

              // Toggle de vue
              ViewToggleWidget(),

              // Liste/Grille des candidats
              Obx(() {
                if (controller.isLoading.value) {
                  return _buildLoadingState();
                }

                if (controller.filteredCandidates.isEmpty) {
                  return _buildEmptyState();
                }

                return controller.isGridView ? _buildGridView() : _buildListView();
              }),

              // Espacement pour la bottom navigation
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        'Candidats',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.accentColor, // Orange comme sur la maquette
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              hintText: 'Rechercher un candidat',
              prefix: Icon(
                Icons.search,
                color: AppColors.greyColor,
                size: 20,
              ),
              shape: TextFormFieldShape.RoundedBorder12,
              variant: TextFormFieldVariant.Outline,
              onChange1: (value) => controller.updateSearchQuery(value ?? ''),
            ),
          ),
          SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadiusStyle.roundedBorder12,
              border: Border.all(
                color: AppColors.greyColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.tune,
              color: AppColors.greyColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: controller.filteredCandidates.length,
        itemBuilder: (context, index) => CandidateGridCard(
          candidate: controller.filteredCandidates[index],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Column(
      children: controller.filteredCandidates.map((candidate) => CandidateListItem(candidate: candidate)).toList(),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
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
            Icons.person_search,
            size: 64,
            color: AppColors.greyColor,
          ),
          SizedBox(height: 16),
          Text(
            controller.searchQuery.value.isNotEmpty
                ? 'Aucun candidat trouvé pour "${controller.searchQuery.value}"'
                : 'Aucun candidat disponible',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          if (controller.searchQuery.value.isNotEmpty) ...[
            SizedBox(height: 16),
            CustomButton(
              text: 'Effacer la recherche',
              onTap: () => controller.updateSearchQuery(''),
              variant: ButtonVariant.Outline,
              width: 160,
            ),
          ],
        ],
      ),
    );
  }
}
