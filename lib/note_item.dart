import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_gdsc/add_note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Title",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "Title",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
