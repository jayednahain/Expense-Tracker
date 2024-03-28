import 'package:expencetracker/Models/Enums.dart';
import 'package:expencetracker/Widgets/Chart/ChartBar.dart';
import 'package:flutter/material.dart';
import 'package:expencetracker/Models/ExpenseCategoryModel.dart';
import 'package:expencetracker/Models/ExpenseModal.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenseList});

  final List<ExpenseModal> expenseList;

  List<ExpenseCategoryModel> get categories {
    return [
      ExpenseCategoryModel.forCategory(expenseList, ExpenseCategory.food),
      ExpenseCategoryModel.forCategory(expenseList, ExpenseCategory.travel),
      ExpenseCategoryModel.forCategory(expenseList, ExpenseCategory.work)
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in categories) {
      if (bucket.totalExpense > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpense;
      }
    }
    return maxTotalExpense;
  }

  // List<Widget> generateChartBar(){
  //   return [
  //     for (final category in categories)
  //       ChartBar(
  //           fill:category.totalExpense == 0 ? 0
  //               : category.totalExpense/maxTotalExpense
  //       )
  //   ];
  // }

  Widget _renderChartBar(){
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:  [
          for (final category in categories)
            ChartBar(
                fill:category.totalExpense == 0 ? 0
                    : category.totalExpense/maxTotalExpense
            )
        ],
      ),
    );
  }

  Widget _renderCategoryLogo(){
    return Row(
      children: categories.map((category) =>
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  ExpenseCategoryIcon[category.expenseCategory],
                ),
              )
          )
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8
      ),
      width:double.infinity,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          _renderChartBar(),
          const SizedBox(height: 12),
          _renderCategoryLogo()
        ],
      ),

    );
  }
}
