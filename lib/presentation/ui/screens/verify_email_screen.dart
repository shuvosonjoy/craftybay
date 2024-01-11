import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Email',style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
