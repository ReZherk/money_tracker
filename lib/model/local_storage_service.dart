import 'dart:convert';

import 'package:contador/model/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // ignore: prefer_final_fields, non_constant_identifier_names
  String _KeyTransactions = "transactions";

  //Para guardar informacion.
  Future<void> saveTransactions(List<Transaction> transactions) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> transactionsJson =
        transactions
            .map((transaction) => jsonEncode(transaction.toMap()))
            .toList();

    await prefs.setStringList(_KeyTransactions, transactionsJson);
  }

  //Para traer informacion.
  Future<List<Transaction>> loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? transactionsJson = prefs.getStringList(_KeyTransactions);

    if (transactionsJson == null) return [];

    return transactionsJson
        .map((json) => Transaction.fromJson(jsonDecode(json)))
        .toList();
  }

  // Borrar transacciones
  Future<void> clearTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_KeyTransactions);
  }
}
