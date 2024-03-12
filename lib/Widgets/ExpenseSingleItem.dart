import 'package:expencetracker/Models/ExpenseModal.dart';
import 'package:flutter/material.dart';

// 103:
class ExpenseSingleItem extends StatelessWidget {
  const ExpenseSingleItem(this.expense,{super.key});

  final ExpenseModal expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(
              height:4,
            ),
            Row(
              children: [
                Text("\$${expense.amount.toStringAsFixed(2)}"),
               const  Spacer(),
                Row(
                  children: [
                    Icon(ExpenseCategoryIcon[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.FormattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
