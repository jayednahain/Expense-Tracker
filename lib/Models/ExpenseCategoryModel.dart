import 'ExpenseModal.dart';
import 'Enums.dart';

class ExpenseCategoryModel {

  const ExpenseCategoryModel({
    required this.expenseCategory,
    required this.expenseList
  });

  final ExpenseCategory expenseCategory;
  final List<ExpenseModal> expenseList;

  double get totalExpense{
    double totalExpense = 0;
    for (final expense in expenseList){
      totalExpense = totalExpense + expense.amount;
    }
    return totalExpense;
  }

}