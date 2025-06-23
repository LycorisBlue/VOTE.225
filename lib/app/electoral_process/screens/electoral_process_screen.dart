import '/constants/app_export.dart';
import '/app/electoral_process/controllers/electoral_process_controller.dart';
import '/app/electoral_process/widgets/process_step_card.dart';

class ElectoralProcessScreen extends StatelessWidget {
  ElectoralProcessScreen({super.key});

  final ElectoralProcessController controller = Get.find<ElectoralProcessController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refreshProcessSteps();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),

              // Liste des étapes du processus
              Obx(() {
                if (controller.isLoading.value) {
                  return _buildLoadingState();
                }

                if (controller.filteredProcessSteps.isEmpty) {
                  return _buildEmptyState();
                }

                return Column(
                  children: controller.filteredProcessSteps.map((step) => ProcessStepCard(processStep: step)).toList(),
                );
              }),

              // Espacement final
              SizedBox(height: 32),
            ],
          ),
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
        'Processus Electoral',
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
          onPressed: () => controller.goBack(),
          padding: EdgeInsets.zero,
        ),
      ),
      centerTitle: false,
      actions: [
        GestureDetector(
          onTap: (){
            MyNavigation.goToCarteElectoral();
          },
          child: Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.all(4),
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.blackColor,
                width: 1,
              ),
            ),
            child:  Center(
              child: Icon(
                  Icons.map,
                  color: AppColors.blackColor,
                  size: 22,
              ),
            ),),
        )
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
              'Chargement du processus électoral...',
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
            Icons.info_outline,
            size: 64,
            color: AppColors.greyColor,
          ),
          SizedBox(height: 16),
          Text(
            'Aucune étape disponible',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Les informations du processus électoral ne sont pas disponibles pour le moment',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          CustomButton(
            text: 'Actualiser',
            onTap: () => controller.refreshProcessSteps(),
            variant: ButtonVariant.Primary,
            width: 120,
          ),
        ],
      ),
    );
  }
}
