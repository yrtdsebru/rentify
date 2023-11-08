// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignUpState {
  SignUpState(bool isDateSelected);

  get isDateSelected => null;
}

class SignUpInitial extends SignUpState {

  bool isDateSelected;

  SignUpInitial(bool bool, {
    required this.isDateSelected,
  }) : super(false);
}
