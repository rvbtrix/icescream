// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icecreamapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IceCreamApiStore on _IceCreamApiStoreBase, Store {
  final _$loginAtom = Atom(name: '_IceCreamApiStoreBase.login');

  @override
  Login get login {
    _$loginAtom.context.enforceReadPolicy(_$loginAtom);
    _$loginAtom.reportObserved();
    return super.login;
  }

  @override
  set login(Login value) {
    _$loginAtom.context.conditionallyRunInAction(() {
      super.login = value;
      _$loginAtom.reportChanged();
    }, _$loginAtom, name: '${_$loginAtom.name}_set');
  }

  final _$_IceCreamApiStoreBaseActionController =
      ActionController(name: '_IceCreamApiStoreBase');

  @override
  dynamic fetchLogin() {
    final _$actionInfo = _$_IceCreamApiStoreBaseActionController.startAction();
    try {
      return super.fetchLogin();
    } finally {
      _$_IceCreamApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
