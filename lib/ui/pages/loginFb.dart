// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginFbPage extends StatefulWidget {
  LoginFbPage({super.key});

  @override
  State<LoginFbPage> createState() => _LoginFbPageState();
}

class _LoginFbPageState extends State<LoginFbPage> {
  Map<String, dynamic>? _userData;
  bool _checking = true;
  AccessToken? _accessToken;
  String imageUrl = '';

  @override
  void initState() {
    print('llegando a la pagina de loginFb');
    super.initState();
    _checkingIfLogget();
  }

  _checkingIfLogget() async {
    print('llegando a la _checkingIfLogget');
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      _checking = false;
    });
    if (accessToken != null) {
      print('llegando a la if (accessToken != null)');
      print('accessToken= ${accessToken.toJson()}');
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
        imageUrl = userData['picture']['data']['url'];
      });
    } else {
      print('llegando a la } else {');
      _login();
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
      imageUrl = userData['picture']['data']['url'];
    } else {
      print('result.status: ${result.status}');
      print('result.message: ${result.message}');
    }
    setState(() {
      _checking = false;
    });
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _userData != null
        ? print('llegando a mostrando datos de imagen:${_userData!['picture']}}')
        : print('llegando a mostrando datos de imagen:NULL}');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Facebook Auth'),
        ),
        body: Column(
          children: [
            _userData != null ? Text('name:${_userData!['name']}') : Container(),
            _userData != null ? Text('email:${_userData!['email']}') : Container(),
            _userData != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(imageUrl),
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
                child: Text(_userData != null ? 'LOGOUT' : 'LOGIN'), onPressed: _userData != null ? _logout : _login)
          ],
        ),
      ),
    );
  }
}
