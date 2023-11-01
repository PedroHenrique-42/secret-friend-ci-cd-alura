abstract class NameDrawState {}

class NameDrawEmptyState extends NameDrawState {}

class NameDrawSuccessState extends NameDrawState {
  final String name;

  NameDrawSuccessState(this.name);
}

class NameDrawErrorState extends NameDrawState {
  final String errorMessage;
  NameDrawErrorState(this.errorMessage);
}
