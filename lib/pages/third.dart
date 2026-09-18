import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class thrid extends StatefulWidget {
  final String qoute;
  final String ranimage1;
  final String ranimage2;
  const thrid({
    required this.qoute,
    required this.ranimage1,

    required this.ranimage2,
    super.key});

  @override
  State<thrid> createState() => _thridState();
}

class _thridState extends State<thrid> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
    Container(
    decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage('assets/images/ghostbackground.jpg'),
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
    margin: EdgeInsets.only(left: 15),
    height: 225,
    width: 175,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage(widget.ranimage2),
            fit: BoxFit.cover)

    ),
    )
    )
    )

    ),
      Expanded(

          child: Align(
              alignment: Alignment.centerRight,
              child:Transform.rotate(angle: 345 * 3.1415927 / -180,

                  child: Container(
                    margin: EdgeInsets.only(right: 40),
                    height: 225,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),

                    ),
                    child: Image(image: AssetImage("assets/images/pokemon-love.gif")),
                  )
              )
          )

      )
    ]


      ),
      SizedBox(height: 30,),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Expanded(

                child:Transform.rotate(angle: 345 * 3.1415927 / -170,
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
                          child:Text("${widget.qoute}",
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


            Expanded(

                child: Align(
                    alignment: Alignment.centerRight,
                    child:Transform.rotate(angle: 345 * 3.1415927 / -180,

                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 225,
                          width: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(image: AssetImage(widget.ranimage1),
                                  fit: BoxFit.cover)

                          ),
                        )
                    )
                )

            )
          ]


      )
    ]
    )
    )
        ]
    );
  }
}
