import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  String strAns = '0';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator')
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
              ),
              alignment: Alignment.bottomRight,
              color: Colors.white,
              child: Text(
                strAns,
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
                _button('/', click),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button('4', click),
                _button('5', click),
                _button('6', click),
                _button('*', click),
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
                _button('=', click),
                _button('+', click),
              ],
            )
          ],
        )
      ),
    );
  }

  Widget _button(String number, Function(String number) f) {
    return MaterialButton(
      height: 92.0,
      child: Text(
        number,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0)
      ),
      textColor: Colors.black,
      color: Colors.grey[200],
      onPressed: () => f(number),
    );
  }

  int ans = 0;
  String method = '';
  bool isStart = true;
  void click(String number) {
    setState(() {
      if (int.tryParse(number) != null) {
        if (isStart) {
          strAns = '0';
        }
        strAns += number;
        isStart = false;
      } else {
        switch (number) {
          case 'C':
            strAns = '0';
            method = '';
            ans = 0;
            isStart = true;
            break;
          case '+':case '-':case '*':case '/':
            method = number;
            ans = int.parse(strAns);
            isStart = true;
            break;
          case '=':
            switch (method) {
              case '+':
                ans += int.parse(strAns);
              break;
              case '-':
                ans -= int.parse(strAns);
              break;
              case '*':
                ans *= int.parse(strAns);
              break;
              case '/':
                ans ~/= int.parse(strAns);
              break;
            }
            strAns = ans.toString();
            break;
        }
      }
      strAns = int.parse(strAns).toString();
    });
  }

}
