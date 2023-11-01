import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/iphone-8-plus-1.dart';
// import 'package:myapp/page-1/iphone-8-plus-2.dart';
// import 'package:myapp/page-1/iphone-8-plus-3.dart';
// import 'package:myapp/page-1/iphone-8-plus-4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'Flutter',
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
		home: Scaffold(
		body: SingleChildScrollView(
			child: Scene(),
		),
		),
	);
	}
}
