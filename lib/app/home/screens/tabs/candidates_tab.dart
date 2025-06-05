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

              // Barre de recherche (masquée en cas d'erreur)
              Obx(() => !controller.hasErrorState ? _buildSearchBar() : SizedBox()),

              // Toggle de vue (masqué en cas d'erreur)
              Obx(() => !controller.hasErrorState ? ViewToggleWidget() : SizedBox()),

              // Contenu principal avec gestion des états
              Obx(() {
                if (controller.isLoadingData) {
                  return _buildLoadingState();
                }

                if (controller.hasErrorState) {
                  return _buildErrorState();
                }

                if (!controller.hasData) {
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
      child: Row(
        children: [
          Text(
            'Candidats',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.accentColor, // Orange comme sur la maquette
            ),
          ),
          // Indicateur de statut réseau
          Obx(() {
            if (controller.hasErrorState) {
              return Container(
                margin: EdgeInsets.only(left: 8),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.redColor.withOpacity(0.1),
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.wifi_off,
                      size: 14,
                      color: AppColors.redColor,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Hors ligne',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.redColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          }),
        ],
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
      child: Column(
        children: [
          CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          SizedBox(height: 16),
          Text(
            'Chargement des candidats...',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Connexion au serveur en cours',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.cloud_off,
            size: 64,
            color: AppColors.redColor,
          ),
          SizedBox(height: 16),
          Text(
            'Erreur de connexion',
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Obx(() => Text(
                controller.errorMessage.value,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                ),
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Réessayer',
                  onTap: () => controller.retryLoadCandidates(),
                  variant: ButtonVariant.Primary,
                  prefixWidget: Icon(
                    Icons.refresh,
                    color: AppColors.whiteColor,
                    size: 18,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  text: 'Mode hors ligne',
                  onTap: () => controller.loadSampleData(),
                  variant: ButtonVariant.Outline,
                  prefixWidget: Icon(
                    Icons.offline_bolt,
                    color: AppColors.primaryColor,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
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
          SizedBox(height: 16),
          if (controller.searchQuery.value.isNotEmpty) ...[
            CustomButton(
              text: 'Effacer la recherche',
              onTap: () => controller.updateSearchQuery(''),
              variant: ButtonVariant.Outline,
              width: 160,
            ),
          ] else ...[
            CustomButton(
              text: 'Actualiser',
              onTap: () => controller.refreshCandidates(),
              variant: ButtonVariant.Primary,
              width: 120,
            ),
          ],
        ],
      ),
    );
  }
}
