import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
         primaryColor: Colors.brown,
         primaryColorDark: Colors.brown[600]
       ),
      title: "Botton navigation bar",
      home: myFullState(),
    );
  }
}

class myFullState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _getnewScreen();
  }
}

 class _getnewScreen extends State<myFullState> {
  int _selectIndex = 0;
  static List<Widget> _Items = <Widget>[

    ListTile(
      title: new Container(
        child: Center(
          child: Text(
            "i am where you for first coming",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
    ListTile(
      title: new Container(
          child: Center(
        child: Text(
          "i am where you can search every thing that want",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )),
    ),
    ListTile(
      title: new Container(
        child: Center(
          child: Text(
            "i am where you can see category of products",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  ];

  void _changeIndex(int Index) {
    setState(() {
      _selectIndex = Index;
    });
  }
  Color _getColor(int Index){
    if(Index==1)
      return Colors.red;
    if(Index==2)
      return Colors.green;
    else
      return Colors.blueAccent;
    
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getColor(_selectIndex),
      appBar: AppBar(
        title: Text("botton navigation bar"),
      ),

      body: _Items.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("category")),
        ],
        selectedItemColor: _getColor(_selectIndex),
        currentIndex: _selectIndex,
        onTap: _changeIndex,
      ),
    );
  }
}
