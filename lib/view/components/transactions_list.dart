import 'package:contador/controller/transaction_provider.dart';
import 'package:contador/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    final transactions = provider.transactions;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final type =
                transaction.type == TransactionType.income
                    ? 'Income'
                    : 'Expense';
            final value =
                transaction.type == TransactionType.expense
                    ? '-\$ ${transaction.amount.abs().toStringAsFixed(2)}'
                    : '\$ ${transaction.amount.toStringAsFixed(2)}';
            final color =
                transaction.type == TransactionType.expense
                    ? Colors.red
                    : Colors.teal;

            return ListTile(
              title: Text(transaction.description),
              subtitle: Text(type),
              trailing: Text(
                value,
                style: TextStyle(fontSize: 14, color: color),
              ),
            );
          },
        ),
      ),
    );
  }
}
