import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joshesapp/pages/addnew.dart';
import 'package:joshesapp/pages/betterhome.dart';
import 'package:joshesapp/pages/loadingscreen.dart';
import 'package:joshesapp/pages/scrapbook.dart';

import 'homepage.dart';
import 'newandfinalhome.dart';


int currentpage = 0;
bool ishome = true;
bool isplan = false;
bool isscrap = false;

class start extends StatefulWidget  {
  const start({super.key});

  @override
  State<start> createState() => _StartState();
}

class _StartState extends State<start> {
  @override
  void initState() {
    super.initState();
    loadQuestions();



  }

  void changePage(int page) {
    setState(() {
      currentpage = page;
    });
  }

  void updatesdates(){

    setState(() {
      Date = [];
      loadQuestions();

    });

  }

  final db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> Date = [];

  loadQuestions() async {

    changePage(4);
    final snapshot = await FirebaseFirestore.instance
        .collection("Dates")
        .get();




    for (var doc in snapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      Date.add(data);
    }
    print("hi");

    for(int i = 0; i < Date.length; i++){
      DateTime next = (Date[i]['time']).toDate();
      int jplaceholder = i;

      for(int j = i + 1; j < Date.length; j++){
        if((Date[j]['time']).toDate().isBefore(next)){
          next = (Date[j]['time']).toDate();
          jplaceholder = j;

        }



      }
      var temp = Date[i];
      Date[i] = Date[jplaceholder];

      Date[jplaceholder] = temp;


    }
    print("hello");

    changePage(0);



  }









  @override

  Widget build(BuildContext context) {



    late final List <Widget>pages = [
      finalhome(Date: Date, updateDates: updatesdates,),
      scrap(),
      addnew(onPageChange: changePage, updateDates: updatesdates,),
      betterhome(Date: Date,),
      loadingwait()
    ];

    return Scaffold(
        bottomNavigationBar:Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black, width: 2)
            )
          ),
          child: BottomAppBar(
          height: 120,
            color: Color(0xFFB80DB8),
            child:Column(
            children: [
              Row(
              children: [
            InkWell(
            onTap: () {
          changePage(0);
          setState(() {
            ishome = true;
            isplan = false;
            isscrap = false;
          });

          },
              child:
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 15, left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),

                  ),
                  child: Icon(ishome ? Icons.home : Icons.home_outlined, color: Colors.white, size: 50,),
                ),
            ),
            InkWell(
                onTap: () {
                  changePage(2);
                  setState(() {
                    ishome = false;
                    isplan = true;
                    isscrap = false;
                  });


                },
                child:Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 15, left: 15),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(isplan ? Icons.next_plan: Icons.next_plan_outlined, color: Colors.white, size: 50,),

                ),
            ),
          InkWell(
            onTap: () {
              changePage(1);
              setState(() {
                ishome = false;
                isplan = false;
                isscrap = true;
              });

            },
            child:
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 15, left: 15),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(isscrap ? Icons.book: Icons.book_outlined, color: Colors.white, size: 50,),

                ),
          ),



              ]




            ),

              Row(
                  children: [
                    Container(
                      width: 50,
                      height: 32,
                      margin: EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text('Home',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Pacifico',
                            fontSize: 12,
                            color: Color(0xFF2EE8D6),
                            fontWeight: FontWeight.w100

                        ),),
                    ),
                    Container(
                      width: 50,
                      height: 32,
                      margin: EdgeInsets.only(right: 15, left: 15),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text('Plan',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Pacifico',
                            fontSize: 12,
                            color: Color(0xFF2EE8D6),
                            fontWeight: FontWeight.w100

                        ),),
                    ),
                    Container(
                      width: 50,
                      height: 32,
                      margin: EdgeInsets.only(right: 15, left: 15),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text('Scrap book',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Pacifico',
                            fontSize: 12,
                            color: Color(0xFF2EE8D6),
                            fontWeight: FontWeight.w100

                        ),),
                    ),

                  ]




              ),



          ],
          
          ),
          ),
        ),

    appBar: AppBar(
      centerTitle: true, // this is all you need

      backgroundColor:Color(0xFFB80DB8),
      shape: Border(
        bottom: BorderSide(color: Colors.black, width: 2),
      ),



      title: Text(
              'Ziggy bear app',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont('Pacifico',
                  fontSize: 25,
                  color: Color(0xFF2EE8D6),
                  fontWeight: FontWeight.w100

              ),


            ),


    ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation ){
          return FadeTransition(opacity: animation,
            child:SlideTransition(position: Tween<Offset>(
            begin: Offset(0, 0.08), // slide from right
            end: Offset.zero,
          ).animate(animation),
            child: child,
            )
          );


      },

      child:pages[currentpage],
      )

    );
  }
}
