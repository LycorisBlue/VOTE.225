import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '/services/networks/apis/api_controller_operation.dart';
import '/data/repositories/candidates_repository.dart';
import '/configs/injectiondepency/injection.dart';
import '/data/models/candidate.dart';
import '/configs/routes/navigation.dart';

enum ViewType { grid, list }

enum CandidatesEvent { initial }

class CandidatesController extends GetxController
    with ApiControllerOperationMixin {
  final candidatesResponse = sl<CandidatesRepository>();
  Rx<CandidatesEvent> candidatesEvent = CandidatesEvent.initial.obs;
  Rx<Candidates>? allCandidates;
  final RxList<Candidate> filteredCandidates = <Candidate>[].obs;
  final RxString searchQuery = ''.obs;
  final Rx<ViewType> currentViewType = ViewType.grid.obs;
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getCandidates();
    // ever(searchQuery, (_) => filterCandidates());
    ever(apiStatus, fireState);
  }

  // Basculer entre vue grille et liste
  void toggleViewType(ViewType viewType) {
    currentViewType.value = viewType;
  }

  // Mettre à jour la recherche
  void updateSearchQuery(String query) {
    searchQuery.value = query.toLowerCase();
  }

  // Getter pour savoir si on est en vue grille
  bool get isGridView => currentViewType.value == ViewType.grid;

  // Getter pour savoir si on est en vue liste
  bool get isListView => currentViewType.value == ViewType.list;

  // Getter pour vérifier si on a des données
  bool get hasData => filteredCandidates.isNotEmpty;

  // Getter pour vérifier si on est en état de chargement
  bool get isLoadingData => isLoading.value;

  // Getter pour vérifier si on a une erreur
  bool get hasErrorState => hasError.value;

  void getCandidates() {
    requestBaseController(candidatesResponse.getCandidates());
  }

  mapEventToState(CandidatesEvent event, ApiState state) {
    switch (event) {
      case CandidatesEvent.initial:
        switch (state) {
          case ApiState.loading:
            break;

          case ApiState.success:
            if (kDebugMode) {
              print("========ca marche=======");
              print("data candidates: $dataResponse");
            }
            allCandidates = candidatesFromJson(
                    json.encode(dataResponse["data"]["candidates_connection"]))
                .obs;
            filteredCandidates.value = allCandidates!.value.candidates;
            break;
          case ApiState.failure:
            break;
        }
        break;

      default:
    }
  }

  fireState(ApiState homeApiState) {
    mapEventToState(candidatesEvent.value, homeApiState);
  }
}
