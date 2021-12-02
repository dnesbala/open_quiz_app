import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_quiz_app/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:open_quiz_app/presentation/screens/authentication/login_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationLogOut) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          }
        },
        child: Center(
          child: TextButton(
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationLogOutRequested());
              // context
              //     .read<AuthenticationBloc>()
              //     .add(AuthenticationLogOutRequested());
            },
            child: Text('Log Out'),
          ),
        ),
      ),
    );
  }
}
