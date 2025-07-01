import '/constants/app_export.dart';
import '/app/project_comparison/controllers/project_comparison_controller.dart';
import '/data/models/project_comparison.dart';

class CompareTab extends StatelessWidget {
  CompareTab({super.key});

  final ProjectComparisonController controller = Get.find<ProjectComparisonController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Instructions
          Text(
            'Sélectionnez jusqu\'à deux candidats et une ou plusieurs thématiques pour comparer leurs propositions.',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
              height: 1.4,
            ),
          ),

          SizedBox(height: 24),

          // Section choix des candidats
          _buildCandidateSelection(),

          SizedBox(height: 32),

          // Section sélection des thématiques
          _buildThemeSelection(),

          SizedBox(height: 32),

          // Bouton de comparaison
          _buildCompareButton(),
        ],
      ),
    );
  }

  Widget _buildCandidateSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choisir les candidats (2 min.)',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildCandidateButton(0),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildCandidateButton(1),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCandidateButton(int index) {
    return Obx(() => GestureDetector(
          onTap: () => _showCandidateSelector(index),
          child: Container(
            height: 60,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadiusStyle.roundedBorder8,
              border: Border.all(
                color: AppColors.greyColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.greyColor,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  controller.getCandidateButtonText(index),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildThemeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sélectionner les thématiques',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),

        SizedBox(height: 16),

        // Grille des thématiques
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: controller.availableThemes.length,
          itemBuilder: (context, index) {
            final theme = controller.availableThemes[index];
            return _buildThemeCheckbox(theme);
          },
        ),
      ],
    );
  }

  Widget _buildThemeCheckbox(ThemeType theme) {
    final projectTheme = ProjectTheme(
      id: theme.name,
      type: theme,
      title: _getThemeDisplayName(theme),
      description: '',
      iconName: _getThemeIcon(theme),
    );

    return Obx(() => GestureDetector(
          onTap: () => controller.toggleThemeSelection(theme),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadiusStyle.roundedBorder8,
              border: Border.all(
                color: AppColors.greyColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                // Checkbox
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: controller.isThemeSelected(theme) ? AppColors.primaryColor : AppColors.whiteColor,
                    borderRadius: BorderRadiusStyle.roundedBorder4,
                    border: Border.all(
                      color: controller.isThemeSelected(theme) ? AppColors.primaryColor : AppColors.greyColor.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: controller.isThemeSelected(theme)
                      ? Icon(
                          Icons.check,
                          color: AppColors.whiteColor,
                          size: 14,
                        )
                      : null,
                ),

                SizedBox(width: 8),

                // Icône de la thématique
                Icon(
                  _getThemeIconData(theme),
                  size: 16,
                  color: AppColors.greyColor,
                ),

                SizedBox(width: 6),

                // Nom de la thématique
                Expanded(
                  child: Text(
                    projectTheme.displayName,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildCompareButton() {
    return SizedBox(
      width: double.infinity,
      child: Obx(() => CustomButton(
            text: 'Comparer les projets',
            onTap: controller.canCompare ? controller.startComparison : null,
            variant: controller.canCompare ? ButtonVariant.Primary : ButtonVariant.Desactived,
            shape: ButtonShape.RoundedBorder12,
            height: 50,
          )),
    );
  }

  void _showCandidateSelector(int index) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choisir un candidat',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ...controller.allProjects.map((project) {
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightGreyColor,
                  ),
                  child: Icon(Icons.person, color: AppColors.greyColor),
                ),
                title: Text(project.candidateName),
                subtitle: Text(project.party),
                trailing: controller.isCandidateSelected(project) ? Icon(Icons.check, color: AppColors.primaryColor) : null,
                onTap: () {
                  controller.toggleCandidateSelection(project);
                  Get.back();
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  String _getThemeDisplayName(ThemeType theme) {
    switch (theme) {
      case ThemeType.education:
        return 'Éducation';
      case ThemeType.sante:
        return 'Santé';
      case ThemeType.economie:
        return 'Économie';
      case ThemeType.securite:
        return 'Sécurité';
      case ThemeType.environnement:
        return 'Environnement';
      case ThemeType.emploi:
        return 'Emploi';
      case ThemeType.logement:
        return 'Logement';
      case ThemeType.transport:
        return 'Transport';
    }
  }

  String _getThemeIcon(ThemeType theme) {
    switch (theme) {
      case ThemeType.education:
        return 'education';
      case ThemeType.sante:
        return 'health';
      case ThemeType.economie:
        return 'economy';
      case ThemeType.securite:
        return 'security';
      case ThemeType.environnement:
        return 'environment';
      case ThemeType.emploi:
        return 'job';
      case ThemeType.logement:
        return 'home';
      case ThemeType.transport:
        return 'transport';
    }
  }

  IconData _getThemeIconData(ThemeType theme) {
    switch (theme) {
      case ThemeType.education:
        return Icons.school;
      case ThemeType.sante:
        return Icons.local_hospital;
      case ThemeType.economie:
        return Icons.trending_up;
      case ThemeType.securite:
        return Icons.security;
      case ThemeType.environnement:
        return Icons.eco;
      case ThemeType.emploi:
        return Icons.work;
      case ThemeType.logement:
        return Icons.home;
      case ThemeType.transport:
        return Icons.directions_bus;
    }
  }
}
