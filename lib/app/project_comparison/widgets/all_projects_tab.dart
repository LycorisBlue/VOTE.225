import '/constants/app_export.dart';
import '/app/project_comparison/controllers/project_comparison_controller.dart';
import '/data/models/project_comparison.dart';

class AllProjectsTab extends StatelessWidget {
  AllProjectsTab({super.key});

  final ProjectComparisonController controller = Get.find<ProjectComparisonController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return _buildLoadingState();
      }

      if (controller.allProjects.isEmpty) {
        return _buildEmptyState();
      }

      return ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: controller.allProjects.length,
        itemBuilder: (context, index) {
          final project = controller.allProjects[index];
          return _buildProjectCard(project);
        },
      );
    });
  }

  Widget _buildProjectCard(CandidateProject project) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusStyle.roundedBorder12,
        border: Border.all(
          color: AppColors.greyColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Photo du candidat
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGreyColor,
            ),
            child: ClipOval(
              child: project.imageUrl != null
                  ? CustomImageView(
                      url: project.imageUrl!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.person,
                      size: 30,
                      color: AppColors.greyColor,
                    ),
            ),
          ),

          SizedBox(width: 12),

          // Contenu du projet
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nom du candidat
                Text(
                  project.candidateName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),

                SizedBox(height: 4),

                // Parti politique
                Text(
                  project.party,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 8),

                // Description du projet
                Text(
                  project.globalDescription,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 12),

                // Bouton "Voir le projet"
                GestureDetector(
                  onTap: () => controller.goToProjectDetail(project),
                  child: Row(
                    children: [
                      Text(
                        'Voir le projet',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primaryColor,
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
              'Chargement des projets...',
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
            Icons.folder_open,
            size: 64,
            color: AppColors.greyColor,
          ),
          SizedBox(height: 16),
          Text(
            'Aucun projet disponible',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Les projets des candidats ne sont pas encore disponibles',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
