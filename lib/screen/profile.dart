import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset("assets/images/1000001204.png",
        ),
      ),
    );
  }
}
