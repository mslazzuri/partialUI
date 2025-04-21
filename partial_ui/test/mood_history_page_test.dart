import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:partial_ui/models/mood_log.dart';
import 'package:partial_ui/pages/mood_history_page.dart';

void main() {
  testWidgets('MoodHistoryPage displays list of mood logs', (WidgetTester tester) async {
    final sampleLogs = [
      MoodLog(mood: '😐 Meh', note: 'It was okay', date: DateTime.now()),
      MoodLog(mood: '😊 Happy', note: 'Great day', date: DateTime.now()),
    ];

    await tester.pumpWidget(MaterialApp(home: MoodHistoryPage(moodLogs: sampleLogs)));

    expect(find.text('😐 Meh'), findsOneWidget);
    expect(find.text('Great day'), findsOneWidget);
  });
}
