import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/CafeApi.dart';

import 'package:admin_dashboard/models/usuario.dart';


class UsersProvider extends ChangeNotifier {

  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  
  UsersProvider() {
    this.getPaginatedUsers();
  }


  getPaginatedUsers() async {
    
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResp = UsersResponse.fromMap(resp);

    this.users = [ ... usersResp.usuarios ];

    isLoading = false;


    notifyListeners();

  }


  void sort<T>( Comparable<T> Function( Usuario user ) getField  ) {

    users.sort(( a, b ) {

        final aValue = getField( a );
        final bValue = getField( b );

        return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    notifyListeners();

  }

}