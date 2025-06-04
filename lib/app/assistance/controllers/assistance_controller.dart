import 'package:get/get.dart';

enum VoiceState { idle, listening, processing }

enum LocalLanguage { francais, baoule, bethe, dioula }

class AssistanceController extends GetxController {
  // Variables réactives
  final RxString userMessage = ''.obs;
  final RxString assistantResponse = ''.obs;
  final Rx<VoiceState> voiceState = VoiceState.idle.obs;
  final Rx<LocalLanguage> selectedLocalLanguage = LocalLanguage.francais.obs;
  final RxString selectedAppLanguage = 'FR'.obs;
  final RxBool isLoading = false.obs;

  // Messages et réponses
  final RxString conversationPlaceholder = 'Votre message apparaîtra ici...'.obs;
  final RxString responsePlaceholder = 'Votre message apparaîtra ici...'.obs;

  // Suggestions prédéfinies
  final List<String> suggestions = [
    'Qui peut voter ?',
    'Où est mon bureau de vote ?',
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialiser les placeholders selon la langue
    updatePlaceholders();
  }

  // Démarrer/arrêter l'écoute vocale
  void toggleVoiceListening() {
    switch (voiceState.value) {
      case VoiceState.idle:
        startListening();
        break;
      case VoiceState.listening:
        stopListening();
        break;
      case VoiceState.processing:
        // Ne rien faire pendant le traitement
        break;
    }
  }

  // Commencer l'écoute
  void startListening() {
    voiceState.value = VoiceState.listening;
    userMessage.value = '';

    // Simuler l'écoute vocale
    Future.delayed(Duration(seconds: 3), () {
      if (voiceState.value == VoiceState.listening) {
        processVoiceInput("Message vocal simulé");
      }
    });
  }

  // Arrêter l'écoute
  void stopListening() {
    voiceState.value = VoiceState.idle;
  }

  // Traiter l'entrée vocale
  void processVoiceInput(String message) {
    voiceState.value = VoiceState.processing;
    userMessage.value = message;

    // Simuler le traitement et générer une réponse
    Future.delayed(Duration(seconds: 2), () {
      generateResponse(message);
      voiceState.value = VoiceState.idle;
    });
  }

  // Utiliser une suggestion
  void useSuggestion(String suggestion) {
    userMessage.value = suggestion;
    voiceState.value = VoiceState.processing;

    Future.delayed(Duration(seconds: 1), () {
      generateResponse(suggestion);
      voiceState.value = VoiceState.idle;
    });
  }

  // Générer une réponse de l'assistant
  void generateResponse(String userQuery) {
    // Réponses simulées selon la question
    if (userQuery.toLowerCase().contains('voter')) {
      assistantResponse.value =
          'Tous les citoyens ivoiriens âgés de 18 ans et plus, inscrits sur les listes électorales, peuvent voter.';
    } else if (userQuery.toLowerCase().contains('bureau')) {
      assistantResponse.value =
          'Vous pouvez vérifier votre bureau de vote sur votre carte d\'électeur ou via le site web de la CEI.';
    } else {
      assistantResponse.value = 'Je suis là pour vous aider avec vos questions électorales. Pouvez-vous être plus précis ?';
    }
  }

  // Changer la langue locale
  void changeLocalLanguage(LocalLanguage language) {
    selectedLocalLanguage.value = language;
    updatePlaceholders();
  }

  // Changer la langue de l'application
  void changeAppLanguage(String language) {
    selectedAppLanguage.value = language;
    updatePlaceholders();
  }

  // Mettre à jour les placeholders selon la langue
  void updatePlaceholders() {
    switch (selectedLocalLanguage.value) {
      case LocalLanguage.francais:
        conversationPlaceholder.value = 'Votre message apparaîtra ici...';
        responsePlaceholder.value = 'Votre message apparaîtra ici...';
        break;
      case LocalLanguage.baoule:
        conversationPlaceholder.value = 'N\'gba kpangban man nin...';
        responsePlaceholder.value = 'N\'gba kpangban man nin...';
        break;
      case LocalLanguage.bethe:
        conversationPlaceholder.value = 'Wo kuma bɛ jɔ yan...';
        responsePlaceholder.value = 'Wo kuma bɛ jɔ yan...';
        break;
      case LocalLanguage.dioula:
        conversationPlaceholder.value = 'I kuma bɛ jɔ yan...';
        responsePlaceholder.value = 'I kuma bɛ jɔ yan...';
        break;
    }
  }

  // Effacer la conversation
  void clearConversation() {
    userMessage.value = '';
    assistantResponse.value = '';
    voiceState.value = VoiceState.idle;
  }

  // Getters pour l'état
  bool get isListening => voiceState.value == VoiceState.listening;
  bool get isProcessing => voiceState.value == VoiceState.processing;
  bool get isIdle => voiceState.value == VoiceState.idle;

  String get voiceButtonText {
    switch (voiceState.value) {
      case VoiceState.idle:
        return 'Appuyez pour parler';
      case VoiceState.listening:
        return 'Écoute en cours...';
      case VoiceState.processing:
        return 'Traitement...';
    }
  }

  String get localLanguageName {
    switch (selectedLocalLanguage.value) {
      case LocalLanguage.francais:
        return 'Français';
      case LocalLanguage.baoule:
        return 'Baoulé';
      case LocalLanguage.bethe:
        return 'Béthé';
      case LocalLanguage.dioula:
        return 'Dioula';
    }
  }
}
