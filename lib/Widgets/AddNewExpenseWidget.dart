import 'package:flutter/material.dart';

//107:
class AddNewExpenseWidget extends StatefulWidget {
  const AddNewExpenseWidget({super.key});

  @override
  State<AddNewExpenseWidget> createState() => _AddNewExpenseWidgetState();
}

class _AddNewExpenseWidgetState extends State<AddNewExpenseWidget> {

  //108
  var _title ="";

  //108
  void _saveTitleInput(String titleInput){
    _title = titleInput;
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
                    // _saveTitleInput()
                  }, child: Text("submit"))
            ],
          )
        ],
      ),
    );
  }
}
