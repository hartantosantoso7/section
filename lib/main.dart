import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}



class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  int _value = 0;

  String value2='';

  String value3='';

  List <BottomNavigationBarItem> _item;
  String value4='';
  int _index=0;

  @override
  void initState(){
    _item = new List();
    _item.add(BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('People')));
    _item.add(BottomNavigationBarItem(icon: Icon(Icons.weekend), title: Text('Weekend')));
  }

  // void _onClik(String value) => setState(() => value3 = value);
  void _onClicked(){
    setState(() {
      value2 = new DateTime.now().toString();
    });
    Navigator.pop(context);
  }

  void _add() => setState(() => _value++);
  void _remove() => setState(() => _value--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _add,),
          IconButton(icon: Icon(Icons.remove), onPressed: _remove,),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onClicked,
        backgroundColor: Colors.red,
        mini: true,
        child: new Icon(Icons.timer),
      ),

      drawer: new Drawer(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text('hello drawer'),
              RaisedButton(onPressed: _onClicked, child: Text('Date'),)
            ],
          ),
        ),
      ),

      // persistentFooterButtons: <Widget>[
      //   new IconButton(icon: Icon(Icons.timer), onPressed: () => _onClik('Button 1'),),
      //   new IconButton(icon: Icon(Icons.people), onPressed: () => _onClik('Button 2'),),
      //   new IconButton(icon: Icon(Icons.home), onPressed: () => _onClik('Button 3'),)
      // ],
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              new Text(_value.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37.0)),
              new Text(value2),
              // Text(value3),
              Text(value4)
            ],
          ),
        ),
      ),
    bottomNavigationBar: BottomNavigationBar(
      items: _item,
      fixedColor: Colors.blue ,
      currentIndex: _index,
      onTap: (int item){
        setState((){
          _index = item;
          value4 = "Current value is : ${_index.toString()}";
        });
      },

    ),
    );
  }
}
