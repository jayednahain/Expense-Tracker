import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//107:
class AddNewExpenseWidget extends StatefulWidget {
  const AddNewExpenseWidget({super.key});

  @override
  State<AddNewExpenseWidget> createState() => _AddNewExpenseWidgetState();
}

class _AddNewExpenseWidgetState extends State<AddNewExpenseWidget> {

  //109:
  final _titleInputFieldController = TextEditingController();
  final _amountInputFieldController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    //109:
    _titleInputFieldController.dispose();
    _amountInputFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20, vertical: 10
      ),
      child: Column(
        children: [
          TextField(
            //109:
            controller: _titleInputFieldController,
            maxLength: 200,
            decoration: InputDecoration(
              label: Text("title")
            ),
          ),
          TextField(
            //109:
            inputFormatters: [
             new FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            keyboardType: TextInputType.number,
            controller: _amountInputFieldController,
            maxLength: 200,
            decoration: InputDecoration(
                prefixText: '\$ ',
                label: Text("Amout")
            ),
          ),

          //108
          Row(
            children: [
              TextButton(onPressed: (){}, child: Text("Cancle")),
              ElevatedButton(
                  onPressed: (){
                    print(_titleInputFieldController.text);
                  }, child: Text("submit"))
            ],
          )
        ],
      ),
    );
  }
}
