import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Hello app',
      home: Scaffold(
        body: ListView(
          children: [
            Image.asset('assets/image/lake.jpg',
            width: 600,
            height: 400,
            fit: BoxFit.cover,
            ),
            Tittle_Section(),
            Button_Section(context),
            Text_section(),
          ],
        ),
      ),
    );
  }
}




Widget Tittle_Section() {
return Container(
    padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
    child: Row(
      children: [
        Expanded(
          // 1st column in main row
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2nd child of that 1st column
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text
                    ('Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.red[900],
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
        ),
        
        Icon(Icons.star,
        color: Colors.redAccent,),
        const Text('  51'),
      ],

    ),

  );


}
Widget Button_Section(BuildContext context) {
  Color color = Theme.of(context).primaryColor;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(color, Icons.call, 'CALL'),
      _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
      _buildButtonColumn(color, Icons.share, 'SHARE'),
    ],
  );
}

_buildButtonColumn(Color color, IconData call, String s) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.only(top: 50),
        child:   Icon(call, color: color),
      ),
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          s,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}


Widget Text_section() {
  return const Padding(
      padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
    child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,),

  );
}