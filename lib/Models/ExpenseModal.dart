import 'Enums.dart';

class ExpenseModal {

  ExpenseModal ({
    // required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.description,
    required this.paymentMethod,
    this.tags = const [],
    this.imageUrl
  }) : id =DateTime.now().millisecondsSinceEpoch.toString();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;
  final String? description;
  final PaymentMethod paymentMethod;
  final List<String> tags;
  final String? imageUrl;

}