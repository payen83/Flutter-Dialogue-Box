import 'package:flutter/material.dart';

void main(){ runApp(new MaterialApp(
  home: new MyApp(),
));
}

enum MyDialogueAction{
  yes,
  no,
  maybe
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  String _text = '';
  void _onChange(String value) {
    setState((){
      _text = value;
    });
  }

  void _dialogueResult(MyDialogueAction value){
    print('you selected $value');
    Navigator.pop(context);
  }

 void _showAlert(String value){
  showDialog(
    context: context,
    builder: (_) => new AlertDialog(
      title: new Text('Alert!'),
      content: new Text(value,
      style: new TextStyle(fontSize: 30.0),),
      actions: <Widget>[
        new FlatButton(onPressed: () {_dialogueResult(MyDialogueAction.yes);}, child: new Text('yes')),
        new FlatButton(onPressed: () {_dialogueResult(MyDialogueAction.no);}, child: new Text('no')),
      ],
    )
  );
}
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Alert Demo'),
      ),body: new Container(
        child: new Column(
          children: <Widget>[
            new TextField(onChanged: (String value){ _onChange(value);},),
            new RaisedButton(
              onPressed: (){_showAlert(_text);},
              child: new Text('Press me'),
            )
          ],
        ),
      ),
    );
  } 
}

