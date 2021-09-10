import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {

  static late AnimationController menuController;
  static bool isOpen = false;

  String _currentPage = '';

  String get currentPage{
    return _currentPage;
  }

  void setCurrentPageUrl( String routeName ) {
    _currentPage = routeName;
    Future.delayed(Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  // FIXME: 
  //! Tengo que reinicializar el menu controller aquí 
  static Animation<double> movement = Tween<double>( begin: -200, end: 0 )
    .animate( CurvedAnimation(parent: menuController, curve: Curves.easeInOut ) );

  static Animation<double> opacity = Tween<double>( begin: 0, end: 1 )
    .animate( CurvedAnimation(parent: menuController, curve: Curves.easeInOut ) );


  static void openMenu() {
    
    isOpen = true;
    menuController.reset();
    menuController.forward();

    print('menucontroller is playing ${  menuController.isAnimating } ');
    Future.delayed(Duration(milliseconds: 150 )).then((value){
      print('menucontroller is playing milli ${  menuController.isAnimating } ');
    });
  }

  static void closeMenu() {
    isOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {
    ( isOpen )
      ? menuController.reverse()
      : menuController.forward();

    isOpen = !isOpen;
  }


}