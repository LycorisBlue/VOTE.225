import 'package:firebase_messaging/firebase_messaging.dart';
import '/services/locals/local_storage_service.dart';
import '/data/repositories/auth_repository.dart';
import '/data/repositories/candidates_repository.dart';
import '/constants/app_export.dart';
import '/services/networks/apis/rest_api_service.dart';
import '/services/networks/graphql/graphql_service.dart';

final sl = GetIt.instance;

// firebase instance declaration message
FirebaseMessaging firebasemessaging = FirebaseMessaging.instance;

Future<void> init() async {
  // ============== REPOSITORIES ==============
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );

  // Nouveau repository GraphQL pour les candidats
  sl.registerLazySingleton<CandidatesRepository>(
    () => CandidatesRepositoryImpl(sl<GraphQLService>()),
  );

  //... add other more repository here ....

  // ============== SERVICES ==============

  // Service REST API existant
  sl.registerLazySingleton(() => RestApiServices());

  // Nouveau service GraphQL
  sl.registerLazySingleton(() => GraphQLService());

  // environnements set
  sl.get<RestApiServices>().setEnvironment(EnvironmentType.local);

  // ============== LOCAL STORAGE ==============

  // local storage (share preference) init
  sl.registerFactory<LocalStorageServices>(
    () => LocalStorageServices(),
  );

  await sl<LocalStorageServices>().init();

  // ============== LANGUAGE INIT ==============

  // language init
  if (sl<LocalStorageServices>().getUserSelectedLang != null) {
    Utils.changeLangue(Utils.convertLagueToEnum(sl<LocalStorageServices>().getUserSelectedLang!));
  }

  // ============== FIREBASE CONFIGURATION ==============

/*
  //firebase configuration
  // file configuration in configs/firebase/firebase_option.dart
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //authorization request for notifications
  NotificationSettings settings = await firebasemessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //subscribe To Topic
    //firebasemessaging.subscribeToTopic("topic name");

    // action in resume App
    //FirebaseMessaging.onBackgroundMessage(_function);

    // action inside App
    //FirebaseMessaging.onMessage.listen(_noticationCountInAPP);

    // action to outside notification
    //FirebaseMessaging.onMessageOpenedApp.listen(_function);
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    if (kDebugMode) {
      print('autorisation provisoire');
    }
  } else {
    if (kDebugMode) {
      print("L'utilisateur n'a pas accepté l'autorisation");
    }
  }*/
}
