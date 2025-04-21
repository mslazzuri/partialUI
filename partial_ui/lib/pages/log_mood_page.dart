import 'package:flutter/material.dart';
import '../models/mood_log.dart';

class LogMoodPage extends StatefulWidget {
  
  const LogMoodPage({super.key});
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
      appBar: AppBar(title: Text('Log Your Mood'), backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedMood,
              decoration: InputDecoration(
                labelText: "Select your mood",
                labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                ),
              ),
              icon: Icon(Icons.arrow_drop_down, color: Colors.deepOrange),
              dropdownColor: Colors.white,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              items: moods
                  .map((mood) => DropdownMenuItem(
                        value: mood,
                        child: Text(mood),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => selectedMood = value),
            ),

            
            SizedBox(height: 20),
            
            TextField(
              controller: noteController,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                labelText: 'Optional Note',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                ),
                hintText: 'Type something...',
                hintStyle: TextStyle(color: Colors.grey.shade400),
              ),
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
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepOrange[400]
              ),
              child: Text('Save', style: TextStyle(fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }
}
