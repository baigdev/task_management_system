class AppAlerts {
  AppAlerts._internal();
  static final AppAlerts _instance = AppAlerts._internal();

  factory AppAlerts() {
    return _instance;
  }
}
