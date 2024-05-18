class ApiRoutes {
  static final ApiRoutes _instance = ApiRoutes._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory ApiRoutes() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  ApiRoutes._internal();

  static String kBaseUrl = "";
}
