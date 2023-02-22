import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:overnites/app/app.dart';
import 'package:overnites/app/factories/auth_service_factory.dart';
import 'package:overnites/app/util/snack_bar.dart';
import 'package:overnites/app/widgets/input.dart';
import 'package:overnites/l10n/l10n.dart';

class LoginState {
  factory LoginState() {
    _instance.password = '';

    return _instance;
  }

  LoginState._internal();

  static final LoginState _instance = LoginState._internal();

  String email = '';
  String password = '';
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _loginState = LoginState();

  final _formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.fromLTRB(35, 50, 35, 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                context.l10n.logIn,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Text(
                context.l10n.fillOutYourInfo,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 42),
                child: TextInputWidget(
                  hintText: 'Email',
                  initialValue: _loginState.email,
                  onChanged: (value) {
                    setState(() {
                      _loginState.email = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }

                    if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value)) {
                      return 'Email is invalid';
                    }

                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 23),
                child: TextInputWidget(
                  hintText: 'Password',
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _loginState.password = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }

                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 43, bottom: 33),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        final scaffoldMessengerState =
                            ScaffoldMessenger.of(context);
                        final loggedInText = context.l10n.loggedIn;

                        setState(() {
                          errorMessage = '';
                        });

                        if (_formKey.currentState!.validate()) {
                          if (!await (await AuthServiceFactory.make()).login(
                            _loginState.email,
                            _loginState.password,
                          )) {
                            setState(() {
                              errorMessage =
                                  'Invalid email/password combination';
                            });
                            return;
                          }

                          showSnackBar(
                            scaffoldMessengerState,
                            Text(loggedInText),
                          );

                          navigator.pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        minimumSize: const Size.fromHeight(40),
                      ),
                      child: Text(
                        context.l10n.logIn,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (errorMessage.isNotEmpty)
                      Text(
                        errorMessage,
                        style: const TextStyle(
                          color: Color(0xFFC06172),
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n.dontHaveAnAccountThenClick,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    TextSpan(
                      text: context.l10n.here,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pop();
                        },
                    ),
                    TextSpan(
                      text: context.l10n.toGetRedirectedToTheRegisterPage,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
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
