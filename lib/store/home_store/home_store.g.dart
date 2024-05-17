// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
   final _$loadingAtom = Atom(name: '_HomeStore.loading', );

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

   final _$usernameAtom =
      Atom(name: '_HomeStore.username', );

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

   final _$dashboardResponseAtom =
      Atom(name: '_HomeStore.dashboardResponse', );

  @override
  ObservableFuture<DashboardResponse> get dashboardResponse {
    _$dashboardResponseAtom.reportRead();
    return super.dashboardResponse;
  }

  @override
  set dashboardResponse(ObservableFuture<DashboardResponse> value) {
    _$dashboardResponseAtom.reportWrite(value, super.dashboardResponse, () {
      super.dashboardResponse = value;
    });
  }

   final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', );

  @override
  void load(bool load) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.load');
    try {
      return super.load(load);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchUserSecret(BuildContext context, ApiClient api) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.fetchUserSecret');
    try {
      return super.fetchUserSecret(context, api);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
username: ${username},
dashboardResponse: ${dashboardResponse}
    ''';
  }
}

mixin _$HomeErrorStore on _HomeErrorStore, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_HomeErrorStore.hasErrors'))
          .value;

   final _$nameAtom = Atom(name: '_HomeErrorStore.name', );

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

   final _$usernameAtom =
      Atom(name: '_HomeErrorStore.username', );

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

   final _$passwordAtom =
      Atom(name: '_HomeErrorStore.password', );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
username: ${username},
password: ${password},
hasErrors: ${hasErrors}
    ''';
  }
}
