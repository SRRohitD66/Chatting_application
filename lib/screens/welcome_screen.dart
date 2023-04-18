import 'package:chatting_applicatrion/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatting_applicatrion/main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatting_applicatrion/screens/registration_screen.dart';
import 'package:chatting_applicatrion/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static String id='welcome_screen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState()
  {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 3),);
    animation=ColorTween(begin: Colors.red,end: Colors.blue).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {

      });

    });
  }
  void dispose()
  {
    controller.dispose();
    super.dispose();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 100,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Connect with your loved one',textStyle: TextStyle(fontSize: 25,)),
                    TypewriterAnimatedText('Chat with people around you',textStyle: TextStyle(fontSize: 25)),
                    TypewriterAnimatedText('Chat to see if your opinion matters',textStyle: TextStyle(fontSize: 25)),
                    TypewriterAnimatedText('Good Luck',textStyle: TextStyle(fontSize: 25)),
                  ],

                  onTap: () {
                    print("Tap Event");
                  },
                ),


              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(text: 'Log In',screen: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },colour: Colors.lightBlueAccent,),
            RoundedButton(text: 'Register', screen: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },colour: Colors.blueAccent,),
          ],
        ),
      ),
    );
  }
}

