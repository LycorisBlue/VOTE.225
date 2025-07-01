import 'package:countries_world_map/countries_world_map.dart';
import '/app/electoral_process/controllers/electoral_process_controller.dart';
import '/app/electoral_process/widgets/region_info_section.dart';
import '/constants/app_export.dart';

class CarteElectoralScreen extends StatelessWidget {
  CarteElectoralScreen({super.key});

  final controller = Get.find<ElectoralProcessController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Carte principale
          Expanded(
            child: Stack(
              // je pour repush
              children: [
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: SimpleMap(
                      instructions: SMapIvoryCoast.instructions,
                      defaultColor: AppColors.accentColor,
                      countryBorder: CountryBorder(
                        color: AppColors.whiteColor,
                        width: 2,
                      ),
                      colors: SMapIvoryCoastColors().toMap(),
                      callback: (id, name, tapdetails) {
                        controller.onRegionTap(name, tapdetails.globalPosition);
                      },
                    ),
                  ),
                ),

                // Tooltip temporaire
                Obx(() {
                  final name = controller.regionName.value;
                  final pos = controller.tapPosition.value;

                  if (name == null || pos == null) return SizedBox.shrink();

                  return Positioned(
                    left: pos.dx,
                    top: pos.dy,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),

          // Section d'informations de région
          Obx(() {
            if (controller.showRegionInfo.value && controller.selectedRegion.value != null) {
              return RegionInfoSection(
                regionInfo: controller.selectedRegion.value!,
                onClose: () => controller.hideRegionInfo(),
              );
            }
            return SizedBox.shrink();
          }),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Carte Electoral',
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
      centerTitle: true,
    );
  }
}
