import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_gdsc/add_note/add_note_cubit.dart';
import 'package:todo_gdsc/core/snake.dart';
import 'package:todo_gdsc/model/add_note_model.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key});
  DateTime dateTime = DateTime.now();
  GlobalKey<FormState> addNoteKey = GlobalKey<FormState>();
  TextEditingController  nameController = TextEditingController();
  TextEditingController  titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: addNoteKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 15),
                Text(
                  'Note',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
                PopupMenuButton(
                    // add icon, by default "3 dot" icon
                    icon: Icon(Icons.menu),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Text("Delete"),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Text("Save"),
                        ),
                      ];
                    },
                    onSelected: (value) {
                      if (value == 0) {
                        log("My account menu is selected.");
                      } else if (value == 1) {
                        if (addNoteKey.currentState!.validate()) {
                          try {
                            AddNoteCubit.get(context).listNotes.insert(
                              0,
                                AddNoteModel(
                                  text: nameController.text,
                                  title: titleController.text,
                                ),
                              );
                              flutterSnackBar(context: context, msg: 'Success');
                              log('${AddNoteCubit.get(context).listNotes}');
                          } catch (err) {
                            flutterSnackBar(context: context, msg: 'Error');
                          }

                        }
                      }
                    }),
              ],
            ),
            SizedBox(height: 50),
            Text(
              '${dateTime.day}/${dateTime.month}/${dateTime.year}   ${dateTime.hour.ceilToDouble() + 1}',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'invalid text';
                }
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 35),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'invalid text';
                }
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Note something down',
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
