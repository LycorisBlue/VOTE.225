import '/constants/app_export.dart';
import '/app/faq/controllers/faq_controller.dart';
import '/data/models/faq_item.dart';

class FAQItemCard extends StatelessWidget {
  final FAQItem faqItem;

  const FAQItemCard({
    super.key,
    required this.faqItem,
  });

  @override
  Widget build(BuildContext context) {
    final FAQController controller = Get.find<FAQController>();

    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusStyle.roundedBorder8,
        border: Border.all(
          color: AppColors.lightGreyColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // En-tête avec question et flèche
          GestureDetector(
            onTap: () => controller.toggleItemExpansion(faqItem.id),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  // Question
                  Expanded(
                    child: Text(
                      faqItem.question,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  // Flèche d'expansion/réduction
                  Obx(() => AnimatedRotation(
                        turns: controller.isItemExpanded(faqItem.id) ? 0.5 : 0.0,
                        duration: Duration(milliseconds: 200),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.blackColor,
                          size: 24,
                        ),
                      )),
                ],
              ),
            ),
          ),

          // Contenu de la réponse (accordéon)
          Obx(() => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: controller.isItemExpanded(faqItem.id) ? null : 0,
                child: controller.isItemExpanded(faqItem.id) ? _buildAnswerContent() : SizedBox.shrink(),
              )),
        ],
      ),
    );
  }

  Widget _buildAnswerContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ligne de séparation
          Container(
            height: 1,
            color: AppColors.lightGreyColor,
            margin: EdgeInsets.only(bottom: 16),
          ),

          // Texte de la réponse
          _buildFormattedAnswer(),

          // Lien si disponible
          if (faqItem.hasLink && faqItem.linkUrl != null) ...[
            SizedBox(height: 8),
            _buildLinkWidget(),
          ],

          // Tags de catégorie si disponibles
          if (faqItem.tags != null && faqItem.tags!.isNotEmpty) ...[
            SizedBox(height: 12),
            _buildTagsWidget(),
          ],
        ],
      ),
    );
  }

  Widget _buildFormattedAnswer() {
    // Diviser le texte en paragraphes et formater
    List<String> paragraphs = faqItem.answer.split('\n\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paragraphs.map((paragraph) {
        if (paragraph.trim().isEmpty) return SizedBox.shrink();

        // Vérifier si c'est une liste à puces
        if (paragraph.contains('•')) {
          return _buildBulletList(paragraph);
        }

        // Paragraphe normal
        return Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            paragraph.trim(),
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.blackColor,
              height: 1.5,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBulletList(String listText) {
    List<String> items = listText.split('•').where((item) => item.trim().isNotEmpty).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: EdgeInsets.only(bottom: 4, left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• ',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  item.trim(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLinkWidget() {
    final FAQController controller = Get.find<FAQController>();

    return GestureDetector(
      onTap: () => controller.openLink(faqItem.linkUrl!),
      child: Text(
        faqItem.linkText ?? faqItem.linkUrl!,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.primaryColor,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTagsWidget() {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: faqItem.tags!.map((tag) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadiusStyle.roundedBorder6,
          ),
          child: Text(
            tag,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}
