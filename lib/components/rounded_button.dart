import 'package:flutter/material.dart';
import 'package:chatting_applicatrion/screens/registration_screen.dart';

class RoundedButton extends StatelessWidget {
   RoundedButton({required this.text,required this.screen,required this.colour});
  final String text;
  final Color colour;
   final void Function()? screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: screen,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
