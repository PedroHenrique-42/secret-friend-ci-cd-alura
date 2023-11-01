import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secrete_friend_drawer/widgets/home/home_form_widget.dart';

void main() {
  group('HomeFormWidget', () {
    testWidgets('Renders correctly', (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HomeFormWidget(),
          ),
        ),
      );

      // Verify that the widget renders as expected.
      expect(find.text('Vamos começar!'), findsOneWidget);
      expect(find.text('Insira os nomes dos participantes'), findsOneWidget);
      expect(find.byIcon(Icons.person_add_rounded), findsOneWidget);
    });

    testWidgets('Adds a name to the list', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HomeFormWidget(),
          ),
        ),
      );

      final addNameButton = find.text('Adicionar');
      final inputField = find.byType(TextField);

      await tester.enterText(inputField, 'John');
      await tester.tap(addNameButton);

      await tester.pumpAndSettle();

      // Verify that the name 'John' is added to the list.
      expect(find.text('John'), findsOneWidget);
    });

    testWidgets('Removes a name from the list', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HomeFormWidget(),
          ),
        ),
      );

      // Add a name to the list.
      await tester.enterText(find.byType(TextField), 'Alice');
      await tester.tap(find.text('Adicionar'));
      await tester.pumpAndSettle();

      // Verify that 'Alice' is in the list.
      expect(find.text('Alice'), findsOneWidget);

      // Remove 'Alice' from the list.
      await tester.tap(find.text('Alice'));
      await tester.pumpAndSettle();

      // Verify that 'Alice' is removed from the list.
      expect(find.text('Alice'), findsNothing);
    });
  });
}
