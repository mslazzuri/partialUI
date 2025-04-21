import 'package:flutter/material.dart';
import '../models/mood_log.dart';

class MoodHistoryPage extends StatelessWidget {
  final List<MoodLog> moodLogs;

  const MoodHistoryPage({Key? key, required this.moodLogs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood History')),
      body: moodLogs.isEmpty
          ? Center(child: Text('No mood logs yet.'))
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: moodLogs.length,
              itemBuilder: (context, index) {
                final log = moodLogs[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Text(log.mood, style: TextStyle(fontSize: 24)),
                    title: Text(log.note.isNotEmpty ? log.note : 'No note'),
                    subtitle: Text(
                      "${log.date.toLocal().toString().split(' ')[0]}",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
