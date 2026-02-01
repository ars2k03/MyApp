import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Contact.dart';
import 'Home_Screen.dart';
import 'Projects.dart';
import 'chatbot.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text("Skills"),
      ),

    );
  }
}
