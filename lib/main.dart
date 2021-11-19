import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_quiz_app/config/theme.dart';
import 'package:open_quiz_app/data/datasources/auth_data_source.dart';
import 'package:open_quiz_app/domain/repositories/authentication_repository.dart';
import 'package:open_quiz_app/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:open_quiz_app/presentation/screens/authentication/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Quiz',
      theme: theme(),
      home: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(
          authenticationRepository: AuthenticationRepositoryImpl(
            authDataSource: AuthDataSourceImpl(),
          ),
        ),
        child: LoginScreen(),
      ),
    );
  }
}
