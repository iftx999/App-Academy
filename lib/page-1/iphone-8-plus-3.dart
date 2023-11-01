import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // iphone8plus3VWS (102:8)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 117*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffbf8f8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // rectangle1Cve (102:10)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 389*fem, 85*fem),
              width: 1*fem,
              height: 18*fem,
              decoration: BoxDecoration (
                color: Color(0xffd9d9d9),
              ),
            ),
            Container(
              // autogroupfvkx8JW (9LParYz8M8MYsbkf4efVKx)
              margin: EdgeInsets.fromLTRB(36*fem, 0*fem, 0*fem, 16*fem),
              width: 206*fem,
              height: 196*fem,
              child: Image.asset(
                'assets/page-1/images/auto-group-fvkx.png',
                width: 206*fem,
                height: 196*fem,
              ),
            ),
            Container(
              // frame1czN (102:9)
              margin: EdgeInsets.fromLTRB(85*fem, 0*fem, 205*fem, 229*fem),
              width: double.infinity,
              height: 100*fem,
            ),
            Container(
              // versodragonballxYS (102:22)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
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
          ],
        ),
      ),
          );
  }
}