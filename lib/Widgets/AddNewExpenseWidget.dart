import 'package:expencetracker/Models/Enums.dart';
import 'package:expencetracker/Models/ExpenseModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//107:
class AddNewExpenseWidget extends StatefulWidget {
  const AddNewExpenseWidget({super.key,required this.onAddExpense});
  final void Function(ExpenseModal expense) onAddExpense;
  @override
  State<AddNewExpenseWidget> createState() => _AddNewExpenseWidgetState();
}

class _AddNewExpenseWidgetState extends State<AddNewExpenseWidget> {

  //109:
  final _titleInputFieldController = TextEditingController();
  final _amountInputFieldController = TextEditingController();
  // ExpenseCategory  _selectedCategory = ExpenseCategory.travel;
  ExpenseCategory?  _selectedCategory;
  DateTime? _selectedDate;


  void showWarning(){
    showDialog(
        context: context,
        builder: (ctx)=>AlertDialog(
          title: const Text("Invalied Input"),
          content: const Text("Please Fill all the field"),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(ctx);
                },
                child: const Text("Okay"))
          ],
        ));
  }

  void _submitExpenseData(){
    //115
    final enteredAmount = double.tryParse(_amountInputFieldController.text);
    final amountIsInvalied = enteredAmount == null || enteredAmount <=0;
    if (_titleInputFieldController.text.trim().isEmpty ||  amountIsInvalied||_selectedDate == null){
      showWarning();
      return;
    }

    widget.onAddExpense(
        ExpenseModal(
            title: _titleInputFieldController.text,
            amount: enteredAmount,
            date: _selectedDate!,
            category: _selectedCategory!,
            paymentMethod: PaymentMethod.cashMoney
        )
    );
    Navigator.pop(context);
  }

  //114
  void _showDatePicker() async{
    final currentData = DateTime.now();
    final firstDate =DateTime(currentData.year-1,currentData.month, currentData.day);
    // showDatePicker(
    //     context: context,
    //     initialDate: currentData,
    //     firstDate: firstDate,
    //     lastDate: currentData
    // ).then((value) => null);
    final pickDate = await showDatePicker(
        context: context,
        initialDate: currentData,
        firstDate: firstDate,
        lastDate: currentData
    );
    setState(() {_selectedDate = pickDate;});
  }

  @override
  void dispose() {
    //109:
    _titleInputFieldController.dispose();
    _amountInputFieldController.dispose();
    super.dispose();
  }

  Widget _renderAmountAndDate(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: TextField(
              //109:
              inputFormatters: [ FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
              keyboardType: TextInputType.number,
              controller: _amountInputFieldController,
              maxLength: 200,
              decoration: const InputDecoration(
                  prefixText: '\$ ',
                  label: Text("Amout")
              ),
            )
        ),
        const SizedBox(width: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //114
            Text(_selectedDate == null ?  "select Data" : DateFormatter.format(_selectedDate!)),
            IconButton(
                onPressed: (){_showDatePicker();},
                icon:const Icon(Icons.calendar_month) )
          ],
        )
      ],
    );
  }
  Widget _renderDropDownButton(){
    return DropdownButton(
      value: _selectedCategory ,
        items: ExpenseCategory.values.map((category) =>
            DropdownMenuItem(
              value: category,
            child:Text(category.name.toUpperCase())
        )
        ).toList(),
        onChanged: (value){
        if(value == null){
          return;
        }
        setState(() {
          _selectedCategory =value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20, vertical: 40
      ),
      child: Column(
        children: [
          TextField(
            controller: _titleInputFieldController,
            maxLength: 200,
            decoration: const InputDecoration(
              label: Text("title")
            ),
          ),
          _renderAmountAndDate(),
          _renderDropDownButton(),
          //108
          Row(
            children: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Cancle")),

              ElevatedButton(
                  onPressed: (){
                    _submitExpenseData();
                    print(_titleInputFieldController.text);
                  }, child: Text("submit"))
            ],
          )
        ],
      ),
    );
  }
}
