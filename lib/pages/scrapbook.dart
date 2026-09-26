import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:joshesapp/pages/first.dart';
import 'package:joshesapp/pages/second.dart';
import 'package:joshesapp/pages/third.dart';

class scrap extends StatefulWidget {
  final List <Map<String, dynamic>> qoutes;
  const scrap({super.key, required this.qoutes});

  @override
  State<scrap> createState() => _scrapState();
}

class _scrapState extends State<scrap> {



  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int nexttext = random.nextInt(widget.qoutes.length);
    int nexttext2 = random.nextInt(widget.qoutes.length);




    late final List<String>imagess = [
      "assets/images/random1.jpg",
      "assets/images/random2.jpg",
      "assets/images/random3.jpg",
      "assets/images/random4.jpg",
      "assets/images/random5.jpg",
      "assets/images/random6.jpg",
      "assets/images/random7.jpg",
      "assets/images/random8.jpg",
      "assets/images/random9.jpg",
      "assets/images/random10.jpg",
      "assets/images/random11.jpg"

    ];

    late final List <Widget>pages = [
      first(qoute1: widget.qoutes[nexttext2]['AQOUTE'], qoute2: widget.qoutes[nexttext]['AQOUTE'], ranimage2: imagess[random.nextInt(8)], ranimage4: imagess[random.nextInt(8)], ranimage5: imagess[random.nextInt(8)],),
      second(qoute1: widget.qoutes[nexttext]['AQOUTE'], qoute2: widget.qoutes[nexttext2]['AQOUTE'],ranimage2: imagess[random.nextInt(8)], ranimage1: imagess[random.nextInt(8)],),
      thrid(qoute: widget.qoutes[nexttext2]['AQOUTE'], ranimage1: imagess[random.nextInt(8)], ranimage2: imagess[random.nextInt(8)],)
    ];

    int next = random.nextInt(3);
    return pages[next];
  }
}
