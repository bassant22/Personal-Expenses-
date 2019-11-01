import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _users;

  TransactionList(this._users);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: _users.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction yet ... ',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(child:Image.asset('assets/images/waiting.png',fit: BoxFit.cover,height: 300,),)
                
              ],
            )
          : ListView(
              //scrollDirection: Axis.horizontal,
              children: _users.map((tx) {
                return Card(
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                    color: Colors.white,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                style: BorderStyle.solid,
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(5.0),
                          //transform: Matrix4.rotationZ(0.1),
                          child: Text(
                            '${tx.amount.toStringAsFixed(2)} \$ ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMEd().format(tx.date),
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 14.0),
                            ),
                          ],
                        )
                      ],
                    ));
              }).toList(),
            ),
    );
  }
}
