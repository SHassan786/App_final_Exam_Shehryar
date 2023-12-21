import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      print("in login submitted bloc");
      final user =
          await authRepository.signInWithEmail(event.email, event.password);
      if (user != null) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(error: 'Authentication failed'));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
