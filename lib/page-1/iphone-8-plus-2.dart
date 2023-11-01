import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class TelaSegunda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // iphone8plus2LWW (10:7)
        width: double.infinity,
        height: 776*fem,
        decoration: BoxDecoration (
          color: Color(0xfffbf8f8),
        ),
        child: Stack(
          children: [
            Positioned(
              // frame1pwU (10:11)
              left: 85*fem,
              top: 315*fem,
              child: Container(
                width: 100*fem,
                height: 100*fem,
              ),
            ),
            Positioned(
              // rectangle1wFQ (27:4)
              left: 0*fem,
              top: 0*fem,
              child: Align(
                child: SizedBox(
                  width: 1*fem,
                  height: 18*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle2FG6 (27:7)
              left: 0*fem,
              top: 0*fem,
              child: Align(
                child: SizedBox(
                  width: 390*fem,
                  height: 776*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xfffbf8f8),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle3Nbc (27:9)
              left: 144*fem,
              top: 103*fem,
              child: Align(
                child: SizedBox(
                  width: 172*fem,
                  height: 196*fem,
                  child: Image.asset(
                    'assets/page-1/images/rectangle-3.png',
                    width: 172*fem,
                    height: 196*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle5HyU (38:21)
              left: 18*fem,
              top: 118*fem,
              child: Align(
                child: SizedBox(
                  width: 343*fem,
                  height: 158*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xffedecec),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // olmatheusQHQ (38:22)
              left: 23*fem,
              top: 75*fem,
              child: Align(
                child: SizedBox(
                  width: 119*fem,
                  height: 25*fem,
                  child: Text(
                    'Olá Matheus',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xff554e4e),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // meucompromissosemprevencerdR4 (42:2)
              left: 40*fem,
              top: 169.5*fem,
              child: Align(
                child: SizedBox(
                  width: 267*fem,
                  height: 49*fem,
                  child: Text(
                    'Meu compromisso é sempre vencer.',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle6t66 (45:3)
              left: 10*fem,
              top: 364*fem,
              child: Align(
                child: SizedBox(
                  width: 171*fem,
                  height: 181*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // gokuPoY (48:8)
              left: 40*fem,
              top: 134.5*fem,
              child: Align(
                child: SizedBox(
                  width: 39*fem,
                  height: 17*fem,
                  child: Text(
                    'Goku:',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 14*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // wgjmunscreen115Aa (57:10)
              left: 16*fem,
              top: 284*fem,
              child: Align(
                child: SizedBox(
                  width: 86*fem,
                  height: 63*fem,
                  child: Image.asset(
                    'assets/page-1/images/WgjM-unscreen.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // wgjmunscreen12ymk (57:11)
              left: 144*fem,
              top: 285*fem,
              child: Align(
                child: SizedBox(
                  width: 86*fem,
                  height: 63*fem,
                  child: Image.asset(
                    'assets/page-1/images/WgjM-unscreen1.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // wgjmunscreen13JZ8 (57:12)
              left: 271*fem,
              top: 284*fem,
              child: Align(
                child: SizedBox(
                  width: 86*fem,
                  height: 63*fem,
                  child: Image.asset(
                    'assets/page-1/images/WgjM-unscreen2.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // versodragonballcZp (57:13)
              left: 135*fem,
              top: 644*fem,
              child: Align(
                child: SizedBox(
                  width: 111*fem,
                  height: 15*fem,
                  child: Text(
                    'Versão: Dragon Ball',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle7uJ2 (64:14)
              left: 195*fem,
              top: 364*fem,
              child: Align(
                child: SizedBox(
                  width: 171*fem,
                  height: 181*fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(8*fem),
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // dumbbellsolid1CH8 (78:2)
              left: 39*fem,
              top: 415*fem,
              child: Align(
                child: SizedBox(
                  width: 112*fem,
                  height: 86*fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      'assets/page-1/images/dumbbell-solid-1.png',
                      width: 112*fem,
                      height: 86*fem,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // bowlfoodsolid15Lv (90:7)
              left: 230*fem,
              top: 417.375*fem,
              child: Align(
                child: SizedBox(
                  width: 102*fem,
                  height: 75.25*fem,
                  child: Image.asset(
                    'assets/page-1/images/bowl-food-solid-1.png',
                    width: 102*fem,
                    height: 75.25*fem,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}