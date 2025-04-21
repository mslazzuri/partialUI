import 'package:flutter_test/flutter_test.dart';
import 'package:partial_ui/models/mood_log.dart';

void main() {
  test('MoodLog model stores mood, note, and date correctly', () {
    final log = MoodLog(mood: '😊 Happy', note: 'Great day!', date: DateTime(2025, 4, 21));

    expect(log.mood, '😊 Happy');
    expect(log.note, 'Great day!');
    expect(log.date, DateTime(2025, 4, 21));
  });
}
