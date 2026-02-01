import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final String imagePath = "assets/images/me_2.png";
  const ImageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Hero(
          tag: 'profile-pic',
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}