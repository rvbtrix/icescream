import 'package:flutter/material.dart';
import 'package:ice_cream/constants/color_theme.dart';
import 'package:provider/provider.dart';
import 'package:ice_cream/store/debtor_store.dart';

class Debtors extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _debtorStore = Provider.of<DebtorStore>(context);
    _debtorStore.getDebtors();

    return Scaffold(
      backgroundColor: Color(ColorTheme.primaryColor),
    );
  }
}