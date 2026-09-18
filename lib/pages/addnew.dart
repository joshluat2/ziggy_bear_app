import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../services/emails.dart';

class addnew extends StatefulWidget {
  final Function(int) onPageChange;
  final Function updateDates;
  const addnew({super.key, required this.onPageChange, required this.updateDates});

  @override
  State<addnew> createState() => _addnewState();
}
final _namecontroller = TextEditingController();
final _timecontroller = TextEditingController();
Random random = Random();

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
















class _addnewState extends State<addnew> {





  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String? displayName = user?.email;



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


    Size size = MediaQuery.sizeOf(context);
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

    return ListView(
      children: [
        Container(
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                  width: 0.98 * size.width,
                  height: 0.55 * size.height,
                decoration: BoxDecoration(
                  color: Colors.white60.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(40)

                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 0.85 * size.width,
                    height: 0.50 * size.height,
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
                          width: 0.55 * size.width,
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

                        SizedBox(height: 35,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child:SizedBox(
                            width: 0.55 * size.width,
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
                        SizedBox(height: 25,),
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
                ),

              )
              ),
              SizedBox(height: 55,),
          Container(
    width: 0.98 * size.width,
    height: 0.55 * size.height,
    decoration: BoxDecoration(
    color: Colors.white60.withOpacity(0.2),
    borderRadius: BorderRadius.circular(40)

    ),
    child: Align(
    alignment: Alignment.center,
    child: Container(
    width: 0.85 * size.width,
    height: 0.50 * size.height,
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
                width: 0.40 * size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),

                    borderRadius: BorderRadius.circular(40)
                ),
                child: Text("Ideas baord",textAlign: TextAlign.center,
                  style: GoogleFonts.getFont('Pacifico',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w100

                  ),),
              )
          ),
      Align(
        alignment: Alignment.centerLeft,
          child: Container(
            width: 0.25 * size.width,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.black,

                borderRadius: BorderRadius.circular(40)
            ),
            child: Align(
              alignment: Alignment.center,
              child:Container(
              width: 0.23 * size.width,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(40)
              ),
                child: Text('${ideas[random.nextInt(10)]}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Pacifico',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w100

                    )),

            ),

      ),
      )
      ),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 0.25 * size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,

                    borderRadius: BorderRadius.circular(40)
                ),
                child: Align(
                  alignment: Alignment.center,
                  child:Container(
                    width: 0.23 * size.width,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text('${ideas[random.nextInt(10)]}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Pacifico',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w100

                        )),

                  ),

                ),
              )
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 0.25 * size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,

                    borderRadius: BorderRadius.circular(40)
                ),
                child: Align(
                  alignment: Alignment.center,
                  child:Container(
                    width: 0.23 * size.width,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text('${ideas[random.nextInt(10)]}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Pacifico',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w100

                        )),

                  ),

                ),
              )
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 0.25 * size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,

                    borderRadius: BorderRadius.circular(40)
                ),
                child: Align(
                  alignment: Alignment.center,
                  child:Container(
                    width: 0.23 * size.width,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text('${ideas[random.nextInt(10)]}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Pacifico',
                            fontSize: 16,
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
    )
          )
            ],

          ),
        )
      ],
    );
  }
}
