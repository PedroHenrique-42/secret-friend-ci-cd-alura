import 'package:bloc/bloc.dart';

class NamesToDrawCubit extends Cubit<List<String>> {
  NamesToDrawCubit() : super([]);

  String? add(String name) {
    if (name.isEmpty) {
      return 'O nome não pode ser vazio!';
    }

    final names = List<String>.from(state);

    if (names.contains(name)) {
      return 'Este nome já foi adicionado!';
    }

    emit([...names, name]);

    return null;
  }

  void remove(String name) {
    final names = List<String>.from(state);

    if (names.contains(name)) {
      names.remove(name);
      emit([...names]);
    }
  }
}
