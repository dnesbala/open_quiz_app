part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final GoogleSignInAccount user;

  AuthenticationSuccess({required this.user});
}

class AuthenticationLogOut extends AuthenticationState {}

class AuthenticationInProgress extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String errorMessage;

  AuthenticationFailure({required this.errorMessage});
}
