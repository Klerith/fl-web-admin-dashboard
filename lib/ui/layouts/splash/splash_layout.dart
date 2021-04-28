import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox( height: 20 ),
            Text('Checking...')
          ],
        ),
      ),
    );
  }
}