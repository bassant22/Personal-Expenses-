import 'package:flutter/material.dart';

class ChartBar extends StatefulWidget {
  final String label;
  final double amountSpending;
  final double totalPAmount;

  ChartBar(this.label, this.amountSpending, this.totalPAmount);

  @override
  _ChartBarState createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  double test;

  void testing() {
    setState(() {
      if (widget.amountSpending == 0.0)
        test = 1;
      else if (widget.amountSpending < 50)
        test = 0.7;
      else if (widget.amountSpending >= 50 && widget.amountSpending < 100)
        test = 0.5;
      else if (widget.amountSpending >= 100 && widget.amountSpending < 200)
        test = 0.3;
      else
        test = 0;
    });
    // print('amount is ${widget.amountSpending}');
    // print('test is $test');
  }

  @override
  Widget build(BuildContext context) {
    testing();
    return Column(
      children: <Widget>[
        FittedBox(child: Text('\$${widget.amountSpending.toStringAsFixed(0)}')),
        SizedBox(
          height: 2,
        ),
        Container(
          height: 60.0,
          width: 10.0,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: test <0.5 ? Colors.red: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: test,
                child:Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(220, 220, 220, 1),
                            borderRadius: BorderRadius.circular(10)),
                      ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text('${widget.label}'),
      ],
    );
  }
}
