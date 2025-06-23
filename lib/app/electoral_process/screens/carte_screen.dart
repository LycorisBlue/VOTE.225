import 'package:countries_world_map/countries_world_map.dart';
import '/app/electoral_process/controllers/electoral_process_controller.dart';
import '/constants/app_export.dart';

class CarteElectoralScreen extends StatelessWidget {
  CarteElectoralScreen({super.key});

  final controller = Get.find<ElectoralProcessController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: Stack(
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
                colors: SMapIvoryCoastColors(
                        // ciAG: AppColors.primaryColor,
                        // ciBF: AppColors.primaryColor,
                        // ciBS: AppColors.primaryColor,
                        // ciDE: AppColors.primaryColor,
                        // ciDH: AppColors.primaryColor,
                        // ciFR: AppColors.primaryColor,
                        // ciHT: AppColors.primaryColor,
                        // ciLC: AppColors.primaryColor,
                        // ciLG: AppColors.primaryColor,
                        // ciMC: AppColors.primaryColor,
                        // ciMR: AppColors.primaryColor,
                        // ciMV: AppColors.primaryColor,
                        // ciNC: AppColors.primaryColor,
                        // ciSB: AppColors.primaryColor,
                        // ciSC: AppColors.primaryColor,
                        // ciSV: AppColors.primaryColor,
                        // ciVB: AppColors.primaryColor,
                        // ciWR: AppColors.primaryColor,
                        // ciZA: AppColors.primaryColor,
                        )
                    .toMap(),
                // markers: [
                //   SimpleMapMarker(
                //     markerSize: Size(180, 30),
                //     latLong: LatLong(latitude: 9.675724, longitude: -7.416551),
                //     marker: Text(
                //       "Denguélé",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 22.sp,
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(180, 30),
                //     latLong:
                //         LatLong(latitude: 7.569, longitude: -5.555), // Marahoué
                //     marker: Text(
                //       "Marahoué",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 22.sp,
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(180, 30),
                //     latLong:
                //         LatLong(latitude: 5.274, longitude: -4.009), // Abidjan
                //     marker: Text(
                //       "Abidjan",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 22.sp,
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(180, 30),
                //     latLong: LatLong(latitude: 6.653, longitude: -7.509), 
                //     marker: Text(
                //       "Gôh",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 22.sp,
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(160, 24),
                //     latLong: LatLong(latitude: 9.44012, longitude: -5.64258),
                //     marker: Text("Savanes",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22.sp,
                //             fontWeight: FontWeight.bold)),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(160, 24),
                //     latLong: LatLong(
                //         latitude: 6.82,
                //         longitude: -5.28), 
                //     marker: Text("Lacs",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22.sp,
                //             fontWeight: FontWeight.bold)),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(160, 24),
                //     latLong: LatLong(latitude: 5.8827, longitude: -4.2333),
                //     marker: Text("Lagunes",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22.sp,
                //             fontWeight: FontWeight.bold)),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(160, 24),
                //     latLong: LatLong(latitude: 7.4, longitude: -7.55),
                //     marker: Text("Montagnes",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22.sp,
                //             fontWeight: FontWeight.bold)),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(160, 24),
                //     latLong: LatLong(latitude: 4.77, longitude: -6.64),
                //     marker: Text("Bas-Sassandra",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22.sp,
                //             fontWeight: FontWeight.bold)),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(160, 24),
                //     latLong: LatLong(latitude: 6.150, longitude: -5.880),
                //     marker: Text("Gôh-Djiboua",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22.sp,
                //             fontWeight: FontWeight.bold)),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(160, 24),
                //     latLong: LatLong(latitude: 7.69, longitude: -5.03),
                //     marker: Text("Bandama",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22.sp,
                //             fontWeight: FontWeight.bold)),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(160, 24),
                //     latLong: LatLong(latitude: 6.73, longitude: -3.49),
                //     marker: Text("Comoé",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22.sp,
                //             fontWeight: FontWeight.bold)),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(160, 24),
                //     latLong: LatLong(latitude: 8.03, longitude: -2.80),
                //     marker: Text("Zanzan",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22.sp,
                //             fontWeight: FontWeight.bold)),
                //   ),
                //   SimpleMapMarker(
                //     markerSize: Size(160, 24),
                //     latLong: LatLong(latitude: 7.95, longitude: -6.67),
                //     marker: Text("Woroba",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22.sp,
                //             fontWeight: FontWeight.bold)),
                //   ),
                // ],
                callback: (id, name, tapdetails) {
                  controller.onRegionTap(name, tapdetails.globalPosition);
                },
              ),
            ),
          ),
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
