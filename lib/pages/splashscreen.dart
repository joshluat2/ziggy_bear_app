import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Auth_gate.dart';

class loading extends StatefulWidget {

  const loading({super.key,});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
     _timer = Timer(Duration(seconds: 3), (){
       Navigator.push(context, MaterialPageRoute(builder: (context) => AuthGate()));

     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,

        child: Center(
            child: Image.asset("assets/gifs/ziggyyload.gif")
        ),
      ),
    );
  }
}
