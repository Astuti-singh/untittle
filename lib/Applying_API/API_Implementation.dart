import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
void main() {
  runApp(const SampleApp());
}
List widgets = [];
var URL= 'https://jsonplaceholder.typicode.com/posts';
class SampleApp extends StatelessWidget {
  const SampleApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();
}
class _SampleAppPageState extends State<SampleAppPage>
{
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget getBody()
  {
    bool showLoadingDialog=widgets.isEmpty;
    if(showLoadingDialog)
    {
      return getProgressDialog();
    }
    else
    {
      return getListView();
    }
  }
  Widget getListView()
  {
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (context, position) {
        return getRow(position);
      },
    );
  }
  Widget getRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Implementation'),
      ),
      body: getBody(),
    );
  }
  Future<void> loadData() async {
    var dataURL = Uri.parse(URL);
    http.Response response = await http.get(dataURL);
    developer.log(response.body);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}

Widget getProgressDialog() {
  return const Center(child: CircularProgressIndicator());
}

