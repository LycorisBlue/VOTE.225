import '/constants/app_export.dart';
import '/app/assistance/controllers/assistance_controller.dart';
import '/app/assistance/widgets/assistance_header.dart';
import '/app/assistance/widgets/conversation_area.dart';
import '/app/assistance/widgets/voice_button.dart';
import '/app/assistance/widgets/suggestions_section.dart';
import '/app/assistance/widgets/language_selector.dart';

class AssistanceTab extends StatelessWidget {
  AssistanceTab({super.key});

  final AssistanceController controller = Get.find<AssistanceController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header avec titre et sélecteur de langue
            AssistanceHeader(),

            SizedBox(height: 8),

            // Zone de conversation
            ConversationArea(),

            // Bouton vocal central
            Center(child: VoiceButton()),

            // Section des suggestions
            SuggestionsSection(),

            SizedBox(height: 24),

            // Sélecteur de langues locales
            LanguageSelector(),

            // Espacement pour la bottom navigation
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
