import 'package:flutter/material.dart';

//107:
class AddNewExpenseWidget extends StatefulWidget {
  const AddNewExpenseWidget({super.key});

  @override
  State<AddNewExpenseWidget> createState() => _AddNewExpenseWidgetState();
}

class _AddNewExpenseWidgetState extends State<AddNewExpenseWidget> {

  //109:
  final _titleController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    //109:
    _titleController.dispose();
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
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("title")

            ),
          ),

          //108
          Row(
            children: [
              ElevatedButton(
                  onPressed: (){
                    print(_titleController.text);
                  }, child: Text("submit"))
            ],
          )
        ],
      ),
    );
  }
}
