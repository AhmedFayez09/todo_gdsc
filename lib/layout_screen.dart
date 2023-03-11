import 'package:flutter/material.dart';
import 'package:todo_gdsc/add_note.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final List<Widget> listScreen = [
    AddNote(),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.white,
    ),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(




      body: listScreen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Album'),
          BottomNavigationBarItem(
              icon: Icon(Icons.today_outlined), label: 'To-do list'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add), label: "Reminder"),
        ],
      ),
    );
  }
}
