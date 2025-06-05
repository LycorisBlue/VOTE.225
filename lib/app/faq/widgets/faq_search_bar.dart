import '/constants/app_export.dart';
import '/app/faq/controllers/faq_controller.dart';

class FAQSearchBar extends StatelessWidget {
  FAQSearchBar({super.key});

  final FAQController controller = Get.find<FAQController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CustomTextFormField(
        hintText: 'Rechercher une analyse..',
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
}
