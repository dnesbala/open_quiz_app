import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_quiz_app/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:open_quiz_app/presentation/screens/home_screen.dart';
import 'package:open_quiz_app/presentation/widgets/custom_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationSuccess) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            }
          },
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: size.height,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  image: DecorationImage(
                    image: AssetImage('assets/images/quiz_background.jpg'),
                    fit: BoxFit.fitHeight,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.dstATop),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * .1),
                  child: Text(
                    'Open Quiz',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                      shadows: [
                        Shadow(color: Colors.black, blurRadius: 0.7),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Let\'s Play Quiz...',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 25),
                    CustomElevatedButton(
                      text: 'Sign In With Google',
                      color: Colors.red,
                      icon: FontAwesomeIcons.google,
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(AuthenticationLogInRequested());
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'OR',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    CustomElevatedButton(
                      text: 'Sign In Anonymously',
                      icon: Icons.login_rounded,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
