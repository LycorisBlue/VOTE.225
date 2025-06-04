import '/constants/app_export.dart';
import '/app/assistance/controllers/assistance_controller.dart';

class ConversationArea extends StatelessWidget {
  ConversationArea({super.key});
  
  final AssistanceController controller = Get.find<AssistanceController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          // Zone de message utilisateur
          _buildMessageArea(
            isUser: true,
          ),
          
          SizedBox(height: 16),
          
          // Zone de réponse assistant
          _buildMessageArea(
            isUser: false,
            title: 'Réponse de l\'assistant',
          ),
        ],
      ),
    );
  }

  Widget _buildMessageArea({
    required bool isUser,
    String? title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titre pour la réponse de l'assistant
        if (title != null) ...[
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 8),
        ],
        
        // Zone de texte
        Container(
          width: double.infinity,
          height: 80,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Obx(() {
            String text;
            if (isUser) {
              text = controller.userMessage.value.isEmpty 
                  ? controller.conversationPlaceholder.value
                  : controller.userMessage.value;
            } else {
              text = controller.assistantResponse.value.isEmpty 
                  ? controller.responsePlaceholder.value
                  : controller.assistantResponse.value;
            }
            
            return Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: (isUser ? controller.userMessage.value.isEmpty : controller.assistantResponse.value.isEmpty)
                    ? AppColors.greyColor 
                    : AppColors.blackColor,
                fontWeight: FontWeight.w400,
              ),
            );
          }),
        ),
      ],
    );
  }
}