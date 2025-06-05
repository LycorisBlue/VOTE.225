import '/constants/app_export.dart';
import '/app/glossary/controllers/glossary_controller.dart';

class GlossaryScreen extends StatelessWidget {
  GlossaryScreen({super.key});

  final GlossaryController controller = Get.find<GlossaryController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshGlossary();
        },
        child: Column(
          children: [
            // Barre de recherche
            _buildSearchBar(),

            // Navigation alphabétique
            _buildAlphabetNavigation(),

            // Liste des termes
            Expanded(
              child: _buildTermsList(),
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
        'Glossaire Electoral',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.accentColor, // Orange comme sur la maquette
        ),
      ),
      centerTitle: true,
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
      actions: [
        // Bouton partage
        Container(
          margin: EdgeInsets.only(right: 12),
          child: IconButton(
            icon: Icon(
              Icons.share,
              color: AppColors.blackColor,
              size: 20,
            ),
            onPressed: () => controller.shareGlossary(),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CustomTextFormField(
        hintText: 'Rechercher une analyse..',
        prefix: Icon(
          Icons.search,
          color: AppColors.greyColor,
          size: 20,
        ),
        suffix: Obx(() => controller.hasSearchQuery
            ? GestureDetector(
                onTap: () => controller.clearSearch(),
                child: Icon(
                  Icons.clear,
                  color: AppColors.greyColor,
                  size: 20,
                ),
              )
            : const SizedBox.shrink()) as Widget,
        shape: TextFormFieldShape.RoundedBorder12,
        variant: TextFormFieldVariant.Outline,
        padding: TextFormFieldPadding.PaddingAll8,
        onChange1: (value) => controller.updateSearchQuery(value ?? ''),
      ),
    );
  }

  Widget _buildAlphabetNavigation() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Obx(() => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.alphabet.map((letter) {
                bool isSelected = controller.selectedLetter.value == letter && !controller.hasSearchQuery;
                bool hasTerms = controller.hasTermsForLetter(letter);

                return GestureDetector(
                  onTap: hasTerms ? () => controller.selectLetter(letter) : null,
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryColor
                          : hasTerms
                              ? AppColors.lightGreyColor
                              : AppColors.lightGreyColor.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        letter,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? AppColors.whiteColor
                              : hasTerms
                                  ? AppColors.blackColor
                                  : AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )),
    );
  }

  Widget _buildTermsList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return _buildLoadingState();
      }

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Indicateur de section actuelle
            _buildSectionHeader(),

            // Liste des termes
            if (controller.filteredTerms.isEmpty) _buildEmptyState() else _buildTermsContent(),

            SizedBox(height: 32),
          ],
        ),
      );
    });
  }

  Widget _buildSectionHeader() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Obx(() {
        if (controller.hasSearchQuery) {
          return Text(
            controller.searchResultText,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w500,
            ),
          );
        } else {
          return Text(
            controller.selectedLetter.value,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          );
        }
      }),
    );
  }

  Widget _buildTermsContent() {
    return Column(
      children: controller.filteredTerms.map((term) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadiusStyle.roundedBorder8,
            border: Border.all(
              color: AppColors.lightGreyColor,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre du terme
              Text(
                term.term,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),

              SizedBox(height: 8),

              // Définition
              Text(
                term.definition,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                  height: 1.4,
                ),
              ),
            ],
          ),
        );
      }).toList(),
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
              'Chargement du glossaire...',
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
            Icons.book_outlined,
            size: 64,
            color: AppColors.greyColor,
          ),
          SizedBox(height: 16),
          Obx(() => Text(
                controller.hasSearchQuery
                    ? 'Aucun terme trouvé'
                    : 'Aucun terme pour la lettre ${controller.selectedLetter.value}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyColor,
                ),
              )),
          SizedBox(height: 8),
          Obx(() => Text(
                controller.hasSearchQuery ? 'Essayez avec d\'autres mots-clés' : 'Sélectionnez une autre lettre',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                ),
                textAlign: TextAlign.center,
              )),
          if (controller.hasSearchQuery) ...[
            SizedBox(height: 16),
            CustomButton(
              text: 'Effacer la recherche',
              onTap: () => controller.clearSearch(),
              variant: ButtonVariant.Outline,
              width: 160,
            ),
          ],
        ],
      ),
    );
  }
}
