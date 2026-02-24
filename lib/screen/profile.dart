import 'package:flutter/material.dart';

import '../config/palette.dart';

class Profile extends StatelessWidget {
  final Map<String, dynamic>? userData;
  const Profile({super.key, this.userData});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: userData!['avatar_url'] == null ?
            const CircleAvatar(
              radius: 150,
              backgroundColor: Palette.primary,
              child: Icon(
                Icons.person,
                size: 150,
                color: Colors.white,
              )
            )
            : Image.network(userData!['avatar_url']),
      ),
    );
  }
}
