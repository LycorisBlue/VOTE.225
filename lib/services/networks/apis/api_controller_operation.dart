import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/services/networks/apis/rest_api_reponse.dart';

/// États possibles de l’appel API
enum ApiState { loading, failure, success }

/// Mixin pour gérer les appels API dans un contrôleur GetX
mixin ApiControllerOperationMixin<T> {
  Rx<ApiState> apiStatus = ApiState.loading.obs;
  Rx<String> errorMessage = "".obs;
  Rx<String> statusCode = "".obs;
  T? dataResponse;

  /// Méthode standard pour gérer une requête REST ou GraphQL avec Dio
  void requestBaseController(
    Future<Either<List<String>, ApiResponse>> apiCallback,
  ) async {
    apiStatus.value = ApiState.loading;

    Either<List<String>, ApiResponse> failureOrSuccess = await apiCallback;

    failureOrSuccess.fold((errorList) {
      errorMessage.value = errorList.first;
      statusCode.value = errorList.length > 1 ? errorList.last : "";
      apiStatus.value = ApiState.failure;

      Get.snackbar(
        "Erreur",
        errorMessage.value,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.error, color: Colors.white),
        duration: const Duration(seconds: 5),
      );
    }, (apiResponse) {
      dataResponse = apiResponse.body;
      apiStatus.value = ApiState.success;
    });
  }
}
