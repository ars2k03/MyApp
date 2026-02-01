import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Home_Screen.dart';
import 'Projects.dart';
import 'Skills.dart';
import 'chatbot.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text("Contact"),
      ),

    );
  }
}
