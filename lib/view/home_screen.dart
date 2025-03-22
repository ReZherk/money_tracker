import 'package:contador/view/components/add_transaction_dialog.dart';
import 'package:contador/view/components/home_header.dart';
import 'package:contador/view/components/transactions_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print(
      'Esto es el ancho del dispositivo: $width y esta es la altura: $height',
    );

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        bottom: false,
        child: Column(children: [HomeHeader(), TransactionsList()]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AddTransactionDialog();
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
