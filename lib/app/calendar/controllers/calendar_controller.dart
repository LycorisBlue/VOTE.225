import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '/configs/injectiondepency/injection.dart';
import '/data/models/events.dart';
import '/data/repositories/calendar_repository.dart';
import '/services/networks/apis/api_controller_operation.dart';
import '/data/models/electoral_event.dart';

enum CalendarEvent { initial }

class CalendarController extends GetxController
    with ApiControllerOperationMixin {
  Rx<CalendarEvent> calendarEvent = CalendarEvent.initial.obs;
  final calendarResponse = sl<CalendarRepository>();
  // Variables réactives pour le calendrier
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<DateTime?> selectedDay = Rx<DateTime?>(null);
  final RxString currentMonth = ''.obs;
  final RxInt currentYear = DateTime.now().year.obs;

  // Variables pour les événements
  final RxList<Article> allEvents = <Article>[].obs;
  final RxList<Article> filteredEvents = <Article>[].obs;
  final RxList<Article> selectedDayEvents = <Article>[].obs;

  // Variables pour les filtres
  final Rx<String?> selectedFilter = Rx<String?>(null);
  final RxString activeFilterName = 'Tous'.obs;

  // État de chargement
  final RxBool isLoading = false.obs;

  // Liste des mois en français
  final List<String> monthNames = [
    'Janvier',
    'Février',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Décembre'
  ];

  Rx<Events>? events;

  @override
  void onInit() {
    super.onInit();
    getListCalendars();
    updateCurrentMonth();

    // Écouter les changements de mois focalisé
    ever(focusedDay, (_) => updateCurrentMonth());

    // Écouter les changements de filtre
    ever(selectedFilter, (_) => filterEvents());
    ever(apiStatus, fireState);
  }

  // Mettre à jour le mois courant affiché
  void updateCurrentMonth() {
    currentMonth.value =
        '${monthNames[focusedDay.value.month - 1]} ${focusedDay.value.year}';
    currentYear.value = focusedDay.value.year;
  }

  // Navigation vers le mois précédent
  void goToPreviousMonth() {
    final newDate = DateTime(focusedDay.value.year, focusedDay.value.month - 1);
    focusedDay.value = newDate;
  }

  // Navigation vers le mois suivant
  void goToNextMonth() {
    final newDate = DateTime(focusedDay.value.year, focusedDay.value.month + 1);
    focusedDay.value = newDate;
  }

  // Sélectionner un jour
  void selectDay(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(this.selectedDay.value, selectedDay)) {
      this.selectedDay.value = selectedDay;
      this.focusedDay.value = focusedDay;
      getEventsForDay(selectedDay);
    }
  }

  // Obtenir les événements pour un jour donné
  void getEventsForDay(DateTime day) {
    selectedDayEvents.value = filteredEvents.where((event) {
      return isSameDay(event.dateDebut, day);
    }).toList();
  }

  // Vérifier si un jour a des événements
  bool hasEventsOnDay(DateTime day) {
    return filteredEvents.any((event) => isSameDay(event.dateDebut, day));
  }

  // Obtenir les événements pour un jour (pour le calendrier)
  List<Article> getEventsForCalendar(DateTime day) {
    return filteredEvents.where((event) {
      return isSameDay(event.dateDebut, day);
    }).toList();
  }

  // Filtrer les événements par type
  void filterEvents() {
    if (selectedFilter.value == null) {
      filteredEvents.value = allEvents;
      activeFilterName.value = 'Tous';
    } else {
      filteredEvents.value = allEvents.where((event) {
        return event.categorieEvenement!.titre ==
            selectedFilter.value.toString().capitalizeFirst;
      }).toList();
      activeFilterName.value = selectedFilter.value!;
    }

    // Mettre à jour les événements du jour sélectionné si nécessaire
    if (selectedDay.value != null) {
      getEventsForDay(selectedDay.value!);
    }
  }

  // Changer le filtre
  void changeFilter(String? type) {
    selectedFilter.value = type;
  }

  // Filtres prédéfinis
  void showAllEvents() {
    changeFilter(null);
  }

  void showInscriptionEvents() {
    changeFilter("Inscription");
  }

  void showCampaignEvents() {
    changeFilter("Campagne");
  }

  void showScrutinEvents() {
    changeFilter("Scrutin");
  }

  // Rafraîchir les données
  void refreshEvents() {
    // loadEvents();
  }

  // Aller au mois courant
  void goToCurrentMonth() {
    final now = DateTime.now();
    focusedDay.value = DateTime(now.year, now.month, now.day);
    selectedDay.value = now;
    getEventsForDay(now);
  }

  // Getters utilitaires
  bool get hasSelectedDay => selectedDay.value != null;

  String get selectedDayFormatted {
    if (selectedDay.value == null) return '';
    final day = selectedDay.value!;
    return '${day.day} ${monthNames[day.month - 1]} ${day.year}';
  }

  int get eventsCount => filteredEvents.length;

  int get selectedDayEventsCount => selectedDayEvents.length;

  // Format du calendrier
  CalendarFormat get calendarFormat => CalendarFormat.month;

  StartingDayOfWeek get startingDayOfWeek => StartingDayOfWeek.monday;

  void getListCalendars() {
    requestBaseController(calendarResponse.getCalendars());
  }

  mapEventToState(CalendarEvent event, ApiState state) {
    switch (event) {
      case CalendarEvent.initial:
        switch (state) {
          case ApiState.loading:
            break;

          case ApiState.success:
            if (kDebugMode) {
              print("========ca marche=======");
              print("data: $dataResponse");
            }
            events = eventsFromJson(
                    json.encode(dataResponse["data"]["events_connection"]))
                .obs;
            allEvents.value = events!.value.articles;
            filteredEvents.value = allEvents;
            isLoading.value = false;
            break;
          case ApiState.failure:
            break;
        }
        break;

      default:
    }
  }

  fireState(ApiState calendarApiState) {
    mapEventToState(calendarEvent.value, calendarApiState);
  }
}
