import 'package:ice_cream/models/debtor_model.dart';

class DebtorList {
  final List<Debtor> debtors;

  DebtorList({
    this.debtors,
  });

  factory DebtorList.fromJson(List<dynamic> json) {
    List<Debtor> debtors = List<Debtor>();
    debtors = json.map((debtor) => Debtor.fromJson(debtor)).toList();

    return DebtorList(
      debtors: debtors,
    );
  }
}