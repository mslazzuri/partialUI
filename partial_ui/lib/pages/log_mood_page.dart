import 'package:flutter/material.dart';
import '../models/mood_log.dart';

class LogMoodPage extends StatefulWidget {
  @override
  _LogMoodPageState createState() => _LogMoodPageState();
}

class _LogMoodPageState extends State<LogMoodPage> {
  String? selectedMood;
  final TextEditingController noteController = TextEditingController();

  final moods = ['😊 Happy', '😐 Meh', '😢 Sad', '😡 Angry', '😴 Tired'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log Your Mood')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Select your mood"),
              items: moods
                  .map((mood) => DropdownMenuItem(value: mood, child: Text(mood)))
                  .toList(),
              onChanged: (value) => setState(() => selectedMood = value),
            ),
            SizedBox(height: 20),
            TextField(
              controller: noteController,
              decoration: InputDecoration(labelText: 'Optional Note'),
              maxLines: 3,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: selectedMood == null
                  ? null
                  : () {
                      final log = MoodLog(
                        mood: selectedMood!,
                        note: noteController.text,
                        date: DateTime.now(),
                      );
                      Navigator.pop(context, log);
                    },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            )
          ],
        ),
      ),
    );
  }
}
