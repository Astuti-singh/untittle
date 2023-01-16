import 'package:flutter/material.dart';
import 'dart:developer' as developer;

void main()=>runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: const Mylist_App(),
));

class Mylist_App extends StatelessWidget
{
  const Mylist_App({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Dynanamic Listview',
      style: TextStyle(
        fontSize: 20
      ),
      ),
      centerTitle: true,
    ),
    body:  const SampleAppPage(),
  );
  }

}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (context, position) {
        return getRow(position);
      },
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widgets.add(getRow(widgets.length));
          developer.log('row $i');
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('Row $i'),
      ),
    );
  }
}
