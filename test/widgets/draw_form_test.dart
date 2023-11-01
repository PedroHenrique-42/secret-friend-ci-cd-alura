import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secrete_friend_drawer/widgets/draw/draw_form_widget.dart';
import 'package:secrete_friend_drawer/widgets/dropdown_input_widget.dart';

void main() {
  group('DrawFormWidget', () {
    testWidgets('Renders correctly', (WidgetTester tester) async {
      final names = ['Alice', 'Bob'];
      final widget = DrawFormWidget(names: names);
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      // Verify that the widget renders as expected.
      expect(find.text('Quem vai tirar o papelzinho?'), findsOneWidget);
      expect(find.byType(DropdownInputWidget), findsOneWidget);
      expect(
          find.text('Clique em em sortear para ver quem é seu amigo secreto!'),
          findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('Draw name correctly', (WidgetTester tester) async {
      final names = ['Alice', 'Bob'];
      final widget = DrawFormWidget(names: names);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      // Enter a selected option in the Dropdown
      await tester.tap(find.byType(DropdownInputWidget));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Alice'));
      await tester.pumpAndSettle();

      // Verify if the selected option is displayed
      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('Sortear!'), findsOneWidget);

      // Tap the "Sortear!" button
      await tester.tap(find.text('Sortear!'));
      await tester.pumpAndSettle();

      // Verify if the name is displayed after drawing
      expect(find.text('Bob'), findsOneWidget);
      // Add more assertions as needed
      await tester.tap(find.text('Sortear!'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Ops!'), findsOneWidget);
    });
  });
}
