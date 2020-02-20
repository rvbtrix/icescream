import 'package:ice_cream/api/debtor_provider.dart';
import 'package:ice_cream/api/model/debtor_model.dart';
import 'package:mobx/mobx.dart';
part 'debtor_store.g.dart';

class DebtorStore = DebtorStoreBase with _$DebtorStore;

abstract class DebtorStoreBase with Store {
  DebtorApi _debtorApi = DebtorApi();

  Future<List<Debtor>> get getDataDebtorsFromApi =>
      _debtorApi.getDataDebtorsFromApiAsync();
}
