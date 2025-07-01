import '/constants/app_export.dart';
import '/app/carte_bureaux/controllers/carte_bureaux_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class CarteBureauxScreen extends StatelessWidget {
  CarteBureauxScreen({super.key});

  final CarteBureauxController controller = Get.find<CarteBureauxController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return _buildLoadingState();
        }

        if (controller.hasError.value) {
          return _buildErrorState();
        }

        return Stack(
          children: [
            // Carte en arrière-plan
            _buildMapSection(),

            // Barre de recherche en overlay
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: _buildSearchBar(),
            ),

            // Card d'information du bureau sélectionné en bas
            if (controller.hasSelectedBureau)
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: _buildBureauInfoCard(),
              ),
          ],
        );
      }),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Carte de Bureaux',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.accentColor, // Orange
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
        Container(
          margin: EdgeInsets.only(right: 16),
          child: IconButton(
            icon: Icon(
              Icons.more_vert,
              color: AppColors.blackColor,
              size: 24,
            ),
            onPressed: () {
              // Action pour le menu 3 points
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusStyle.roundedBorder12,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: CustomTextFormField(
        hintText: 'Rechercher un Bureaux',
        prefix: Icon(
          Icons.search,
          color: AppColors.greyColor,
          size: 20,
        ),
        suffix: Obx(() => controller.hasSearchQuery
            ? GestureDetector(
                onTap: () => controller.clearSearch(),
                child: Icon(
                  Icons.clear,
                  color: AppColors.greyColor,
                  size: 20,
                ),
              )
            : const SizedBox.shrink()),
        shape: TextFormFieldShape.RoundedBorder12,
        variant: TextFormFieldVariant.Outline,
        padding: TextFormFieldPadding.PaddingAll8,
        onChange1: (value) => controller.updateSearchQuery(value ?? ''),
      ),
    );
  }


Widget _buildMapSection() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Obx(() => FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(5.3364, -4.0267), // Coordonnées d'Abidjan
              initialZoom: 12.0,
              onTap: (tapPosition, point) {
                // Optionnel : gérer les taps sur la carte
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
                maxZoom: 19,
              ),
              MarkerLayer(
                markers: controller.filteredBureaux.map((bureau) {
                  bool isSelected = controller.selectedBureau.value?.id == bureau.id;
                  return Marker(
                    point: LatLng(bureau.latitude, bureau.longitude),
                    width: 32,
                    height: 32,
                    child: GestureDetector(
                      onTap: () => controller.selectBureau(bureau),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : AppColors.accentColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: AppColors.whiteColor,
                          size: 18,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          )),
    );
  }


  Widget _buildBureauInfoCard() {
    return Obx(() {
      final bureau = controller.selectedBureau.value;
      if (bureau == null) return SizedBox.shrink();

      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadiusStyle.roundedBorder12,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nom du bureau
            Text(
              bureau.nom,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),

            SizedBox(height: 8),

            // Adresse
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.greyColor,
                  size: 16,
                ),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    bureau.adresseComplete,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),

            // Horaires
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: AppColors.greyColor,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text(
                  bureau.horaires,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Bouton Itinéraire
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Itinéraire',
                onTap: () => controller.openItinerary(),
                variant: ButtonVariant.Primary,
                shape: ButtonShape.RoundedBorder12,
                height: 48,
                prefixWidget: Icon(
                  Icons.directions,
                  color: AppColors.whiteColor,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildLoadingState() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 16),
            Text(
              'Chargement des bureaux de vote...',
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

  Widget _buildErrorState() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.redColor,
            ),
            SizedBox(height: 16),
            Text(
              'Erreur de chargement',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.redColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              controller.errorMessage.value,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.greyColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Réessayer',
              onTap: () => controller.refreshBureaux(),
              variant: ButtonVariant.Primary,
              width: 120,
            ),
          ],
        ),
      ),
    );
  }
}
