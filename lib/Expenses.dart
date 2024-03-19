import 'package:expencetracker/ExpensesList.dart';
import 'package:expencetracker/Widgets/AddNewExpenseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Models/Enums.dart';
import 'Models/ExpenseModal.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<ExpenseModal> _RegisteredExpenseList =[
    ExpenseModal(
        title: "title",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.food,
        paymentMethod: PaymentMethod.cashMoney),
    ExpenseModal(
        title: "title2",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.travel,
        paymentMethod: PaymentMethod.cashMoney),
    ExpenseModal(
        title: "title3",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.travel,
        paymentMethod: PaymentMethod.cashMoney),
    ExpenseModal(
        title: "title4",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.food,
        paymentMethod: PaymentMethod.cashMoney),
    ExpenseModal(
        title: "title5",
        amount: 5.5,
        date: DateTime.now(),
        category: ExpenseCategory.food,
        paymentMethod: PaymentMethod.cashMoney),

  ];

  //106
  void _openAddExpenseOverlay(){
    showModalBottomSheet(
        //119:
        isScrollControlled: true,
        context: context,
        //118:-2
        builder: (ctx)=>
            AddNewExpenseWidget(
              onAddExpense: _addExpense
            )
    );
  }

  //118
  // 118:-1
  void _addExpense(ExpenseModal expense){
    setState(() {
      _RegisteredExpenseList.add(expense);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 105:
        title: const Text("Expense Tracker"),
        actions: [

          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: Icon(Icons.add)),

        ],
      ),
      body: Column(
        children:  [
          Text("Cart"),
          Expanded(child: ExpenseList(ExpenseListData:_RegisteredExpenseList ))
        ],
      ),
    );
  }
}
