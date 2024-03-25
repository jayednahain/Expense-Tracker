import 'package:expencetracker/Widgets/ExpenseSingleItem.dart';
import 'package:flutter/material.dart';

import 'Models/ExpenseModal.dart';

class ExpenseList extends StatelessWidget {

  const ExpenseList({
    super.key,
    required this.ExpenseListData,
    required this.onRemoveExpense,

  });



  final List<ExpenseModal> ExpenseListData;
  final void Function(ExpenseModal expense) onRemoveExpense;


  Widget _renderDismissibleRightToLeft(){
    return Container(
      color: Colors.red,
    );
  }

  Widget _renderDismissibleLeftToRight(){
    return Container(
      color: Colors.green,
    );
  }

  // Widget _getBackground() {
  //   switch () {
  //     case DismissDirection.endToStart:
  //       return _renderDismissibleRightToLeft();
  //     case DismissDirection.startToEnd:
  //     default:
  //       return _renderDismissibleLeftToRight();
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:  ExpenseListData.length,
        itemBuilder:(ctx,index){
          return Dismissible(
              background:Container(
                // color: Theme.of(context).colorScheme.error.withOpacity(0.97), custom color update
                color: Theme.of(context).colorScheme.error.withOpacity(0.97),
                margin: EdgeInsets.symmetric(horizontal:Theme.of(context).cardTheme.margin!.horizontal ) ,
              ),
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
