import '/constants/app_export.dart';
import '/data/models/project_comparison.dart';

class ComparisonResultsScreen extends StatelessWidget {
  const ComparisonResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupérer les données de comparaison passées en argument
    final ProjectComparison comparison = Get.arguments as ProjectComparison;

    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

            // Sélecteurs de candidats en haut
            _buildCandidateSelectors(comparison.candidates),

            SizedBox(height: 24),

            // Comparaison par thématiques
            ...comparison.getCommonThemes().map((theme) => _buildThemeComparison(theme, comparison.candidates)).toList(),

            // Espacement final
            SizedBox(height: 32),
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
        'Résultats Comparaison',
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
          onPressed: () => Get.back(),
          padding: EdgeInsets.zero,
        ),
      ),
      centerTitle: false,
    );
  }

  Widget _buildCandidateSelectors(List<CandidateProject> candidates) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: candidates
            .map((candidate) => Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: candidates.last == candidate ? 0 : 8),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreyColor,
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                      border: Border.all(
                        color: AppColors.greyColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 16,
                          color: AppColors.greyColor,
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            candidate.candidateName.split(' ')[0], // Prénom seulement
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildThemeComparison(ThemeType theme, List<CandidateProject> candidates) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de la thématique
          Text(
            _getThemeDisplayName(theme),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),

          SizedBox(height: 16),

          // Positions des candidats
          ...candidates.map((candidate) => _buildCandidatePosition(candidate, theme)).toList(),
        ],
      ),
    );
  }

  Widget _buildCandidatePosition(CandidateProject candidate, ThemeType theme) {
    final position = candidate.getPositionForTheme(theme);

    if (position == null) {
      return SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nom du candidat
          Text(
            candidate.candidateName,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),

          SizedBox(height: 8),

          // Position du candidat
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Text(
              position.content,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
                height: 1.5,
              ),
            ),
          ),
        ],
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
}
