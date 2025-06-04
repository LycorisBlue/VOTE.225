import '/constants/app_export.dart';
import '/app/assistance/controllers/assistance_controller.dart';

class VoiceButton extends StatelessWidget {
  VoiceButton({super.key});

  final AssistanceController controller = Get.find<AssistanceController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          // Bouton vocal principal
          Obx(() => GestureDetector(
                onTap: () => controller.toggleVoiceListening(),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: controller.isListening ? AppColors.primaryColor.withOpacity(0.8) : AppColors.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        blurRadius: controller.isListening ? 20 : 10,
                        spreadRadius: controller.isListening ? 5 : 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Animation de pulse quand en écoute
                      if (controller.isListening)
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.whiteColor.withOpacity(0.5),
                              width: 2,
                            ),
                          ),
                        ),

                      // Icône microphone
                      Icon(
                        controller.isProcessing ? Icons.hourglass_empty : Icons.mic,
                        size: 48,
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                ),
              )),

          SizedBox(height: 16),

          // Texte indicatif
          Obx(() => Text(
                controller.voiceButtonText,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
