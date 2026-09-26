import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/emails.dart';
import 'addnew.dart';

class addnewer extends StatefulWidget {
  final Function(int) onPageChange;
  final Function updateDates;
  const addnewer({super.key, required this.onPageChange, required this.updateDates});

  @override
  State<addnewer> createState() => _addnewerState();
}

class _addnewerState extends State<addnewer> {

  final _namecontroller = TextEditingController();
  final _timecontroller = TextEditingController();

  final _lovecontroller = TextEditingController();

  List<String> ideas= [
    'movies',
    'hike',
    'DIY',
    'study',
    'explore',
    'random game',
    'zoo or aquariam?',
    'shops',
    'dinner date',
    'cook for each other'

  ];
  Future<void> pickTime() async {
    final DateTime? time = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (time != null) {
      _timecontroller.text = "${time.day}/${time.month}/${time.year}";
    }
  }

  DateTime parseDate(String input) {
    final parts = input.split('/');
    return DateTime(
      int.parse(parts[2]), // year
      int.parse(parts[1]), // month
      int.parse(parts[0]), // day
    );
  }
  Future adddata() async{
    if(_namecontroller.text.trim() == "" || _timecontroller.text.trim() ==""){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("enter some data")),
      );

    }
    else {
      await FirebaseFirestore.instance.collection('Dates').add({
        'date name': _namecontroller.text.trim(),
        'time': parseDate(_timecontroller.text.trim())
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sucessfully entered")),
      );

      widget.updateDates();

      widget.onPageChange(3);

    }




  }

  late Size size = MediaQuery.sizeOf(context);

  late List<Widget> cars=[
    adddat(),
    dateideas(size, ideas),
    addqoutes()

  ];
  @override
  Widget build(BuildContext context) {


    return ListView(
        children: [
        Container(
        color: Colors.black,
        child: Column(
        children: [
          CarouselSlider(items: [1,2,3].map((i){
            return cars[i -1];

        }).toList(),
              options: CarouselOptions(
                height: size.height *0.75,

              ))

        ]
        )
        )
        ]
    );


  }
  Widget placeholder(){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.pink,
      child: Text("hi"),

    );
  }
  Widget dateideas(dynamic size, List idea){
    return Container(
        width: 0.98 * size.width,
        height: 0.20 * size.height,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white60.withOpacity(0.2),
            borderRadius: BorderRadius.circular(40)

        ),

            child: Container(
              width: 0.85 * size.width,
              height: 0.15 * size.height,

              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/planbackground.png",
                  ),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(40)

              ),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 0.45 * size.width,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),

                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text("Ideas baord",textAlign: TextAlign.center,
                          style: GoogleFonts.getFont('Pacifico',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w100

                          ),),
                      )
                  ),
                  SizedBox(height: 30,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 0.31 * size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,

                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child:Container(
                            width: 0.29 * size.width,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: Text('${ideas[random.nextInt(10)]}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Pacifico',
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100

                                )),

                          ),

                        ),
                      )
                  ),
                  SizedBox(height: 30,),

                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 0.31 * size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,

                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child:Container(
                            width: 0.29 * size.width,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: Text('${ideas[random.nextInt(10)]}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Pacifico',
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100

                                )),

                          ),

                        ),
                      )
                  ),
                  SizedBox(height: 30,),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 0.31 * size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,

                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child:Container(
                            width: 0.29 * size.width,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: Text('${ideas[random.nextInt(10)]}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Pacifico',
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100

                                )),

                          ),

                        ),
                      )
                  ),
                  SizedBox(height: 30,),

                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 0.31 * size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,

                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child:Container(
                            width: 0.29 * size.width,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: Text('${ideas[random.nextInt(10)]}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Pacifico',
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100

                                )),

                          ),

                        ),
                      )
                  )
                ],
              ),
            )

    );

  }

  Widget adddat(){
    return Container(
    width: 0.85 * size.width,
    height: 0.50 * size.height,
      margin: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage("assets/images/mapbackground.png",
    ),
    fit: BoxFit.cover
    ),
    borderRadius: BorderRadius.circular(40)

    ),
    child: Column(
    children: [
    SizedBox(height: 55,),

    Align(
    alignment: Alignment.centerLeft,
    child:SizedBox(
    width: 0.85 * size.width,
    child: Material(
    borderRadius: BorderRadius.circular(25),
    child: TextField(
    style: GoogleFonts.getFont('Pacifico',
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w100
    ),
    controller: _namecontroller,
    decoration: InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    ),
    hintText: 'date name',
    hintStyle:
    GoogleFonts.getFont('Pacifico',
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w100
    ),

    filled: true,
    fillColor: Colors.white,
    ),
    ),
    ),
    ),
    ),

    SizedBox(height: 65,),
    Align(
    alignment: Alignment.centerLeft,
    child:SizedBox(
    width: 0.85 * size.width,
    child: Material(
    borderRadius: BorderRadius.circular(25),
    child: TextField(
    style: GoogleFonts.getFont('Pacifico',
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w100
    ),
    controller: _timecontroller,
    readOnly: true,
    onTap: pickTime,
    decoration: InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),

    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    ),
    hintText: 'time(ddmmyyyy)',
    hintStyle:
    GoogleFonts.getFont('Pacifico',
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w100
    ),

    filled: true,
    fillColor: Colors.white,
    ),
    ),
    ),
    ),
    ),
    SizedBox(height: 110,),
    Align(
    alignment: Alignment.center,
    child:InkWell(
    onTap: () {
    sendMailfromGmail("paigecadmn@gmail.com", "New date added!", "${_namecontroller.text.trim()} was added to the calendar scheduled for ${_timecontroller.text.trim()}");
    sendMailfromGmail("jmccaffrey1110@gmail.com", "New date added!", "${_namecontroller.text.trim()} was added to the calendar scheduled for ${_timecontroller.text.trim()}");



    adddata();



    },
    child: Container(
    width: 0.25 * size.width,
    height: 50,
    decoration: BoxDecoration(
    color: Colors.white,

    borderRadius: BorderRadius.circular(40)
    ),
    child: Text("Confirm",textAlign: TextAlign.center,
    style: GoogleFonts.getFont('Pacifico',
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w100

    ),),
    )
    )
    )
    ],
    ),


    );

  }

  Widget addqoutes(){
    return Container(
      width: 0.85 * size.width,
      height: 0.50 * size.height,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/mapbackground.png",
          ),
              fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(40)

      ),
      child: Column(
        children: [
          SizedBox(height: 55,),

          Align(
            alignment: Alignment.centerLeft,
            child:SizedBox(
              width: 0.85 * size.width,
              child: Material(
                borderRadius: BorderRadius.circular(25),
                child: TextField(
                  style: GoogleFonts.getFont('Pacifico',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w100
                  ),
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintText: 'date name',
                    hintStyle:
                    GoogleFonts.getFont('Pacifico',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w100
                    ),

                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 110,),
          Align(
              alignment: Alignment.center,
              child:InkWell(
                  onTap: () {


                  },
                  child: Container(
                    width: 0.25 * size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text("Confirm",textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Pacifico',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w100

                      ),),
                  )
              )
          )
        ],
      ),


    );

  }
}

