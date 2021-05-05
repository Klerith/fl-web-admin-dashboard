import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class WhiteCard extends StatelessWidget {

  final String? title;
  final Widget child;
  final double? width;

  const WhiteCard({
    Key? key,
    required this.child,
    this.title,
    this.width,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width : null,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          if( title != null ) 
          ...[
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                title!,
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            Divider()
          ],

          child
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 5
      )
    ]
  );
}