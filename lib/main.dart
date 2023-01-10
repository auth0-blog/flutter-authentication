/// -----------------------------------
///          External Packages
/// -----------------------------------

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:auth0_flutter/auth0_flutter.dart';

/// -----------------------------------
///           Profile Widget
/// -----------------------------------

class Profile extends StatelessWidget {
  final Future<void> Function() logoutAction;
  final UserProfile? user;

  const Profile(this.logoutAction, this.user, {final Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 4),
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(user?.pictureUrl.toString() ?? ''),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Name: ${user?.name}'),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () async {
            await logoutAction();
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}

/// -----------------------------------
///            Login Widget
/// -----------------------------------

class Login extends StatelessWidget {
  final Future<void> Function() loginAction;
  final String loginError;

  const Login(this.loginAction, this.loginError, {final Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () async {
            await loginAction();
          },
          child: const Text('Login'),
        ),
        Text(loginError ?? ''),
      ],
    );
  }
}

/// -----------------------------------
///                 App
/// -----------------------------------

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({final Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

/// -----------------------------------
///              App State
/// -----------------------------------

class _MyAppState extends State<MyApp> {
  Credentials? _credentials;
  late Auth0 auth0;

  bool isBusy = false;
  late String errorMessage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth0 Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Auth0 Demo'),
        ),
        body: Center(
          child: isBusy
              ? const CircularProgressIndicator()
              : _credentials != null
                  ? Profile(logoutAction, _credentials?.user)
                  : Login(loginAction, errorMessage),
        ),
      ),
    );
  }

  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';
    });

    try {
      final credentials = await auth0.webAuthentication(scheme: 'flutterdemo').login();

      setState(() {
        isBusy = false;
        _credentials = credentials;
      });
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        errorMessage = e.toString();
      });
    }
  }

  Future<void> logoutAction() async {
    await auth0.webAuthentication(scheme: 'flutterdemo').logout();

    setState(() {
      _credentials = null;
    });
  }

  @override
  void initState() {
    super.initState();

    auth0 = Auth0('dev-bajcmartinez.eu.auth0.com', '4OZnEzQiVE8t1YguYMKsVReXDdHiH5Cj');
    errorMessage = '';
  }
}
