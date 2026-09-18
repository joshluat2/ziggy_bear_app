import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/emails.dart';
import 'start.dart';



class finalhome extends StatefulWidget {
  final List<Map<String, dynamic>> Date;
  final Function updateDates;

  const finalhome({super.key, required this.Date, required this.updateDates});

  @override
  State<finalhome> createState() => _finalhomeState();
}



class _finalhomeState extends State<finalhome> {
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
    widget.updateDates();


  }

  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {








    String format(DateTime d){
      String formatted = "${d.day}/${d.month}/${d.year}";
      return formatted;
    }
    String? displayName = user?.email;

    String name(String? displayname){
      String names = displayname == "jmccaffrey@gmail.com"? "Paige": "Josh";
      return names;
    }

    Duration check(){
      Timestamp ts = widget.Date[0]["time"];
      DateTime target = ts.toDate();

      Duration diff = target.difference(DateTime.now());
      return diff;
    }

    Size size = MediaQuery.sizeOf(context);
    Duration nextindays = check();
    String username = name(displayName);


    return ListView(
      children: [
        Container(
          color: Colors.black,

        child:Column(
          children: [
            SizedBox(height: 25,),

            Container(
              width: size.width * 0.90,
              height: size.height *0.25,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/heartbackground.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.2,),

              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: size.width * 0.4,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/hiziggy.png"),
                          ),
                        boxShadow: [
                          BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.25),
                      blurRadius: 20,
                      spreadRadius: 5,

                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Text("Welcome",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont('Pacifico',
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.w100

                          ),),
                        SizedBox(height: 25,),

                        Text("${username}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont('Pacifico',
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w100

                          ),),
                      ],
                    ),
                  )
                ],

              ),
            ),

            SizedBox(height: 50,),

            Container(
              width: size.width*0.85,
              height: size.height*0.40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                color: Colors.grey,

              ),

              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Container(
                    width: size.width * 0.80,
                    height: size.height * 0.30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.white,

                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 70, right: 30, left: 15),
                                  width: 50,
                                  height: 70,
                                  child: Text("Next date",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont('Pacifico',
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100

                                    ),),
                                )
                            ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                       Align(
                         alignment: Alignment.centerRight,
                         child:    Text("${nextindays.inDays} days till next date",
                           textAlign: TextAlign.center,
                           style: GoogleFonts.getFont('Pacifico',
                               fontSize: 15,
                               color: Colors.black,
                               fontWeight: FontWeight.w100

                           ),),
                       ),
                          SizedBox(height: 15,),

                          Align(
                            alignment: Alignment.centerRight,
                            child:    Text("${widget.Date[0]["date name"]}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont('Pacifico',
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100

                              ),),
                          ),

                          SizedBox(height: 25,),
                          Align(
                            alignment: Alignment.centerRight,

                        child: InkWell(
                          onTap:
                          (){
                            sendMailfromGmail("jmccaffrey1110@gmail.com", "${nextindays.inDays} days until next date!", "Currently, there is only ${nextindays.inDays} days until ${widget.Date[0]["date name"]}");
                            sendMailfromGmail("paigecadmn@gmail.com", "${nextindays.inDays} days until next date!", "Currently, there is only ${nextindays.inDays} days until ${widget.Date[0]["date name"]}");
                          },
                          child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(45)
                          ),
                        ),
                        ),
                          ),



                        ],

                      )
                    )

                      ],
                    ),
              ]
                  ),

        ),





                ],
              ),

            ),
            SizedBox(height: 25,),

            Text("Later dates!",
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont('Pacifico',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w100

              ),),

            Container(
              height: 500,
              width: size.width *0.5,
              color: Colors.black,
              child: ListView.separated(
                separatorBuilder: (BuildContext context,
                    int index) => SizedBox(height: 15,),
                itemCount: widget.Date.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                      children: [
                        SizedBox(height: 5,),

                        Row(


                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [

                                    Align(
                                      alignment: Alignment.center,


                                      child:Container(
                                        width: size.width *0.3,
                                        height: size.height*0.03,
                                        decoration: BoxDecoration(

                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                        ),

                                        child: Text("${widget.Date[index]["date name"]}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.getFont('Pacifico',
                                              fontSize: 15,
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
            )

          ],

        )
    )

      ],
    );
  }
}
