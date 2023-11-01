import 'dart:math';
import 'package:bloc/bloc.dart';

import 'name_draw_state.dart';

class NameDrawCubit extends Cubit<NameDrawState> {
  final List<String> names;
  final Map<String, String> drawnNames = {};

  NameDrawCubit(this.names) : super(NameDrawEmptyState());

  void drawNameForPerson(String personName) {
    if (names.isEmpty) {
      emit(NameDrawErrorState('A lista de nomes está vazia.'));
      return;
    }

    if (names.length == 1) {
      emit(NameDrawErrorState(
          'Apenas um nome na lista. Não é possível fazer um sorteio.'));
      return;
    }

    if (drawnNames.containsKey(personName)) {
      emit(NameDrawErrorState('Esta pessoa já sorteou um nome anteriormente.'));
      return;
    }

    final remainingNames = names
        .where((name) => !drawnNames.containsValue(name) && name != personName)
        .toList();

    if (remainingNames.isEmpty) {
      emit(NameDrawErrorState('Todos os nomes já foram sorteados. '));
      return;
    }

    final random = Random();
    final drawnName = remainingNames[random.nextInt(remainingNames.length)];
    drawnNames[personName] = drawnName;

    emit(NameDrawSuccessState(drawnName));
  }
}
