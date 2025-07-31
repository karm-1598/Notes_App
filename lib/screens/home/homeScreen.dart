import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_notes/controllers/safe_areaController.dart';
import 'package:college_notes/models/notesModel.dart';
import 'package:college_notes/routes/routes.dart';
import 'package:college_notes/screens/notes_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
    goto.goLoginScreen();
  }

  Stream<QuerySnapshot> getmyNotes() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('Notes')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return customSafearea(
      topcolor: Theme.of(context).appBarTheme.backgroundColor,
      // bottomcolor:Theme.of(context).appBarTheme.backgroundColor ,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Your Notes',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  signout();
                },
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: StreamBuilder(
            stream: getmyNotes(),
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshots.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final notes = snapshots.data!.docs;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final data = notes[index].data() as Map<String, dynamic>;

                  notesModel noteObject = notesModel(
                    id: notes[index].id,
                    title: data['title'],
                    message: data['message'],

                    createdAt: data.containsKey('createdAt')
                        ? (data['createdAt'] is Timestamp
                              ? (data['createdAt'] as Timestamp).toDate()
                              : DateTime.parse(data['createdAt']))
                        : DateTime.now(),

                    updatedAt: data.containsKey('updatedAt')
                        ? (data['updatedAt'] is Timestamp
                              ? (data['updatedAt'] as Timestamp).toDate()
                              : DateTime.parse(data['updatedAt']))
                        : DateTime.now(),

                    color: data.containsKey('color')
                        ? data['color']
                        : 0xFFFFFFFF,
                  );
                  return NotesCard(
                    notes: noteObject,
                    onPressed: () {
                      goto.goNotesScreen(note: noteObject);
                    },
                  );
                },
              );
            },
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              goto.goNotesScreen(
                note: notesModel(
                  id: '',
                  title: '',
                  message: '',
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
              );
            },
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            child: Icon(Icons.add, color: Colors.black),
          ),
        ),
      );
  }
}
