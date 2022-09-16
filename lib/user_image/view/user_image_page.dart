import 'package:flutter/material.dart';

class UserImagePage extends StatelessWidget {
  final String url;

  const UserImagePage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Image'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.network('$url'),
      ),
    );
  }
}
