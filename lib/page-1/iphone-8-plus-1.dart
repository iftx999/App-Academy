import 'package:flutter/material.dart';
import 'iphone-8-plus-2.dart'; // Importe o arquivo da segunda tela

class Scene extends StatefulWidget {
  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();

    // Inicie uma contagem regressiva para a transição após 3 segundos.
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        opacity = 0.0; // Defina a opacidade para 0 para esconder a tela.
      });

      // Agora, você pode navegar para a segunda tela.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TelaSegunda()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: opacity,
      child: Container(
        width: double.infinity,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Container(
            width: double.infinity,
            height: 736 * fem,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Center(
              child: SizedBox(
                width: 400 * fem,
                height: 736 * fem,
                child: Image.asset(
                  'assets/page-1/images/31Kl.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
