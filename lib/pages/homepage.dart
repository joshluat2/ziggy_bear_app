import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joshesapp/pages/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:joshesapp/firebase_options.dart';



class home extends StatefulWidget {
  final Function(int) onPageChange;
  const home({super.key, required this.onPageChange});

  @override
  State<home> createState() => _Homestate();
}


@override
class _Homestate extends State<home> {




Widget build(BuildContext context) {

    List<int> ques = [1,2,3,4,5,6];



    return Container(
      decoration: BoxDecoration(

          color: Color(0xFFFFB2FF)
      ),
      child: ListView(
        children: [
          Container(
              margin: EdgeInsets.all(30),

              width: 10,
              height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/heartbackground.jpg'),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
                spreadRadius: 5,
                blurRadius: 7
            )
]
      ),
            child: Column(
              children: [
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Align(
                  child: Container(

                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(left: 30),
                    width: 125,
                    height: 125,
                    child: Text("next up",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Pacifico',
                          fontSize: 25,
                          color: Color(0xFF2EE8D6),
                          fontWeight: FontWeight.w100

                      ),),                  ),

                ),
                Align(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(right: 35, top: 10, bottom: 10),

                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
    image: DecorationImage(image: AssetImage('assets/images/placeholder image.jpg'),
    fit: BoxFit.cover,


                    ),

                    ),

                )
                )

              ],

                ),

      ],

          )
          ),
          SizedBox(height: 50,),


          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Align(
    child:InkWell(
    onTap: () {
      widget.onPageChange(3);

      print(currentpage);
      },
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 30),
                  width: 175,
                  height: 100,
                  color: Colors.black,

                ),
              ),
              ),

              Align(
              child:InkWell(
              onTap: () {
  widget.onPageChange(2);

  print(currentpage);
  },
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 30),
                  width: 175,
                  height: 100,
                  color: Colors.black,


                ),
              ),
              ),

            ],
          ),
          SizedBox(height: 10,),


          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
         child: Row(


            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Align(
                  child: Text("Something silly and new",
                    style: GoogleFonts.getFont('Pacifico',
                        fontSize: 15,
                        color: Color(0xFF2EE8D6),
                        fontWeight: FontWeight.w100

                    ),
                  )
              ),

              Align(
                  alignment: Alignment.centerRight,


                  child: Text("Something silly and new",
                  style: GoogleFonts.getFont('Pacifico',
                      fontSize: 15,
                      color: Color(0xFF2EE8D6),
                      fontWeight: FontWeight.w100

                  ),)


                ),


            ],
          )
          ),
          SizedBox(height: 30,),

          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            width: 400,
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/Timelinebackground.png'),
                fit: BoxFit.cover,


              ),
            ),
            child: ListView.separated(


    separatorBuilder: (BuildContext context,
    int index) => SizedBox(height: 15,),
    itemCount: ques.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          SizedBox(height: 5,),
          Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(

              color: Color(0xFFB80DB8),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Align(
                  child: Container(


                    margin: EdgeInsets.only(left: 30, right: 30),


                    child:Text("dd/mm/yyyy",
                      style: GoogleFonts.getFont('Pacifico',
                          fontSize: 15,
                          color: Color(0xFF2EE8D6),
                          fontWeight: FontWeight.w100

                      ),),
                  ),
                ),

                Align(
                  child: Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child:Text("Date name",
                      style: GoogleFonts.getFont('Pacifico',
                          fontSize: 15,
                          color: Color(0xFF2EE8D6),
                          fontWeight: FontWeight.w100

                      ),),



                  ),
                )


              ],
            ),
          )
        ],
      );

    },

    )
    )


    ],

      ),

    );
  }
}
