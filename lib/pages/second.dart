import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class second extends StatefulWidget {
  final String qoute1;
  final String qoute2;
  final String ranimage1;
  final String ranimage2;
  const second({
    required this.qoute1,
    required this.qoute2,
    required this.ranimage1,
    required this.ranimage2,
  super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
    Container(
    decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage('assets/images/sunbackground.jpg'),
    fit: BoxFit.cover,),
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
      child:Transform.rotate(angle: 345 * 3.1415927 / 180,

          child: Container(
        margin: EdgeInsets.only(left: 50),
        height: 225,
        width: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
            image: DecorationImage(image: AssetImage(widget.ranimage2),
                fit: BoxFit.cover)

        ),
        child:Row(
        children: [
        Expanded(child:
        Align(
    alignment: Alignment.centerRight,

    child: Container(
      margin: EdgeInsets.only(left: 90, top: 120),
          width: 125,
          height: 125,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/paperback.png"),
                  fit: BoxFit.cover)
          ),
      child:Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 5),
    child:Text("${widget.qoute1}",
        textAlign: TextAlign.center,
        softWrap: true,
        maxLines: 7,
        style: GoogleFonts.getFont('Pacifico',
            fontSize: 9,
            color: Colors.black,
            fontWeight: FontWeight.w100

        ),
      ),
      ),
                  )
                  )
    )
    ]
    )

          )

        ),
      ),
    )




    ]
    ),

        SizedBox(height: 30,),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Expanded(

                child: Align(
                  alignment: Alignment.centerLeft,
                  child:Transform.rotate(angle: -320,

                      child: Container(
                          margin: EdgeInsets.only(left: 50),
                          height: 225,
                          width: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(image: AssetImage(widget.ranimage1),
                                  fit: BoxFit.cover)

                          ),
                          child:Row(
                              children: [
                                Expanded(child:
                                Align(
                                    alignment: Alignment.centerLeft,

                                    child: Container(
                                      margin: EdgeInsets.only(right: 90, top: 120),
                                      width: 125,
                                      height: 125,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage("assets/images/paperback.png"),
                                              fit: BoxFit.cover)
                                      ),
                                      child:Container(
                                        margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                                        child:Text("${widget.qoute2}",
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          maxLines: 7,
                                          style: GoogleFonts.getFont('Pacifico',
                                              fontSize: 9,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w100

                                          ),
                                        ),
                                      ),
                                    )
                                )
                                )
                              ]
                          )

                      )

                  ),
                ),
              )




            ]
        )
      ],

    )
    )
    ]
    );
  }
}
