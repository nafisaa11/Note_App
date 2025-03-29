import 'package:flutter/material.dart';

class NoteFormWidgets extends StatelessWidget {
  const NoteFormWidgets({
    Key? key,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.onChangedIsImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final ValueChanged<bool> onChangedIsImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4, // Menambahkan efek bayangan agar lebih elegan
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Membuat sudut lebih halus
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Important:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Switch(
                      value: isImportant,
                      onChanged: onChangedIsImportant,
                      activeColor: Colors.blueAccent,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Priority Level:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800,
                  ),
                ),
                Slider(
                  value: number.toDouble(),
                  min: 0,
                  max: 5,
                  divisions: 5,
                  activeColor: Colors.blueAccent,
                  onChanged: (value) => onChangedNumber(value.toInt()),
                ),
                const SizedBox(height: 12),
                buildTextField(),
                const SizedBox(height: 12),
                buildDescriptionField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField() {
    return TextFormField(
      maxLines: 1,
      initialValue: title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        labelText: 'Title',
        labelStyle: TextStyle(color: Colors.blueAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      validator: (title) {
        return title != null && title.isEmpty ? 'Title cannot be empty' : null;
      },
      onChanged: onChangedTitle,
    );
  }

  Widget buildDescriptionField() {
    return TextFormField(
      maxLines: 5,
      initialValue: description,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        labelText: 'Description',
        labelStyle: TextStyle(color: Colors.blueAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      validator: (desc) {
        return desc != null && desc.isEmpty ? 'Description cannot be empty' : null;
      },
      onChanged: onChangedDescription,
    );
  }
}
