import 'package:flutter/material.dart';
import 'package:flutter_mobile/widget/radiogroup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Zan Sen Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String testing = '0';
  String _selectedRadioOption = "100";
  final List<RadioModel> options = [
    RadioModel(label: "100", isSelected: true),
    RadioModel(label: "200")
  ];

  void _incrementCounter() {
    setState(() {
      var loc = int.tryParse(testing) ?? 0;
      loc++;
      testing = '$loc';
    });
  }

  void _decrementCounter() {
    setState(() {
      var loc = int.tryParse(testing) ?? 0;
      loc--;
      testing = '$loc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Current number: $testing',
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    testing = text;
                  });
                },
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 5.0),
                  ),
                  hintText: 'Number',
                ),
              ),
              RadioGroup(
                  items: options,
                  onChanged: (RadioModel radioModel) {
                    _selectedRadioOption = radioModel.label;
                    setState(() {
                      testing = radioModel.label;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing)
            ],
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: _decrementCounter,
            heroTag: null,
          ),
          FloatingActionButton(
            child: const Icon(Icons.exposure_plus_1),
            onPressed: _incrementCounter,
            heroTag: null,
          )
        ]) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
