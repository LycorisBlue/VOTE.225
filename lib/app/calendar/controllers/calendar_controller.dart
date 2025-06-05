import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '/data/models/electoral_event.dart';

class CalendarController extends GetxController {
  // Variables réactives pour le calendrier
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<DateTime?> selectedDay = Rx<DateTime?>(null);
  final RxString currentMonth = ''.obs;
  final RxInt currentYear = DateTime.now().year.obs;

  // Variables pour les événements
  final RxList<ElectoralEvent> allEvents = <ElectoralEvent>[].obs;
  final RxList<ElectoralEvent> filteredEvents = <ElectoralEvent>[].obs;
  final RxList<ElectoralEvent> selectedDayEvents = <ElectoralEvent>[].obs;

  // Variables pour les filtres
  final Rx<EventType?> selectedFilter = Rx<EventType?>(null);
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

  @override
  void onInit() {
    super.onInit();
    loadEvents();
    updateCurrentMonth();

    // Écouter les changements de mois focalisé
    ever(focusedDay, (_) => updateCurrentMonth());

    // Écouter les changements de filtre
    ever(selectedFilter, (_) => filterEvents());
  }

  // Charger les événements
  void loadEvents() {
    isLoading.value = true;

    // Simuler un délai de chargement
    Future.delayed(Duration(milliseconds: 500), () {
      allEvents.value = ElectoralEvent.getSampleEvents();
      filteredEvents.value = allEvents;
      isLoading.value = false;
    });
  }

  // Mettre à jour le mois courant affiché
  void updateCurrentMonth() {
    currentMonth.value = '${monthNames[focusedDay.value.month - 1]} ${focusedDay.value.year}';
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
      return isSameDay(event.date, day);
    }).toList();
  }

  // Vérifier si un jour a des événements
  bool hasEventsOnDay(DateTime day) {
    return filteredEvents.any((event) => isSameDay(event.date, day));
  }

  // Obtenir les événements pour un jour (pour le calendrier)
  List<ElectoralEvent> getEventsForCalendar(DateTime day) {
    return filteredEvents.where((event) {
      return isSameDay(event.date, day);
    }).toList();
  }

  // Filtrer les événements par type
  void filterEvents() {
    if (selectedFilter.value == null) {
      filteredEvents.value = allEvents;
      activeFilterName.value = 'Tous';
    } else {
      filteredEvents.value = allEvents.where((event) {
        return event.type == selectedFilter.value;
      }).toList();
      activeFilterName.value = selectedFilter.value!.name;
    }

    // Mettre à jour les événements du jour sélectionné si nécessaire
    if (selectedDay.value != null) {
      getEventsForDay(selectedDay.value!);
    }
  }

  // Changer le filtre
  void changeFilter(EventType? type) {
    selectedFilter.value = type;
  }

  // Filtres prédéfinis
  void showAllEvents() {
    changeFilter(null);
  }

  void showInscriptionEvents() {
    changeFilter(EventType.inscription);
  }

  void showCampaignEvents() {
    changeFilter(EventType.campagne);
  }

  void showScrutinEvents() {
    changeFilter(EventType.scrutin);
  }

  // Retourner à l'écran précédent
  void goBack() {
    Get.back();
  }

  // Rafraîchir les données
  void refreshEvents() {
    loadEvents();
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
}
