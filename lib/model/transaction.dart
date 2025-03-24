class Transaction {
  final TransactionType type;
  final double amount;
  final String description;

  Transaction({
    required this.type,
    required this.amount,
    required this.description,
  });

  //Llamar para convertir datos a json.
  Map<String, dynamic> toMap() {
    return {
      'type': type.toString().split('.').last,
      'amount': amount,
      'description': description,
    };
  }

  //Llamar para convertir de json a el tipo transaction.(Es un constructor)
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      type: TransactionType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
      ),
      amount: (json['amount'] as num).toDouble(), // Convertimos a double
      description: json['description'],
    );
  }
}

enum TransactionType { income, expense }
