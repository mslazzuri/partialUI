import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:partial_ui/pages/log_mood_page.dart';

void main() {
  testWidgets('LogMoodPage allows mood selection and note entry', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LogMoodPage()));

    // Select a mood
    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle(); // Wait for dropdown to open
    await tester.tap(find.text('😊 Happy').last);
    await tester.pump();

    // Enter a note
    await tester.enterText(find.byType(TextField), 'Feeling awesome');

    // Save button should now be enabled
    final saveButton = find.widgetWithText(ElevatedButton, 'Save');
    expect(tester.widget<ElevatedButton>(saveButton).onPressed, isNotNull);
  });
}
