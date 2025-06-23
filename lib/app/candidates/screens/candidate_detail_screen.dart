import '/data/models/candidate.dart';
import '/app/candidates/controllers/candidates_controller.dart';
import '/constants/app_export.dart';
import '/app/candidates/widgets/candidate_detail_banner.dart';
import '/app/candidates/widgets/candidate_info_section.dart';
import '/app/candidates/widgets/political_vision_section.dart';
import '/app/candidates/widgets/program_points_section.dart';

class CandidateDetailScreen extends StatelessWidget {
  CandidateDetailScreen({super.key});

  final controller = Get.find<CandidatesController>();
  final candidate = Get.arguments as Candidate;

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CandidateDetailBanner(
                nom: candidate.displayName,
                politicalPartiesNom: candidate.politicalParties.name,

              ),
              SizedBox(height: 16),
              CandidateInfoSection(
                age: candidate.age,
                experience: candidate.workExperience,
                fonction: candidate.workTitle,
                ville: candidate.city,
              ),
              PoliticalVisionSection(politicalVisions:  candidate.politicalVisions,),
              SizedBox(height: 16),
              ProgramPointsSection( pointCles: candidate.planKeyPoints,),

              SizedBox(height: 100),
            ],
          ),
        ));
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
            onPressed: () => Get.back(),
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}
