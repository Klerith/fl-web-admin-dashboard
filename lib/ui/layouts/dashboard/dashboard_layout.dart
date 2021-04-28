import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {

  final Widget child;

  const DashboardLayout({
    Key? key, 
    required this.child
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Dashboard', style: TextStyle( fontSize: 50 ),),
      ),
    );
  }
}