import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
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
