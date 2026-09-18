import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loadingwait extends StatefulWidget {
  const loadingwait({super.key});

  @override
  State<loadingwait> createState() => _loadingwaitState();
}

class _loadingwaitState extends State<loadingwait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        
        child: Column(
          children:[
            Center(
                child: Text("loading please wait!",textAlign: TextAlign.center,
                  style: GoogleFonts.getFont('Pacifico',
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w100

                  ),)
            ),
            Center(
                child: Image.asset("assets/gifs/loadingscreen.gif")
            ),
          ]
        ),
      ),
    );
  }
}
