import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secrete_friend_drawer/logic/names_to_draw/names_to_draw_cubit.dart';

void main() {
  group('NamesToDrawCubit', () {
    test('initial state is empty list', () {
      expect(NamesToDrawCubit().state, []);
    });

    blocTest<NamesToDrawCubit, List<String>>(
      'add - emits name when it is not empty and not already in the list',
      build: () => NamesToDrawCubit(),
      act: (cubit) => cubit.add('John'),
      expect: () => [
        equals(['John'])
      ],
    );

    blocTest<NamesToDrawCubit, List<String>>(
      'add - does not emit when name is empty',
      build: () => NamesToDrawCubit(),
      act: (cubit) => cubit.add(''),
      expect: () => [],
    );

    blocTest<NamesToDrawCubit, List<String>>(
      'add - does not emit when name is already in the list',
      build: () => NamesToDrawCubit(),
      act: (cubit) {
        cubit.add('Alice');
        cubit.add('Alice');
        cubit.add('Bob');
      },
      expect: () => [
        equals(['Alice']),
        equals(['Alice', 'Bob']),
      ],
    );

    blocTest<NamesToDrawCubit, List<String>>(
      'remove - emits updated list without the specified name',
      build: () => NamesToDrawCubit(),
      act: (cubit) {
        cubit.add('Alice');
        cubit.add('Bob');
        cubit.remove('Alice');
      },
      expect: () => [
        equals(['Alice']),
        equals(['Alice', 'Bob']),
        equals(['Bob']),
      ],
    );
  });
}
