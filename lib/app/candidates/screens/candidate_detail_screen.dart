import '/app/candidates/controllers/candidates_controller.dart';
import '/constants/app_export.dart';
import '/app/candidates/widgets/candidate_detail_banner.dart';
import '/app/candidates/widgets/candidate_info_section.dart';
import '/app/candidates/widgets/political_vision_section.dart';
import '/app/candidates/widgets/program_points_section.dart';

class CandidateDetailScreen extends StatelessWidget {
  CandidateDetailScreen({super.key});

  final controller = Get.find<CandidatesController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: Obx(() {
        // if (!controller.hasCandidate) {
        //   return _buildErrorState();
        // }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bannière avec photo et nom
              CandidateDetailBanner(),
              SizedBox(height: 16),

              // Section informations personnelles
              CandidateInfoSection(),

              // Section vision politique
              PoliticalVisionSection(),

              SizedBox(height: 16),

              // Section points du programme
              ProgramPointsSection(),

              // Espacement pour les actions en bas
              SizedBox(height: 100),
            ],
          ),
        );
      }),
      );
  }

PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: false, // Supprime le bouton retour par défaut
      title: Text(
        'Candidats',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.accentColor, // Orange comme sur la maquette
        ),
      ),
      centerTitle: false,
      actions: [
        // Bouton retour dans un cercle blanc avec bordure noire à droite
        Container(
          margin: EdgeInsets.only(right: 16),
          width: 25,
          height: 25,
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
            onPressed: (){},// => controller.goBack(),
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.greyColor,
          ),
          SizedBox(height: 16),
          Text(
            'Candidat non trouvé',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Les informations du candidat ne sont pas disponibles',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          CustomButton(
            text: 'Retour',
            onTap: (){}, //=> controller.goBack(),
            variant: ButtonVariant.Primary,
            width: 120,
          ),
        ],
      ),
    );
  }
}
