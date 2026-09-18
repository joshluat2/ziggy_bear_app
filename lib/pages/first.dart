import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class first extends StatefulWidget {
  final String qoute1;
  final String qoute2;

  final String ranimage2;

  final String ranimage4;
  final String ranimage5;

  const first({
    required this.qoute1,
    required this.qoute2,
    required this.ranimage2,
    required this.ranimage4,
    required this.ranimage5,

    super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/scrapbook.png'),
            fit: BoxFit.cover,
            ),


        ),

          child: Column(

            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Expanded(

                child: Align(
                  alignment: Alignment.centerLeft,
                    child:Transform.rotate(angle: 345 * 3.1415927 / -90,
                  child: Container(
                    margin: EdgeInsets.only(left: 35),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(image: AssetImage(widget.ranimage2),
                      fit: BoxFit.cover)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                    Expanded(

                    child: Align(
                    alignment: Alignment.centerRight,
    child:Transform.rotate(angle: 345 * 3.1415927 / -179,

    child: Container(
                        margin: EdgeInsets.only(top: 140, right: 25),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/cutebackground.webp"),
                                fit: BoxFit.cover)

                        ),
                      ),
    )
                    )
                    ),

                        Expanded(

                            child: Align(
                                alignment: Alignment.centerRight,
    child:Transform.rotate(angle: 345 * 3.1415927 / -90,



    child: Container(
                                    margin: EdgeInsets.only(bottom: 130, right: 30),
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("assets/images/cutebackground.webp"),
                                            fit: BoxFit.cover)

                                    ),
                                  ),
                                )
                            )
                        ),

                      ]

                    ),


                    ),

                )

                )

                  ),
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Expanded(

                      child:Transform.rotate(angle: 345 * 3.1415927 / 190,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 100, left: 150),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(image: AssetImage(widget.ranimage5),
                                        fit: BoxFit.cover)
                                ),
                              )
                          )
                      )
                  ),
              Expanded(

                  child:Transform.rotate(angle: 345 * 3.1415927 / 190,
                      child: Align(
              alignment: Alignment.centerRight,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/paperback.png"),
                    fit: BoxFit.cover)
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 50, right: 50),
                    child:Text("${widget.qoute1}",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 7,
                    style: GoogleFonts.getFont('Pacifico',
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w100

    ),
                    ),
                  ),
                ),
              )
              )
              ),

                ]


              ),
              SizedBox(height: 15,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Expanded(

                        child:Transform.rotate(angle: 170,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/images/paperback.png"),
                                        fit: BoxFit.cover)
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(left: 50, right: 50),
                                  child:Text("${widget.qoute2}",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    maxLines: 7,
                                    style: GoogleFonts.getFont('Pacifico',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100

                                    ),
                                  ),
                                ),
                              ),
                            )
                        )
                    )
                  ]


              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Expanded(

                      child: Align(
                          alignment: Alignment.centerRight,
                          child:Transform.rotate(angle: 345 * 3.1415927 / 170,
                            child: Container(
                              margin: EdgeInsets.only(right: 65, bottom: 80),
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(image: AssetImage(widget.ranimage4),
                                      fit: BoxFit.cover)
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Expanded(

                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child:Transform.rotate(angle: 345 * 3.1415927 / -178,

                                              child: Container(
                                                margin: EdgeInsets.only(top: 190, right: 40),
                                                width: 35,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(image: AssetImage("assets/images/cutebackground.webp"),
                                                        fit: BoxFit.cover)

                                                ),
                                              ),
                                            )
                                        )
                                    ),

                                    Expanded(

                                        child: Align(
                                          alignment: Alignment.centerRight,
    child:Transform.rotate(angle: 345 * 3.1415927 / -90,



    child: Container(
                                            margin: EdgeInsets.only(bottom: 190, right: 50),
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(image: AssetImage("assets/images/cutebackground.webp"),
                                                    fit: BoxFit.cover)

                                            ),
                                          ),
                                        )
                                    )
                                    )

                                  ]

                              ),


                            ),

                          )

                      )

                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

  }
}
