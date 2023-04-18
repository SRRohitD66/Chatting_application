import 'package:chatting_applicatrion/constants.dart';
import 'package:chatting_applicatrion/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatting_applicatrion/components/rounded_button.dart';
import 'package:flutter/services.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final messageTextController1=TextEditingController();
  final messageTextController2=TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool istrue = false;
  bool showspinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: showspinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  controller: messageTextController1,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                    //Do something with the user input.
                  },
                  decoration: kenteremail),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: messageTextController2,
                  cursorColor: Colors.black,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                    //Do something with the user input.
                  },
                  decoration: kenterpass),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: 'Log In',
                screen: () async {
                  setState(() {
                    showspinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                      setState(() {
                        showspinner = false;
                      });
                    }





                  } catch (e) {
                    messageTextController1.clear();
                    messageTextController2.clear();
                    setState(() {
                      showspinner = false;
                      istrue=true;
                    });
                  }
                },
                colour: Colors.lightBlueAccent,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
                  child: istrue
                      ? Text(
                          'Wrong Credentials',
                          style: TextStyle(color: Colors.red),
                        )
                      : Text(
                          'Login',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
