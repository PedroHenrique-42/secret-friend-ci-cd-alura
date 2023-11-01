import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secrete_friend_drawer/logic/logic.dart';

void main() {
  group('NameDrawCubit', () {
    test('Initial state is empty', () {
      final cubit = NameDrawCubit([]);
      expect(cubit.state, isA<NameDrawEmptyState>());
    });

    blocTest<NameDrawCubit, NameDrawState>(
      'Draws a name for a person',
      build: () => NameDrawCubit(['Alice', 'Bob']),
      act: (cubit) => cubit.drawNameForPerson('Alice'),
      expect: () => [isA<NameDrawSuccessState>()],
    );

    blocTest<NameDrawCubit, NameDrawState>(
      'Tries to draw a name when all names are drawn',
      build: () => NameDrawCubit(['Alice', 'Bob']),
      act: (cubit) {
        cubit.drawNameForPerson('Alice');
        cubit.drawNameForPerson('Bob');
        cubit.drawNameForPerson('Bob');
      },
      expect: () => [
        isA<NameDrawSuccessState>(),
        isA<NameDrawSuccessState>(),
        isA<NameDrawErrorState>(),
      ],
    );

    blocTest<NameDrawCubit, NameDrawState>(
      'Tries to draw the same person twice',
      build: () => NameDrawCubit(['Alice', 'Bob']),
      act: (cubit) {
        cubit.drawNameForPerson('Alice');
        cubit.drawNameForPerson('Alice');
      },
      expect: () => [
        isA<NameDrawSuccessState>(),
        isA<NameDrawErrorState>(),
      ],
    );
  });
}
