import 'package:flutter/material.dart';

import 'Models/ExpenseModal.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.ExpenseListData});

  final List<ExpenseModal> ExpenseListData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:  ExpenseListData.length,
        itemBuilder:(ctx,index){
          return Text(ExpenseListData[index].title);
        });
  }
}
