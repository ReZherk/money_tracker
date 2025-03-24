import 'package:contador/model/local_storage_service.dart';
import 'package:contador/model/transaction.dart';
import 'package:flutter/cupertino.dart';

class TransactionProvider extends ChangeNotifier {
  TransactionProvider() {
    _loadData();
  }

  final List<Transaction> _transactions = [
    /*Transaction(
      type: TransactionType.income,
      amount: 1000.00,
      description: 'Salary',
    ),
    Transaction(
      type: TransactionType.expense,
      amount: -500.00,
      description: 'Rent',
    ),*/
  ];

  //Instancia de local_storage_service.
  final LocalStorageService _storageService = LocalStorageService();

  //Cargando Guardar.
  Future<void> _saveData() async {
    await _storageService.saveTransactions(_transactions);
  }

  //Cargando Transacciones.
  Future<void> _loadData() async {
    List<Transaction> loadedTransactions =
        await _storageService.loadTransactions();

    _transactions.addAll(loadedTransactions);
    notifyListeners();
  }

  List<Transaction> get transactions => _transactions;

  double getTotalIncomes() {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .map((transaction) => transaction.amount)
        .fold(0, (a, b) => a + b);
  }

  double getTotalExpenses() {
    return _transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .map((transaction) => transaction.amount)
        .fold(0, (a, b) => a + b);
  }

  double getBalance() {
    return getTotalIncomes() + getTotalExpenses();
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    _saveData();
    notifyListeners();
  }
}
