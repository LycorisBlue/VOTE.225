import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '/configs/injectiondepency/injection.dart';
import '/data/repositories/home_repository.dart';
import '/services/networks/apis/api_controller_operation.dart';
import '../../../data/models/events.dart';

enum HomeEvent { initial }

class HomeController extends GetxController with ApiControllerOperationMixin {
  Rx<HomeEvent> homeEvent = HomeEvent.initial.obs;
  final homeResponse = sl<HomeRepository>();
  final RxString selectedLanguage = 'FR'.obs;
   Rx<Events>? events;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // loadNewsArticles();
    getHomeArticle() ;
     ever(apiStatus, fireState);
  }

  // Changer la langue
  void changeLanguage(String language) {
    selectedLanguage.value = language;
  }

  // Charger les articles d'actualités
  void loadNewsArticles() {
    // isLoading.value = true;
    // newsArticles.value = NewsArticle.getSampleArticles();

    // isLoading.value = false;
  }



  // Rafraîchir les actualités
  void refreshNews() {
    loadNewsArticles();
  }

  void getHomeArticle() {
    requestBaseController(homeResponse.getHomeArticle());
  }

  mapEventToState(HomeEvent event, ApiState state) {
    switch (event) {
      case HomeEvent.initial:
        switch (state) {
          case ApiState.loading:
            break;

          case ApiState.success:
            if (kDebugMode) {
              print("========ca marche=======");
              print("data: $dataResponse");
            }
            events = eventsFromJson(json.encode(dataResponse["data"]["events_connection"])).obs;
            break;
          case ApiState.failure:
            break;
        }
        break;

      default:
    }
  }

  fireState(ApiState homeApiState) {
    mapEventToState(homeEvent.value, homeApiState);
  }
}
