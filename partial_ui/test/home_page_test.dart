import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:partial_ui/pages/home_page.dart';

void main() {
  testWidgets('HomePage shows welcome text and buttons', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    expect(find.text('Hello 👋'), findsOneWidget);
    expect(find.text("You haven't logged your mood today."), findsOneWidget);
    expect(find.text('Log Mood'), findsOneWidget);
    expect(find.text('View Mood History'), findsOneWidget);
  });
}
