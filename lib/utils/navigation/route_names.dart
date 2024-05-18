class NavigationRouteNames {
  static final NavigationRouteNames _instance =
      NavigationRouteNames._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory NavigationRouteNames() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  NavigationRouteNames._internal();
  static const String initialRoute = '/splash';
  static const String home = '/home';
  static const String addTask = '/add-task';
  static const String editTask = '/edit-task';
  static const String pendingTasks = '/pending-tasks';
}
