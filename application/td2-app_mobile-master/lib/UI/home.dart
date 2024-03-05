import 'package:flutter/material.dart';
import 'package:td2_app_mobile/UI/mytheme.dart';
import 'package:td2_app_mobile/models/task.dart';
import 'package:td2_app_mobile/UI/screen1.dart';
import 'package:td2_app_mobile/UI/screen2.dart';
import 'package:td2_app_mobile/UI/screen3.dart';
import 'package:td2_app_mobile/UI/screen4.dart';

class MyWidget extends StatefulWidget {
  final Color color;
  final double textsize;

  const MyWidget(this.color, this.textsize);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  int _selectedIndex = 0;
  final List<Task> entries = Task.generateTask(5);

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold
  );

  static List<Widget> _widgetOptions = <Widget> [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'TD2',
            style: MyTheme.darkTextTheme.headline1,
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        backgroundColor: widget.color,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
    );
  }
}