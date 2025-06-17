import '/constants/app_export.dart';
import '/app/disinformation/controllers/disinformation_controller.dart';

class ReportTab extends StatelessWidget {
  ReportTab({super.key});

  final DisinformationController controller = Get.find<DisinformationController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre de la section
            Text(
              'Signalez une information suspecte',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),

            SizedBox(height: 24),

            // Zone de description
            CustomTextFormField(
              controller: controller.descriptionController,
              label: '',
              hintText: 'Décrivez l\'information suspecte...',
              maxLines: 3,
              textInputType: TextInputType.multiline,
              shape: TextFormFieldShape.RoundedBorder12,
              variant: TextFormFieldVariant.Outline,
              validator: controller.validateDescription,
            ),

            SizedBox(height: 24),

            // Section Ajouter une source (zone cliquable)
            _buildSourceSection(),

            SizedBox(height: 24),

            // Dropdown Catégorie
            _buildCategoryDropdown(),

            SizedBox(height: 32),

            // Bouton Envoyer
            SizedBox(
              width: double.infinity,
              child: Obx(() => CustomButton(
                    text: 'Envoyer le signalement',
                    onTap: controller.isLoading.value ? null : controller.submitReport,
                    variant: ButtonVariant.Primary,
                    shape: ButtonShape.RoundedBorder12,
                    height: 50,
                    prefixWidget: controller.isLoading.value
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: AppColors.whiteColor,
                              strokeWidth: 2,
                            ),
                          )
                        : null,
                  )),
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceSection() {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre avec icône
            Row(
              children: [
                Icon(
                  Icons.attach_file,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Ajouter une source',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),

            // Texte descriptif
            Text(
              'Fournir une source (lien, capture d\'écran).',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Obx(() => Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadiusStyle.roundedBorder12,
                border: Border.all(
                  color: AppColors.greyColor.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: controller.selectedCategory.value.isEmpty ? null : controller.selectedCategory.value,
                  hint: Text(
                    'Sélectionner une catégorie',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.greyColor,
                  ),
                  isExpanded: true,
                  items: controller.categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.blackColor,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: controller.changeCategory,
                ),
              ),
            )),
      ],
    );
  }
}
