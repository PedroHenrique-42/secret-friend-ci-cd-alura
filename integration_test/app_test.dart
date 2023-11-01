import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:secrete_friend_drawer/main.dart';
import 'package:secrete_friend_drawer/widgets/widgets.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  testWidgets('E2E - All app flow', (WidgetTester tester) async {
    // Scenario 1: Check initial state in HomeFormWidget
    await tester.pumpWidget(const MyApp());
    expect(find.byType(HomeFormWidget), findsOneWidget);

    // Check the presence of UI elements
    expect(find.text('Vamos começar!'), findsOneWidget);
    expect(find.text('Insira os nomes dos participantes'), findsOneWidget);
    expect(find.byIcon(Icons.person_add_rounded), findsOneWidget);
    expect(find.text('Iniciar brincadeira!'), findsNothing);

    // Scenario 2: Add names to HomeFormWidget
    final addNameButton = find.byKey(const Key('add-button'));
    final inputField = find.byType(InputWidget);
    final startButton = find.byKey(const Key('start-button'));

    await tester.enterText(inputField, 'John');
    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.pump();
    await tester.dragUntilVisible(addNameButton,
        find.byType(SecondaryButtonWidget), const Offset(0, 100));

    await tester.tap(addNameButton);
    await tester.pumpAndSettle();
    expect(find.text('John'), findsOneWidget);
    expect(startButton, findsOneWidget);

    await tester.tap(inputField);
    await tester.pumpAndSettle();
    await tester.enterText(inputField, 'Alice');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    await tester.dragUntilVisible(addNameButton,
        find.byType(SecondaryButtonWidget), const Offset(0, 100));
    await tester.tap(addNameButton);
    await tester.pumpAndSettle();
    expect(find.text('Alice'), findsOneWidget);

    await tester.tap(inputField);
    await tester.pumpAndSettle();
    await tester.enterText(inputField, 'Bob');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    await tester.dragUntilVisible(addNameButton,
        find.byType(SecondaryButtonWidget), const Offset(0, 100));
    await tester.tap(addNameButton);
    await tester.pumpAndSettle();
    expect(find.text('Bob'), findsOneWidget);

    // Remove 'Bob' name
    await tester.tap(find.text('Bob'));
    await tester.pumpAndSettle();
    expect(find.text('Bob'), findsNothing);

    await tester.tap(startButton);
    await tester.pumpAndSettle();

    expect(find.byType(DrawFormWidget), findsOneWidget);
    expect(find.text('Quem vai tirar o papelzinho?'), findsOneWidget);
    expect(find.byType(DropdownInputWidget), findsOneWidget);
    expect(find.text('Clique em em sortear para ver quem é seu amigo secreto!'),
        findsOneWidget);

    //  Scenario 4: Select 'Alice' and draw a name
    final dropdownInput = find.byType(DropdownInputWidget);

    await tester.dragUntilVisible(
        dropdownInput, find.byType(DropdownInputWidget), const Offset(0, 100));
    await tester.tap(dropdownInput);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Alice'));
    await tester.pumpAndSettle();

    await tester.dragUntilVisible(find.text('Sortear!'),
        find.byType(ElevatedButton), const Offset(0, 500));
    await tester.pumpAndSettle();

    expect(find.text('Alice'), findsOneWidget);
    expect(find.text('Sortear!'), findsOneWidget);

    // Scenario 5: Draw a name and check the result
    await tester.tap(find.text('Sortear!'));
    await tester.pumpAndSettle();

    expect(find.text('John'), findsOneWidget);

    // Scenario 6: Select 'Bob' and draw a name
    await tester.tap(dropdownInput);
    await tester.pumpAndSettle();
    await tester.tap(find.text('John').last);
    await tester.pumpAndSettle();

    // Scenario 7: Draw a name and check the result
    await tester.tap(find.text('Sortear!'));
    await tester.pumpAndSettle();
    expect(find.text('Alice'), findsOneWidget);
  });
}


// await tester.dragUntilVisible(find.byKey(const Key('start-button')),
//         find.byType(PrimaryButtonWidget), const Offset(0, 200));
//     await tester.pumpAndSettle();
//     expect(find.byKey(const Key('start-button')), findsOneWidget);
//     await tester.pumpAndSettle();

//     await tester.tap(inputField);
//     await tester.pumpAndSettle();
//     await tester.enterText(inputField, 'Alice');
//     await tester.tap(addNameButton);
//     await tester.pumpAndSettle();
//     expect(find.text('Alice'), findsOneWidget);

//     await tester.tap(inputField);
//     await tester.pumpAndSettle();
//     await tester.enterText(inputField, 'Bob');
//     await tester.tap(addNameButton);
//     await tester.pumpAndSettle();
//     expect(find.text('Bob'), findsOneWidget);

//     // Remove 'Bob' name
//     await tester.tap(find.text('Bob'));
//     await tester.pumpAndSettle();
//     expect(find.text('Bob'), findsNothing);

//     await tester.dragUntilVisible(find.byKey(const Key('start-button')),
//         find.byType(PrimaryButtonWidget), const Offset(0, 200));

//     await tester.tap(find.byKey(const Key('start-button')));
//     await tester.pumpAndSettle();

//     expect(find.byType(DrawFormWidget), findsOneWidget);
//     expect(find.text('Quem vai tirar o papelzinho?'), findsOneWidget);
//     expect(find.byType(DropdownInputWidget), findsOneWidget);
//     expect(find.text('Clique em em sortear para ver quem é seu amigo secreto!'),
//         findsOneWidget);

//     // Scenario 4: Select 'Alice' and draw a name
//     final dropdownInput = find.byType(DropdownInputWidget);
//     await tester.tap(dropdownInput);
//     await tester.pumpAndSettle();
//     await tester.tap(find.text('Alice'));
//     await tester.pumpAndSettle();

//     await tester.dragUntilVisible(find.text('Sortear!'),
//         find.byType(ElevatedButton), const Offset(0, 500));
//     await tester.pumpAndSettle();

//     expect(find.text('Alice'), findsOneWidget);
//     expect(find.text('Sortear!'), findsOneWidget);

//     // Scenario 5: Draw a name and check the result
//     await tester.tap(find.text('Sortear!'));
//     await tester.pumpAndSettle();

//     expect(find.text('John'), findsOneWidget);

//     // Scenario 6: Select 'Bob' and draw a name
//     await tester.tap(dropdownInput);
//     await tester.pumpAndSettle();
//     await tester.tap(find.text('John').last);
//     await tester.pumpAndSettle();

//     // Scenario 7: Draw a name and check the result
//     await tester.tap(find.text('Sortear!'));
//     await tester.pumpAndSettle();
//     expect(find.text('Alice'), findsOneWidget);