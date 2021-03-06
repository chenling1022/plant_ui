import 'package:flutter/material.dart';
import 'package:plant_ui_522/Signin_view.dart';
import 'package:plant_ui_522/home_page.dart';
import 'package:plant_ui_522/home_page2.dart';

import 'auth_servcie.dart';

class RootPage extends StatefulWidget {
  // auth is constantly changing
  RootPage({this.auth});
  AuthenticationServices auth;

  @override
  _RootPageState createState() => _RootPageState();
}

enum Authstatus { NOT_LOGIN, LOGIN, UNDETERMINED }

// ignore: camel_case_types
class _RootPageState extends State<RootPage> {
  // the  state is the three attribute _userID, _userEmail
  Authstatus authStatus = Authstatus.UNDETERMINED;
  @override
  void initState() {
    super.initState();
    print("goging through root page now");
    widget.auth.getCurrentUser().then((user) => {
          setState(() {
            // havnt logged in
            authStatus = user == null ? Authstatus.NOT_LOGIN : Authstatus.LOGIN;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case Authstatus.UNDETERMINED:
        return _showLoading();
        break;

      case Authstatus.NOT_LOGIN:
        return new SigninView(auth: widget.auth, onSignedIn: _onSignedIn);
      case Authstatus.LOGIN:
        return new HomePage(
          auth: widget.auth,
          onSignOut: _onSignedOut,
        );
      default:
        return _showLoading();
    }
  }

  void _onSignedIn() {
    setState(() {
      authStatus = Authstatus.LOGIN;
    });
  }

  void _onSignedOut() {
    setState(() {
      authStatus = Authstatus.NOT_LOGIN;
    });
  }

  Widget _showLoading() {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    ));
  }
}
