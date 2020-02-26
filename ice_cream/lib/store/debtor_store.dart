import 'package:ice_cream/data/debtor_repository.dart';
import 'package:ice_cream/models/debtor_list.dart';
import 'package:ice_cream/store/error/error_store.dart';
import 'package:ice_cream/utils/dio_error_util.dart';
import 'package:mobx/mobx.dart';
part 'debtor_store.g.dart';

class DebtorStore = _DebtorStoreBase with _$DebtorStore;

abstract class _DebtorStoreBase with Store {
  // repository instance
  DebtorRepository repository = new DebtorRepository();

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // store variables:-----------------------------------------------------------
  static ObservableFuture<DebtorList> emptyDebtorResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<DebtorList> fetchDebtorsFuture =
      ObservableFuture<DebtorList>(emptyDebtorResponse);

  @observable
  DebtorList debtorList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchDebtorsFuture.status == FutureStatus.pending;

   // actions:-------------------------------------------------------------------
  @action
  Future getDebtors() async {
    final future = repository.getDataDebtorsFromApiAsync();
    fetchDebtorsFuture = ObservableFuture(future);

    future.then((debtorList) {
      this.debtorList = debtorList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
    print(debtorList);
  }

  // Future<List<Debtor>> get getDataDebtorsFromApi =>
  //     _repository.getDataDebtorsFromApiAsync();
}
