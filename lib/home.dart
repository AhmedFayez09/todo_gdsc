import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:todo_gdsc/add_note.dart';
import 'package:todo_gdsc/layout_screen.dart';
import 'package:todo_gdsc/note_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    await Future.delayed(Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFEDE3F),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LayoutScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 110),
            Text(
              'Notepad',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Search notes',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 7);
                },
                itemCount: 5,
                itemBuilder: (context, index) {
                  return NoteItem();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
