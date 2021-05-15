import 'package:flutter/material.dart';


import 'package:admin_dashboard/api/CafeApi.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;


  AuthProvider() {
    this.isAuthenticated();
  }


  login( String email, String password ) {

    // TODO: Petición HTTP
    this._token = 'adjkfhadfyiu12y3hjasd.ajskhdaks.kjshdkjas';
    LocalStorage.prefs.setString('token', this._token! );
    
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register( String email, String password, String name ) {
    
    final data = {
      'nombre': name,
      'correo': email,
      'password': password
    };

    CafeApi.post('/usuarios', data ).then(
      (json) {
        print(json);

        
      }
      
    ).catchError( (e){
      print('error en: $e');
      // TODO: Mostrar notificación de error
    });
    
    
    // authStatus = AuthStatus.authenticated;
    // LocalStorage.prefs.setString('token', this._token! );
    // NavigationService.replaceTo(Flurorouter.dashboardRoute);
    // notifyListeners();

  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // TODO: ir al backend y comprobar si el JWT es válido
    
    await Future.delayed(Duration(milliseconds: 1000 ));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }


}
