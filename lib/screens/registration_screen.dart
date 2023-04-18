import 'package:chatting_applicatrion/constants.dart';
import 'package:chatting_applicatrion/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatting_applicatrion/components/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loading_overlay/loading_overlay.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static String id='registration_screen';
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>  with SingleTickerProviderStateMixin{
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  bool showspinner=false;
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
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                onChanged: (value) {

                  //Do something with the user input.
                  email=value;
                },
                decoration: kenteremail,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                cursorColor: Colors.black,
                obscureText: true,
                  textAlign: TextAlign.center,
                onChanged: (value) {
                  password=value;
                  //Do something with the user input.
                },
                decoration: kenterpass
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(text: 'Register', screen: ()async{
                setState(() {
                  showspinner=true;
                });
                try{

               final newUser= await _auth.createUserWithEmailAndPassword(email: email, password: password);

               showspinner=false;
               if(newUser!=null)
                 {

                   Navigator.pushNamed(context, ChatScreen.id);

                 }
               setState(() {
                 showspinner=false;
               });
                }
                catch(e)
                {
                  print(e);
                }
              },colour: Colors.blueAccent,),
            ],
          ),
        ),
      ),
    );
  }
}
