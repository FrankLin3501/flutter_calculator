import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primaryColor: Colors.yellow[400],
      ),
      home: MyHomePage(title: 'Calculator'),
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
  String strScreen = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
              height:
                  Theme.of(context).textTheme.display1.fontSize * 1.1 + 64.0,
            ),
            alignment: Alignment.bottomRight,
            color: Colors.white,
            child: Text(
              strScreen,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 50.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _button('7', click),
              _button('8', click),
              _button('9', click),
              _button('÷', click),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _button('4', click),
              _button('5', click),
              _button('6', click),
              _button('×', click),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _button('1', click),
              _button('2', click),
              _button('3', click),
              _button('-', click),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _button('C', click),
              _button('0', click),
              _button('＝', click),
              _button('+', click),
            ],
          )
        ],
      )),
    );
  }

  Widget _button(String number, Function(String number) f) {
    return MaterialButton(
      height: 94.0,
      child: Text(number,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0, fontFamily: 'monospace')),
      textColor: Colors.black,
      color: Colors.yellow[200],
      onPressed: () => setState(() => this.strScreen = f(number)),
    );
  }

  int numStore = 0;
  String method = '';
  bool isStart = true;
  String click(String number) {
    var _operator = ['+', '-', '×', '÷'];

    if (int.tryParse(number) != null) {
      if (isStart) strScreen = '0';
      strScreen += number;
      isStart = false;
    } else if (_operator.contains(number)) {
      method = number;
      numStore = int.parse(strScreen);
      isStart = true;
    } else if (number == 'C') {
      strScreen = '0';
      method = '';
      numStore = 0;
      isStart = true;
    } else {
      switch (method) {
        case '+':
          numStore += int.parse(strScreen);
          break;
        case '-':
          numStore -= int.parse(strScreen);
          break;
        case '×':
          numStore *= int.parse(strScreen);
          break;
        case '÷':
          numStore ~/= int.parse(strScreen);
          break;
      }
      strScreen = numStore.toString();
      isStart = true;
    }
    strScreen = int.parse(strScreen).toString();
    return strScreen;
  }
}
