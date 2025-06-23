import '/constants/app_export.dart';
import '/app/electoral_process/widgets/detail_section_widget.dart';

class ElectoralProcessDetailScreen extends StatelessWidget {
  const ElectoralProcessDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

            // Titre principal
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Inscription sur la liste électorale',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
            ),

            SizedBox(height: 12),

            // Paragraphe d'introduction
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Pour voter en Côte d\'Ivoire, vous devez être inscrit sur la liste électorale. Voici les conditions et étapes à suivre.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.greyColor,
                  height: 1.5,
                ),
              ),
            ),

            SizedBox(height: 24),

            // Section "Qui peut s'inscrire ?"
            DetailSectionWidget(
              title: 'Qui peut s\'inscrire ?',
              icon: Icons.person,
              items: [
                'Être de nationalité ivoirienne',
                'Avoir 18 ans révolus au moment du scrutin',
                'Être en possession de ses droits civils et politiques',
              ],
              showCheckmarks: true,
            ),

            // Section "Documents requis"
            DetailSectionWidget(
              title: 'Documents requis',
              icon: Icons.description,
              items: [
                'Carte Nationale d\'Identité (CNI)',
                'Récépissé de demande de CNI',
                'Certificat de nationalité',
                'Extrait d\'acte de naissance ou jugement supplétif',
              ],
              showCheckmarks: true,
            ),

            // Section "Où s'inscrire ?"
            DetailSectionWidget(
              title: 'Où s\'inscrire ?',
              icon: Icons.location_on,
              items: [
                'Dans un centre d\'enrôlement proche de votre lieu de résidence. Les centres sont répartis sur toute l\'étendue du territoire ivoirien.',
              ],
              showCheckmarks: false,
            ),

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
        'Inscription électorale',
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
          onPressed: () => Get.back(),
          padding: EdgeInsets.zero,
        ),
      ),
      centerTitle: false,
    );
  }
}
