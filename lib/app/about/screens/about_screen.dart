import '/constants/app_export.dart';
import '/app/about/controllers/about_controller.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final AboutController controller = Get.find<AboutController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),

              // Section logo avec bulle
              _buildLogoSection(),

              SizedBox(height: 48),

              // Description de l'application
              _buildAppDescription(),

              SizedBox(height: 24),

              // Liste des fonctionnalités
              _buildFeaturesList(),

              SizedBox(height: 32),

              // Section objectif
              _buildObjectiveSection(),

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
        'À propos',
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
      centerTitle: true,
    );
  }

  Widget _buildLogoSection() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Bulle de dialogue orange avec "225"
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.accentColor, // Orange
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Text(
              '225',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
          ),

          SizedBox(width: 8),

          // Texte "225 VOTES" en vert
          Text(
            '225\nVOTES',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor, // Vert
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppDescription() {
    return Text(
      controller.appDescription,
      style: TextStyle(
        fontSize: 16.sp,
        color: AppColors.blackColor,
        height: 1.5,
      ),
    );
  }

  Widget _buildFeaturesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: controller.features.map((feature) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Puce
              Container(
                margin: EdgeInsets.only(top: 6),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  shape: BoxShape.circle,
                ),
              ),

              SizedBox(width: 12),

              // Texte de la fonctionnalité
              Expanded(
                child: Text(
                  feature,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.blackColor,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildObjectiveSection() {
    return Text(
      controller.objective,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
        height: 1.5,
      ),
    );
  }
}
