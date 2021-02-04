import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _doneVal = false;
  bool _skipVal = false;
  bool _ignoreVal = false;
  bool _reviewedVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('List Menu'),
                Container(
                  height: 500,
                  width: 100,
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, i) {
                        return Row(
                          children: [
                            Text('$i'),
                            Text('哥'),
                            Text('哥'),
                            Text('ge'),
                          ],
                        );
                      }),
                )
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dictionary entry for: 哥 ge'),
                  Text('Actions'),
                  checkActions(),
                  dictionarySession(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('SAVE'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dictionarySession() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('Formatted dictionary'),
                TextFormField(),
              ],
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('MDBG'),
                TextFormField(),
              ],
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('Train Chinese'),
                TextFormField(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget checkActions() {
    return Row(
      children: [
        checkBtn('Done', _doneVal, (val) {
          setState(() {
            _doneVal = val;
          });
        }),
        checkBtn('Skip', _skipVal, (val) {
          setState(() {
            _skipVal = val;
          });
        }),
        checkBtn('Ignore', _ignoreVal, (val) {
          setState(() {
            _ignoreVal = val;
          });
        }),
        checkBtn('Reviewed', _reviewedVal, (val) {
          setState(() {
            _reviewedVal = val;
          });
        }),
      ],
    );
  }

  Widget checkBtn(String text, bool value, Function onChanged) {
    return Container(
      child: Row(
        children: [
          Checkbox(value: value, onChanged: onChanged),
          Text(text),
        ],
      ),
    );
  }
}
