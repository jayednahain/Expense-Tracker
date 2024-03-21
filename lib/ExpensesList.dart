import 'package:expencetracker/Widgets/ExpenseSingleItem.dart';
import 'package:flutter/material.dart';

import 'Models/ExpenseModal.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.ExpenseListData,
    required this.onRemoveExpense
  });

  final List<ExpenseModal> ExpenseListData;
  //120-3
  final void Function(ExpenseModal expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:  ExpenseListData.length,
        itemBuilder:(ctx,index){
          return Dismissible(
              // 120-4
              onDismissed: (direction){
                onRemoveExpense(ExpenseListData[index]);
              },
              key: ValueKey(ExpenseListData[index]),
              child: ExpenseSingleItem(
                  ExpenseListData[index])
          );
        });
  }
}
