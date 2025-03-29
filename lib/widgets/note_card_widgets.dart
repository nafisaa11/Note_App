import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/models/note.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightBlue.shade300,
  Colors.lightGreen.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100,
];

class NoteCardWidgets extends StatelessWidget {
  final Note note;
  final int index;

  const NoteCardWidgets({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.yMMMd().add_jms().format(note.createTime);
    final minHeight = getMinHeight(index);
    final cardColor = _lightColors[index % _lightColors.length];

    return Card(
      color: cardColor,
      elevation: 6, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), 
      ),
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 12, 
              ),
            ),
            const SizedBox(height: 6), 
            Text(
              note.title,
              maxLines: 2, 
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18, 
              ),
            ),
            const SizedBox(height: 6), 
          ],
        ),
      ),
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 120;
      case 1:
        return 160;
      case 2:
        return 220;
      case 3:
        return 260;
      default:
        return 120;
    }
  }
}
