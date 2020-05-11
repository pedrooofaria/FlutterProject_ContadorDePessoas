import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
      debugShowCheckedModeBanner: false,
    home: Home()
  ),);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _more() {
    setState(() {
      _people++;
      changedString();
    });
}

  void _less() {
    setState(() {
      _people--;
      changedString();
    });
  }

  void changedString() {
    if (_people < 0) {
      _infoText = "Mundo invertido?!";
    } else if(_people <= 10){
      _infoText = "Pode Entrar!";
    } else {
      _infoText = "Lotado!";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/original.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child:
                    Text("+1", style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _more();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child:
                    Text("-1", style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _less();
                    },
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30.0),
            ),
          ],
        ),
      ],
    );
  }
}