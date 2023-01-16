import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranscation extends StatefulWidget{
  final addTx;
  NewTranscation(this.addTx);
  @override
  _NewTranscationState createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation>{
  final _tittlecontroler=TextEditingController();
  final _amountcontroler=TextEditingController();
  var _selectedDate;
  void _submitData(){
    final enter_title=_tittlecontroler.text;
    final enter_amount=double.parse(_amountcontroler.text);
    if(enter_title.isEmpty||enter_amount<=0||_selectedDate==null)
    {
      return;
    }
    widget.addTx(enter_title,enter_amount,_selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDate()
  {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015), 
        lastDate: DateTime.now())
        .then((pickdate)
    {
      if(pickdate==null)
      {
        return;
      }
      setState(() {
        _selectedDate = pickdate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scrollbar(
      child: Card(
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Enter Title'),
                //  onChanged: (val)=>titleInput=val,
                controller: _tittlecontroler,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Enter Amount'),
                // onChanged: (val)=>amountInput=val,
                controller: _amountcontroler,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selectedDate==null?'No Date Chosen!  ' :'Picked Date :- \t ${DateFormat.yMMMd().format(_selectedDate)}',
                        style: TextStyle(color: Colors.black87,
                          fontSize: 14)),
                    ),
                    FlatButton(child: Text('Choose Date',
                    style: TextStyle(color: Theme.of(context).primaryColorDark,
                    fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                        onPressed:_presentDate
                    )
                  ],
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed:_submitData,
                  color: Theme.of(context).primaryColorDark,
                  child:   Text('Add Transaction',
                    style: TextStyle(color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),),),
              )
            ],
          ),
        ),
      ),
    );

  }

}

