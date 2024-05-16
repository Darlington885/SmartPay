import 'package:mobx/mobx.dart';

import '../../screens/services/auth_storage.dart';


part 'auth_store.g.dart';

class AuthStore extends _AuthStore with _$AuthStore {}

abstract class _AuthStore with Store {

  @observable
  bool onboarded = false;

  @observable
  String loginPin;

  @observable
  String loginPassword;

  @observable
  String loginUsername;

  @observable
  String countryCode;

  @observable
  String loginToken;

  @observable
  String loginEmail;

  @observable
  String profileName;

  @observable
  bool isSecurityEnable = false;

  @observable
  String profilePicture;

  List<ReactionDisposer> _disposers;

  /// This method helps persist the auth store in the device secure storage.
  /// Each observable field or property are tracked such that when the value is
  /// changed across the app, it triggers the reaction function which first
  /// serializies the store with the help of `JsonMapper.serialize(object)` lib
  /// then calls the `Storage.storeUser(str)` where the serialized string is passed.
  ///
  /// Be sure to recreate this process whenever a new observable field or property
  /// is added.

  void persistAuth() async{
    onboarded = await AuthStorage().getBoolData("onboarded");
    profilePicture = await AuthStorage().getStringData("profile_picture");
    isSecurityEnable = await AuthStorage().getBoolData("isSecurityEnable");
    loginUsername = await AuthStorage().getStringData("loginUsername");
    loginPassword = await AuthStorage().getStringData("loginPassword");
    loginPin = await AuthStorage().getStringData("loginPin");
    loginEmail = await AuthStorage().getStringData("loginEmail");
    loginToken = await AuthStorage().getStringData("loginToken");

  }

  /// Call this method to clear all listeners and trackers.
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

}