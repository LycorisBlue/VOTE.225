import 'package:get/get.dart';
import '/data/models/candidate.dart';

class CandidateDetailController extends GetxController {
  // Variables réactives
  final Rx<Candidate?> candidate = Rx<Candidate?>(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Récupérer le candidat passé en argument
    if (Get.arguments != null && Get.arguments is Candidate) {
      candidate.value = Get.arguments as Candidate;
    }
  }

  // Retourner à la liste des candidats
  void goBack() {
    Get.back();
  }

  // Getters pour faciliter l'accès aux données
  String get candidateName => candidate.value?.fullName ?? '';
  String get candidateParty => candidate.value?.party ?? '';
  String get candidateAge => candidate.value != null ? '${candidate.value!.age} ans' : '';
  String get candidateStatus => candidate.value?.status ?? '';
  String get candidateLocation => candidate.value?.fullLocation ?? '';
  String get candidateExperience => candidate.value?.formattedExperience ?? '';
  String get candidateFunction => candidate.value?.currentFunction ?? '';
  List<String> get politicalVision => candidate.value?.politicalVision ?? [];
  List<ProgramPoint> get programPoints => candidate.value?.programPoints ?? [];
  String get candidateImage => candidate.value?.imagePath ?? '';

  // Vérifier si les données sont disponibles
  bool get hasCandidate => candidate.value != null;
}
