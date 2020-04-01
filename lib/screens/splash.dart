import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class SplashScreen extends StatefulWidget{
	@override
	_SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

	@override
	void initState(){
		super.initState();


		Timer(Duration(seconds: 3), (){
			Navigator.push(
				context,
				MaterialPageRoute(
					builder: (context) => HomeScreen()
				),
			);
		});

	}

	@override
	Widget build(BuildContext context){
		return Material(
			color: Colors.cyan,
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					Text(
						"OpenFunQuiz",
						style: TextStyle(
							color: Colors.white,
							fontSize: 30.0,
							fontWeight: FontWeight.bold,
						),
					),

					SizedBox(height: 20.0),

					CircularProgressIndicator(backgroundColor: Colors.white,),
					
				],
			),
		);
	}	
}
