import 'package:flutter/material.dart';

//107:
class AddNewExpenseWidget extends StatefulWidget {
  const AddNewExpenseWidget({super.key});

  @override
  State<AddNewExpenseWidget> createState() => _AddNewExpenseWidgetState();
}

class _AddNewExpenseWidgetState extends State<AddNewExpenseWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20, vertical: 10
      ),
      child: Column(
        children: const [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(

              label: Text("title")
            ),
          )
        ],
      ),
    );
  }
}
