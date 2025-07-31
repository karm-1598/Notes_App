import 'package:college_notes/models/notesModel.dart';
import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  final notesModel notes;
  final VoidCallback onPressed;
  NotesCard({super.key, required this.notes, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Color(notes.color!),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                overflow: TextOverflow.fade,
                notes.title!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 3),
              Flexible(
                child: Text(
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  notes.message!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
