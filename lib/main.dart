import 'package:flutter/material.dart';
import 'screens/splash.dart';

void main(){
	runApp(MyApp());
}


class MyApp extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return MaterialApp(
			title: 'OpenFunQuiz',
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				primarySwatch: Colors.cyan,
			),
			home: SplashScreen(),
		);
	}
}
