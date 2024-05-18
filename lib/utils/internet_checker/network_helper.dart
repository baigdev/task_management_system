import 'package:connectivity_plus/connectivity_plus.dart';

import '../constant/app_snackbar.dart';
import '../navigation/go_router_navigation_delegate.dart';
import 'network_bloc.dart';
import 'network_event.dart';
import 'network_state.dart';

class NetworkHelper {
  static void observeNetwork(NetworkState state) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        if (GoRouterNavigationDelegate().parentNavigationKey.currentContext !=
            null) {
          AppSnackBar().showErrorSnackBar(
              context: GoRouterNavigationDelegate()
                  .parentNavigationKey
                  .currentContext!,
              error:
                  "It seems that your device is not connected to the network.Please check your internet connectivity or try again later.");
        }
        NetworkBloc().add(NetworkNotify());
      } else {
        if (GoRouterNavigationDelegate().parentNavigationKey.currentContext !=
            null) {
          if (state is! NetworkInitial) {
            AppSnackBar().showSuccessSnackBar(
                context: GoRouterNavigationDelegate()
                    .parentNavigationKey
                    .currentContext!,
                successMsg: "Internet connection has been restored!");
          }
        }
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}
