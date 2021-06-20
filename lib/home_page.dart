import 'package:flutter/material.dart';
import 'package:plant_ui_522/auth_servcie.dart';
import 'package:plant_ui_522/home_page2.dart';

// homePage login alr

//logined in but not verified
//https://pub.dev/packages/convex_bottom_bar/versions/2.0.0#custom-example

const primaryColor = Colors.greenAccent;

class HomePage extends StatefulWidget {
  AuthenticationServices auth;
  VoidCallback onSignOut; //other widget function can giev to this widget
  String userID, userEmail;

  HomePage({Key key, this.auth, this.onSignOut, this.userID, this.userEmail})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isEmailVerified = false;
  int selectedpage;

  @override
  void initState() {
    super.initState();
    _checkEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white10,
        appBar: new AppBar(
          title: Text("MosQUITo", textAlign: TextAlign.center),
          actions: [
            FlatButton(
              onPressed: _signOut,
              child: Text("SignOut"),
              onLongPress: _signOut,
            )
          ],
        ),
        body: MainPage());
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _showVerifyEmailDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("please verify your email"),
            content: new Text("We need you verify email to"),
            actions: [
              // ignore: deprecated_member_use
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _sendVerifyEmail();
                  },
                  child: Text("send")),
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("dismiss")),
            ],
          );
        });
  }

  void _sendVerifyEmail() {
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailSentDialog() {
    AlertDialog(
      title: new Text("Thank you"),
      content: new Text("Link has been sent to your email"),
      actions: [
        new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("ok")),
      ],
    );
  }

  void _signOut() async {
    try {
      await widget.auth.signOut();

      widget.onSignOut();
    } catch (e) {
      print(e);
    }
  }
}
