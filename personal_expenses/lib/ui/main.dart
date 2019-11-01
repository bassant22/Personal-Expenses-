import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/ui/chart.dart';
import 'package:personal_expenses/ui/transaction_list.dart';

import './new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Personal',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.blue[300],
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.dark()
              .textTheme
              .copyWith(title: TextStyle(fontSize: 22.0)),
        ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  //String titleInput;
  //String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _users = [
    //Transaction(id: 't1', title: 'T-shirt', amount: 5.0, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransaction {
    return _users.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String titleTx, double amountTx) {
    final _newTx = Transaction(
        title: titleTx,
        amount: amountTx,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _users.add(_newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {
            print('lkk');
          },
          behavior: HitTestBehavior.deferToChild,
        );
        //return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Persnoal Expenses',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.0),
        ),
        // backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(_recentTransaction),
          TransactionList(_users),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
