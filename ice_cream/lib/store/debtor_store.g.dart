// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debtor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DebtorStore on _DebtorStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading =>
      (_$loadingComputed ??= Computed<bool>(() => super.loading)).value;

  final _$fetchDebtorsFutureAtom =
      Atom(name: '_DebtorStoreBase.fetchDebtorsFuture');

  @override
  ObservableFuture<DebtorList> get fetchDebtorsFuture {
    _$fetchDebtorsFutureAtom.context
        .enforceReadPolicy(_$fetchDebtorsFutureAtom);
    _$fetchDebtorsFutureAtom.reportObserved();
    return super.fetchDebtorsFuture;
  }

  @override
  set fetchDebtorsFuture(ObservableFuture<DebtorList> value) {
    _$fetchDebtorsFutureAtom.context.conditionallyRunInAction(() {
      super.fetchDebtorsFuture = value;
      _$fetchDebtorsFutureAtom.reportChanged();
    }, _$fetchDebtorsFutureAtom, name: '${_$fetchDebtorsFutureAtom.name}_set');
  }

  final _$debtorListAtom = Atom(name: '_DebtorStoreBase.debtorList');

  @override
  DebtorList get debtorList {
    _$debtorListAtom.context.enforceReadPolicy(_$debtorListAtom);
    _$debtorListAtom.reportObserved();
    return super.debtorList;
  }

  @override
  set debtorList(DebtorList value) {
    _$debtorListAtom.context.conditionallyRunInAction(() {
      super.debtorList = value;
      _$debtorListAtom.reportChanged();
    }, _$debtorListAtom, name: '${_$debtorListAtom.name}_set');
  }

  final _$successAtom = Atom(name: '_DebtorStoreBase.success');

  @override
  bool get success {
    _$successAtom.context.enforceReadPolicy(_$successAtom);
    _$successAtom.reportObserved();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.context.conditionallyRunInAction(() {
      super.success = value;
      _$successAtom.reportChanged();
    }, _$successAtom, name: '${_$successAtom.name}_set');
  }

  final _$getDebtorsAsyncAction = AsyncAction('getDebtors');

  @override
  Future<dynamic> getDebtors() {
    return _$getDebtorsAsyncAction.run(() => super.getDebtors());
  }
}
