import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/CafeApi.dart';

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {

  List<Categoria> categorias = [];


  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResp = CategoriesResponse.fromMap(resp);

    this.categorias = [...categoriesResp.categorias];

    print( this.categorias );

    notifyListeners();
  }

  Future newCategory( String name ) async {

    final data = {
      'nombre': name
    };

    try {

      final json = await CafeApi.post('/categorias', data );
      final newCategory = Categoria.fromMap(json);

      categorias.add( newCategory );
      notifyListeners();
      
    } catch (e) {
      throw 'Error al crear categoria';
    }

  }

  Future updateCategory( String id, String name ) async {

    final data = {
      'nombre': name
    };

    try {

      await CafeApi.put('/categorias/$id', data );
    
      this.categorias = this.categorias.map(
        (category) {
          if ( category.id != id ) return category;
          category.nombre = name;
          return category;
        }
      ).toList();
      
      notifyListeners();
      
    } catch (e) {
      throw 'Error al crear categoria';
    }

  }

  Future deleteCategory( String id ) async {

    try {

      await CafeApi.delete('/categorias/$id', {} );
    
      categorias.removeWhere((categoria) => categoria.id == id );
     
      notifyListeners();
      
      
    } catch (e) {
      print(e);
      print('Error al crear categoria');
    }

  }

}