import 'package:flutter/material.dart';
import '../models/mood_log.dart';
import 'log_mood_page.dart';
import 'mood_history_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MoodLog> moodLogs = [];

  void _addMood(MoodLog log) {
    setState(() {
      moodLogs.insert(0, log); // most recent first
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = moodLogs.isNotEmpty &&
            moodLogs.first.date.day == DateTime.now().day
        ? moodLogs.first
        : null;

    return Scaffold(
      appBar: AppBar(title: Text('Mood Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello 👋', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 16),
            today != null
                ? Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      title: Text("Today's Mood: ${today.mood}"),
                      subtitle: Text(today.note),
                    ),
                  )
                : Text("You haven't logged your mood today."),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LogMoodPage()),
                );
                if (result is MoodLog) _addMood(result);
              },
              icon: Icon(Icons.add),
              label: Text('Log Mood'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MoodHistoryPage(moodLogs: moodLogs),
                  ),
                );
              },
              child: Text('View Mood History'),
            )
          ],
        ),
      ),
    );
  }
}
