import 'package:flutter/material.dart';
import 'package:open_quiz_app/config/app_theme.dart';
import 'package:open_quiz_app/presentation/screens/home/home_screen.dart';
import 'package:open_quiz_app/presentation/widgets/custom_elevated_button.dart';
import 'package:open_quiz_app/presentation/widgets/custom_textfield.dart';

class LoginGuestScreen extends StatefulWidget {
  const LoginGuestScreen({Key? key}) : super(key: key);

  @override
  State<LoginGuestScreen> createState() => _LoginGuestScreenState();
}

class _LoginGuestScreenState extends State<LoginGuestScreen> {
  int _ageValue = 18;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(color: AppTheme.secondaryTextColor),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, Guest',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: AppTheme.secondaryTextColor),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: AppTheme.secondaryTextColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * .2,
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full Name',
                        style: Theme.of(context).textTheme.bodyText2),
                    SizedBox(height: 8),
                    CustomTextField(),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text('Age',
                            style: Theme.of(context).textTheme.bodyText2),
                        Spacer(),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.all(8),
                          color: Colors.grey.shade200,
                          child: Text('$_ageValue',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Slider(
                      min: 1,
                      max: 80,
                      value: _ageValue.toDouble(),
                      onChanged: (double val) {
                        setState(() {
                          _ageValue = val.toInt();
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    CustomElevatedButton(
                      text: 'Sign In',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
