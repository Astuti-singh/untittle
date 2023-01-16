
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget
{
  final String label;
  final double spending_Amount;
  final double spending_PerOfTotal;

  ChartBar(this.label, this.spending_Amount, this.spending_PerOfTotal);

  @override
  Widget build(BuildContext context) {
  return Expanded(child: Column(
    children: [
      FittedBox(child: Text('\$ ${spending_Amount.toStringAsFixed(0)}')),
      SizedBox(height: 4),
      Container(
        height: 60,
        width: 10,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spending_PerOfTotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(label),


    ],
  )) ;
  }

}