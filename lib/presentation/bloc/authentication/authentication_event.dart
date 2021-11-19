part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationLogInRequested extends AuthenticationEvent {}

class AuthenticationLogOutRequested extends AuthenticationEvent {}
