import 'package:flutter/material.dart';
import '../models/mood_log.dart';
import 'log_mood_page.dart';
import 'mood_history_page.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});
  
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
      
      appBar: AppBar(title: Text('Mood Tracker'), backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Center(child: Text('Hello 👋', style: Theme.of(context).textTheme.headlineMedium)),
            
            SizedBox(height: 16),
            today != null
                ? Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    color: Colors.grey[200],
                    child: ListTile(
                      title: Text("Today's Mood: ${today.mood}"),
                      subtitle: Text(today.note),
                    ),
                  )
                : Center(child: Text("You haven't logged your mood today.")),
            Spacer(),
            
            ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LogMoodPage()),
                );
                if (result is MoodLog) _addMood(result);
              },
              icon: Icon(Icons.add, color: Colors.white, size: 20),
              label: Text('Log Mood', style: TextStyle(fontSize: 16),),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepOrange[400]
              ),
            ),
            
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(Colors.deepOrange),
                overlayColor: WidgetStateProperty.all(Colors.deepOrange.withAlpha(30)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MoodHistoryPage(moodLogs: moodLogs),
                  ),
                );
              },
              child: Center(child: Text('View Mood History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}
