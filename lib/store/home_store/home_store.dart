

import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:smartpay/classes/response_data.dart';
import 'package:smartpay/models/dashboard_response.dart';
import 'package:smartpay/screens/services/api_client.dart';
import 'package:validators/validators.dart';

part 'home_store.g.dart';

class HomeStore extends _HomeStore with _$HomeStore {}

abstract class _HomeStore with Store {
  final HomeErrorStore error = HomeErrorStore();
  var localAuth = LocalAuthentication();

  @observable
  bool loading = false;


  @observable
  String username;

  @action
  void load(bool load) {
    loading = load;
  }


  List<ReactionDisposer> _disposers;

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

@observable
  ObservableFuture<DashboardResponse> dashboardResponse = ObservableFuture.value(DashboardResponse());

  @action
  fetchUserSecret(BuildContext context, ApiClient api) {
    try {
      dashboardResponse = ObservableFuture(api.getSecret(context).then(
            (res) {
          ResponseData.dashboardResponse = res;
          return res;
        },

      ));
    } catch (e) {
      print(e);
    }
  }
}

class HomeErrorStore = _HomeErrorStore with _$HomeErrorStore;

abstract class _HomeErrorStore with Store {

  @observable
  String name;

  @observable
  String username;

  @observable
  String password;

  @computed
  bool get hasErrors => name != null || username != null;

}