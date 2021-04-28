

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {

  String? _token;


  login( String email, String password ) {

    // TODO: Petición HTTP
    this._token = 'adjkfhadfyiu12y3hjasd.ajskhdaks.kjshdkjas';
    LocalStorage.prefs.setString('token', this._token! );
    
    // TODO: Navegar al dashboard
    
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if( token == null ) {
      return false;
    }

    // TODO: ir al backend y comprobar si el JWT es válido
    
    await Future.delayed(Duration(milliseconds: 1000 ));

    return true;
  }


}
