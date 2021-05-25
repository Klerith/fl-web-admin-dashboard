import 'package:flutter/material.dart';



class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();


  static showSnackbarError( String message ) {

    final snackBar = new SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text( message, style: TextStyle( color: Colors.white, fontSize: 20 ) )
    );

    messengerKey.currentState!.showSnackBar(snackBar);

  }

  static showSnackbar( String message ) {

    final snackBar = new SnackBar(
      content: Text( message, style: TextStyle( color: Colors.white, fontSize: 20 ) )
    );

    messengerKey.currentState!.showSnackBar(snackBar);

  }

  static showBusyIndicator( BuildContext context ) {

    final AlertDialog dialog = AlertDialog(
      content: Container(
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    showDialog(context: context, builder: ( _ )=> dialog );

  }


}