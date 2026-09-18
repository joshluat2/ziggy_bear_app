import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:joshesapp/pages/first.dart';
import 'package:joshesapp/pages/second.dart';
import 'package:joshesapp/pages/third.dart';

class scrap extends StatefulWidget {
  const scrap({super.key});

  @override
  State<scrap> createState() => _scrapState();
}

class _scrapState extends State<scrap> {



  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int nexttext = random.nextInt(5);
    int nexttext2 = random.nextInt(5);



    late final List<String>quoutes = [
      "Even if the whole world turns against you, just know that I'll always remain by your side!",
      "Robert patterson is really mid",
      "we are the best in the whole world",
      "I am so proud of you",
      "Too slow"

    ];

    late final List<String>imagess = [
      "assets/images/random1.jpg",
      "assets/images/random2.jpg",
      "assets/images/random3.jpg",
      "assets/images/random4.jpg",
      "assets/images/random5.jpg",
      "assets/images/random6.jpg",
      "assets/images/random7.jpg",
      "assets/images/random8.jpg"

    ];

    late final List <Widget>pages = [
      first(qoute1: quoutes[nexttext2], qoute2: quoutes[nexttext], ranimage2: imagess[random.nextInt(8)], ranimage4: imagess[random.nextInt(8)], ranimage5: imagess[random.nextInt(8)],),
      second(qoute1: quoutes[nexttext], qoute2: quoutes[nexttext2],ranimage2: imagess[random.nextInt(8)], ranimage1: imagess[random.nextInt(8)],),
      thrid(qoute: quoutes[nexttext], ranimage1: imagess[random.nextInt(8)], ranimage2: imagess[random.nextInt(8)],)
    ];

    int next = random.nextInt(3);
    return pages[next];
  }
}
