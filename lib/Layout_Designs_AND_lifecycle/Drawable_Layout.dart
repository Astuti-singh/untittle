import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Drawer layout',
  home: const drawer_layout(),
));

class drawer_layout extends StatefulWidget
{
  const drawer_layout({super.key});

  @override
  State<StatefulWidget> createState() =>  Toolbar_design();
}

class Toolbar_design extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawer Layout'),),
      drawer: new Drawer(
        child: new ListView(
          children:<Widget> [
           new DrawerHeader(child: new Text("Drawer Header"),
        decoration: new BoxDecoration(
          color: Colors.blue,)
           ),

            new Text("Item 1"),
            new Text("Item 2"),
            new Text("Item 3"),
            new Text("Item 4"),
            new Text("Item 5"),
            new Text("Item 6"),


          ],
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(items: [
        new BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Home',
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.search),
          label: 'Search',
        )
      ]),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){},
        child: new Icon(Icons.add),
      ),
    );
  }

}