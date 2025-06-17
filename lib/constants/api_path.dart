class ApiPath {
  static const String baseUrlDev = "https://api-dev-dot-v225vote.wl.r.appspot.com/"; // Dev
  static const String baseUrlProd = "https://api-dev-dot-v225vote.wl.r.appspot.com/"; // Prod
  static const String baseUrlLocal = "https://dummyjson.com/"; // local ou test
  static const String baseUrlImage = "http://"; // base image url

  // time for requests
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;

  // lien Api
  static const String login = 'auth/login';
  static const String signup = 'signup';
}
