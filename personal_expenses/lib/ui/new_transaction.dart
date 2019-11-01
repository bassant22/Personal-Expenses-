import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTX;

  NewTransaction(this.addTX);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTX(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              //  onChanged: (title)=>titleInput=title,
              controller: _titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              readOnly: false,
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              //onChanged: (amount)=>amountInput=amount,
              controller: _amountController,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
