import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '404 - Página no encontrada',
          style: GoogleFonts.montserratAlternates(
            fontSize: 50,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}