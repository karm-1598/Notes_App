import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_notes/controllers/safe_areaController.dart';
import 'package:college_notes/models/notesModel.dart';
import 'package:college_notes/routes/routes.dart';
import 'package:college_notes/screens/home/homeScreen.dart';
import 'package:college_notes/utils/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notesscreen extends StatefulWidget {
  late notesModel note;
  Notesscreen({super.key, required this.note});

  @override
  State<Notesscreen> createState() => _NotesscreenState();
}

class _NotesscreenState extends State<Notesscreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference myNotes = FirebaseFirestore.instance.collection(
    'Notes',
  );

  final titlecontroller = TextEditingController();
  final messageController = TextEditingController();

  String titleString = '';
  String messageString = '';
  String noteId = '';
  late int color;

  @override
  void initState() {
    super.initState();
    var note = widget.note;
    titleString = note.title!;
    messageString = note.message!;
    noteId = note.id!;
    color = (note.color == null || note.color == 0xFFFFFFFF)
        ? generateRandomColor()
        : note.color ?? const Color.fromARGB(255, 244, 244, 244).toARGB32();
    titlecontroller.text = note.title ?? '';
    messageController.text = note.message ?? '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titlecontroller.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          noteId.isEmpty ? 'Add Note' : 'Edit Note',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  saveNotes();
                  Get.offAll(Myhome());
                },
                icon: Icon(Icons.save),
              ),
    
              if (noteId.isNotEmpty)
                IconButton(
                  onPressed: () {
                    myNotes.doc(noteId).delete();
                    Get.offAll(Myhome());
                  },
                  icon: Icon(Icons.delete),
                ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTextField(
                hintText: 'Titile',
                controller: titlecontroller,
                onChanged: (p0) {
                  setState(() {
                    titleString = p0;
                  });
                },
              ),
    
              SizedBox(height: 20),
    
              TextField(
                controller: messageController,
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    messageString = value;
                  });
                },
                decoration: InputDecoration(hintText: 'Message'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveNotes() async {
    DateTime time = DateTime.now();
    try {
      if (noteId.isEmpty) {
        final uid = auth.currentUser!.uid;
        await myNotes.add({
          'title': titlecontroller.text.trim(),
          'message': messageController.text.trim(),
          'createdAt': time.toString(),
          'color': color,
          'uid': uid,
        });
      } else {
        await myNotes.doc(noteId).update({
          'title': titlecontroller.text.trim(),
          'message': messageController.text.trim(),
          'updatedAt': time.toString(),
          'color': color,
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving note: ${e.toString()}')),
      );
    }
  }
}
