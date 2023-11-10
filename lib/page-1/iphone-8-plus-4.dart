import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class TelaMenu4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffbf8f8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 14 * fem),
              width: 1 * fem,
              height: 18 * fem,
              decoration: BoxDecoration(
                color: Color(0xffd9d9d9),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(17 * fem, 0 * fem, 0 * fem, 25 * fem),
              width: 342 * fem,
              height: 477 * fem,
              child: Image.asset(
                'assets/page-1/images/auto-group-a1xw.png',
                width: 342 * fem,
                height: 477 * fem,
                fit: BoxFit.cover, // ajuste a propriedade fit conforme necessário
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(17 * fem, 0 * fem, 31 * fem, 0 * fem),
              width: double.infinity,
              height: 98 * fem,
              decoration: BoxDecoration(
                color: Color(0xffedecec),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
