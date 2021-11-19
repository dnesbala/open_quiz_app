import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:open_quiz_app/domain/repositories/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

enum AuthStates { unknown, authenticated, unauthenticated }

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc({required this.authenticationRepository})
      : super(AuthenticationInitial()) {
    on<AuthenticationLogInRequested>(_onAuthenticationLogInRequested);
    on<AuthenticationLogOutRequested>(_onAuthenticationLogOutRequested);
  }

  void _onAuthenticationLogInRequested(
      AuthenticationLogInRequested event, Emitter emit) async {
    emit(AuthenticationInProgress());
    final user = await authenticationRepository.signInWithGoogle();
    if (user != null) {
      emit(AuthenticationSuccess(user: user));
    } else {
      emit(AuthenticationFailure(errorMessage: 'Sign In Failed'));
    }
  }

  void _onAuthenticationLogOutRequested(
      AuthenticationLogOutRequested event, Emitter emit) {
    emit(AuthenticationLogOut());
  }
}
