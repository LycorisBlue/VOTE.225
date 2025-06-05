import '/constants/app_export.dart';
import '/app/faq/controllers/faq_controller.dart';
import '/app/faq/widgets/faq_item_card.dart';

class FAQList extends StatelessWidget {
  FAQList({super.key});

  final FAQController controller = Get.find<FAQController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        if (controller.isLoading.value) {
          return _buildLoadingState();
        }

        if (controller.filteredFAQItems.isEmpty) {
          return _buildEmptyState();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Résultats de recherche
            _buildSearchResults(),

            SizedBox(height: 16),

            // Liste des questions FAQ
            ...controller.filteredFAQItems.map((faqItem) => FAQItemCard(faqItem: faqItem)).toList(),
          ],
        );
      }),
    );
  }

  Widget _buildSearchResults() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Texte des résultats
        Expanded(
          child: Text(
            controller.searchResultText,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Boutons d'action si des filtres sont appliqués
        if (controller.hasFiltersApplied) ...[
          SizedBox(width: 8),
          Row(
            children: [
              // Bouton pour étendre/réduire tous
              if (controller.filteredFAQItems.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    if (controller.expandedItemsCount == controller.filteredFAQItemsCount) {
                      controller.collapseAllItems();
                    } else {
                      controller.expandAllItems();
                    }
                  },
                  child: Text(
                    controller.expandedItemsCount == controller.filteredFAQItemsCount ? 'Réduire tout' : 'Étendre tout',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              SizedBox(width: 12),

              // Bouton pour effacer les filtres
              GestureDetector(
                onTap: () => controller.clearAllFilters(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius: BorderRadiusStyle.roundedBorder6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Effacer',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.clear,
                        size: 14,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildLoadingState() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 16),
            Text(
              'Chargement des questions...',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.greyColor,
              ),
            ),
          ],
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
            Icons.help_outline,
            size: 64,
            color: AppColors.greyColor,
          ),
          SizedBox(height: 16),
          Text(
            'Aucune question trouvée',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            controller.hasSearchQuery || controller.hasActiveFilter
                ? 'Essayez avec d\'autres mots-clés ou modifiez vos filtres'
                : 'Aucune question disponible pour le moment',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
            ),
            textAlign: TextAlign.center,
          ),
          if (controller.hasFiltersApplied) ...[
            SizedBox(height: 16),
            CustomButton(
              text: 'Effacer les filtres',
              onTap: () => controller.clearAllFilters(),
              variant: ButtonVariant.Outline,
              width: 150,
            ),
          ],
          SizedBox(height: 12),
          CustomButton(
            text: 'Actualiser',
            onTap: () => controller.refreshFAQItems(),
            variant: ButtonVariant.Primary,
            width: 120,
          ),
        ],
      ),
    );
  }
}
