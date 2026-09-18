import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  @override

  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();


  Future sigin()async {
    //check to see if log in details are correct
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passcontroller.text.trim(),
      );

      print("Login successful");
    } on FirebaseAuthException catch (e) {
      const snackBar = SnackBar(content: Text('incorrect password or email'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    //get rid of email and password listenrs after use for sotrage
    _emailcontroller.dispose();
    _passcontroller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
        body: ListView(
        children: [
          Container(
              color: Colors.black,
          width: size.width * 1,
          height: size.height * 1,
          child:Container(
              width: size.width * 0.70,
              height: size.height * 0.90,


              color: Color(0xFFF5F5DC),
          child:Column(

            children: [

              SizedBox(height: 25,),

              Image(image: AssetImage("assets/images/ziggybear.png"),
              width: 225,
              height: 225,),

              SizedBox(height: 10,),
              Text("Welcome back",textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Pacifico',
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.w100

                ),),

              SizedBox(height: 5,),
              Text("Please log in",textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Pacifico',
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w100

                ),),

              SizedBox(height: 50,),

              SizedBox(width: 0.65 * size.width,

                child: Material(
                    borderRadius: BorderRadius.circular(25),


                    child:TextField(
                      style: GoogleFonts.getFont('Pacifico',
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w100
                      ),

                      controller: _emailcontroller,


                      decoration: new InputDecoration(

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),


                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: 'email',
                          hintStyle:
                          GoogleFonts.getFont('Pacifico',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w100
                          ),
                          filled: true,
                          fillColor: Colors.white



                      ),

                    )
                ),
              ),
              SizedBox(height: 40,),

              SizedBox(width: 0.65 * size.width,

                child: Material(
                    borderRadius: BorderRadius.circular(25),


                    child:TextField(
                      style: GoogleFonts.getFont('Pacifico',
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w100
                      ),
                      controller: _passcontroller,


                      decoration: new InputDecoration(

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),


                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: 'password',
                          hintStyle:
                          GoogleFonts.getFont('Pacifico',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w100
                          ),
                          filled: true,
                          fillColor: Colors.white



                      ),

                    )
                ),
              ),

              SizedBox(height: 25,),
              InkWell(
                onTap: () {
                  sigin();
                },
              child:Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45)

                ),

                child: Text("Continue",textAlign: TextAlign.center,
                  style: GoogleFonts.getFont('Pacifico',
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w100

                  ),),

              )
              ),


            ],

          )
          )
          )
        ],
        ),

    );
  }
}
