import 'package:bloc/bloc.dart';

class LoginCubit extends Cubit<int> {
  LoginCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
