import 'dart:isolate';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: const Text('Sample App'),
      ),
      body: getBody(),
    );
  }

  Future<void> loadData() async
  {
    ReceivePort receivePort=ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    // The 'echo' isolate sends its SendPort as the first message.
    SendPort sendPort= await receivePort.first;
    List msg=await sendReceive(sendPort,URL);

    setState(() {
      widgets=msg;
    });
  }


  // The entry point for the isolate.
  static Future<void> dataLoader(SendPort sendPort) async
  {
    // Open the ReceivePort for incoming messages.
    ReceivePort port = ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);

    await for(var msg in port)
    {
      String data=msg[0];
      SendPort replyTo=msg[1];
       String dataURL=data;
      http.Response response = await http.get(Uri.parse(dataURL));
      // Lots of JSON to parse
      replyTo.send(jsonDecode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }


}

Widget getProgressDialog() {
  return const Center(child: CircularProgressIndicator());
}

