import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class betterhome extends StatefulWidget {
  final List<Map<String, dynamic>> Date;
  const betterhome({required this.Date,
    super.key});

  @override
  State<betterhome> createState() => _betterhomeState();


}




class _betterhomeState extends State<betterhome> {
  bool isvisable = false;
  double opa = 0;
  final db = FirebaseFirestore.instance;
  Future<void> del(int pointer, List<Map<String, dynamic>> Dates) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("Dates")
        .where("date name", isEqualTo: Dates[pointer]["date name"])
        .get();

    for (var doc in snapshot.docs) {
      await doc.reference.delete();
      print("Deleted ${doc.id}");
    }
  }












  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    String format(DateTime d){
      String formatted = "${d.day}/${d.month}/${d.year}";
      return formatted; 
    }


    return Container(
        decoration: BoxDecoration(

        color: Colors.black
    ),
    child: ListView(
    children: [
      SizedBox(height: 15,),
      Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black
        ),

          child:Column(
      children: [
        Align(
          alignment: Alignment.center,


        child:Container(
          margin: EdgeInsets.only(left: 20, right: 20),



          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/heartbackground.jpg'),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
          borderRadius: BorderRadius.circular(40)
          ),
          child:Column(
            children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text("next up",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Pacifico',
                          fontSize: size.width * 0.06,
                          color: Color(0xFF2EE8D6),
                          fontWeight: FontWeight.w100

                      ),),

                  ),
                  Container(
                    alignment: Alignment.center,

                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('assets/images/ziggybear.png'),
                        fit: BoxFit.cover,


                      ),

                    ),

                  ),
              Container(
                alignment: Alignment.center,
                width: 125,
                height: 125,
                child: Text("${widget.Date[0]["date name"]}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont('Pacifico',
                      fontSize: size.width * 0.04,
                      color: Color(0xFF2EE8D6),
                      fontWeight: FontWeight.w100

                  ),),

              )

              ]
            )
          ),
              Stack(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            isvisable = !isvisable;
                            opa = opa == 0? 1:  0;
                          });

                        },
                        child: Column(
                children: [

                  Container(


                    child: Text("Future plans!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Pacifico',
                          fontSize: size.width * 0.06,
                          color: Color(0xFF2EE8D6),
                          fontWeight: FontWeight.w100

                      ),
                    ),
                  ),
                  

                  Container(
                    margin: EdgeInsets.only( bottom: 10, left: size.width*0.30),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:Text("1)${widget.Date[0]["date name"]}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont('Pacifico',
                                fontSize: size.width * 0.025,
                                color: Color(0xFF2EE8D6),
                                fontWeight: FontWeight.w100

                            ),),

                        ),
                        SizedBox(width: 5,),

                        Align(
                          alignment: Alignment.centerRight,
                          child:Text("${format(widget.Date[0]["time"].toDate())}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont('Pacifico',
                                fontSize: size.width * 0.025,
                                color: Color(0xFF2EE8D6),
                                fontWeight: FontWeight.w100

                            ),),

                        )
                      ],
                    ),


                  ),

                  Container(
                    margin: EdgeInsets.only( bottom: 10, left: size.width*0.30),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:Text("2)${widget.Date[1]["date name"]}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont('Pacifico',
                                fontSize: size.width * 0.025,
                                color: Color(0xFF2EE8D6),
                                fontWeight: FontWeight.w100

                            ),),

                        ),
                        SizedBox(width: 5,),

                        Align(
                          alignment: Alignment.centerRight,
                          child:Text("${format(widget.Date[1]["time"].toDate())}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont('Pacifico',
                                fontSize: size.width * 0.025,
                                color: Color(0xFF2EE8D6),
                                fontWeight: FontWeight.w100

                            ),),

                        )
                      ],
                    ),


                  ),
                  Container(
                    margin: EdgeInsets.only( bottom: 70, left: size.width*0.30),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:Text("3)${widget.Date[2]["date name"]}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont('Pacifico',
                                fontSize: size.width * 0.025,
                                color: Color(0xFF2EE8D6),
                                fontWeight: FontWeight.w100

                            ),),

                        ),
                        SizedBox(width: 5,),

                        Align(
                          alignment: Alignment.centerRight,
                          child:Text("${format(widget.Date[2]["time"].toDate())}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont('Pacifico',
                                fontSize: size.width * 0.025,
                                color: Color(0xFF2EE8D6),
                                fontWeight: FontWeight.w100

                            ),),

                        )
                      ],
                    ),


                  )
                ],

              )
                ),



                      Positioned(
                        top: 20,
                        right: 100,

                        child: AnimatedOpacity (
                          opacity:opa,
                        duration: const Duration(milliseconds: 700),

                        child:Container(
                          key: ValueKey(isvisable),
                          height: 500,
                          width: 195,
                          color: Colors.black,
                            child: ListView.separated(
                              separatorBuilder: (BuildContext context,
                              int index) => SizedBox(height: 15,),
                                  itemCount: 3,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Column(
                                        children: [
                                          SizedBox(height: 5,),

                                          Row(


                                            children: [
                                              Align(
                                    alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [

                                                Align(
                                                  alignment: Alignment.centerLeft,


                                                  child:Container(
                                                  width: size.width *0.15,
                                                  height: size.height*0.03,
                                                  decoration: BoxDecoration(

                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),

                                                  child: Text("${widget.Date[index]["date name"]}",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.getFont('Pacifico',
                                                        fontSize: size.width*0.03,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w100

                                                    ),
                                                  ),
                                                  ),
                                                ),
                                                SizedBox(width: 7,),
                                                Align(
                                                  alignment: Alignment.centerRight,


                                                  child:
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        del(index, widget.Date);


                                                      });

                                                    },
                                                    child:Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(

                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: Icon(Icons.delete, color: Colors.white, size: 30,),
                                                  ),
                                                )
                                                ),
                                              ],
                                            )


                                              )
                                          ],

                                          )
                                        ]
                                    );


                                  },
                              scrollDirection: Axis.vertical,

                            ),
                        ),
                      ),
                      )


                  ]
              )
              ]
          )
          )
        )

          ]
          )


    )
    ]
    )
    );

  }
}
