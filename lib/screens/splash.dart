import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'home.dart';

class SplashScreen extends StatefulWidget{
	@override
	_SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
	
	String playtoken = "";

	@override
	void initState(){
		super.initState();


		fetchToken();
/*
		Timer(Duration(seconds: 2), (){
			Navigator.pushReplacement(
				context,
				MaterialPageRoute(
					builder: (context) => HomeScreen(playtoken: playtoken)
				),
			);
		});
*/
	}






	Future<void> fetchToken() async{
		final String tokenapi = "https://opentdb.com/api_token.php?command=request";

		var tokenres = await http.get(tokenapi);

		var tokendata = json.decode(tokenres.body);

		setState((){
			playtoken = tokendata["token"];
		});
		
		Navigator.pushReplacement(
			context,
			MaterialPageRoute(
				builder: (context) => HomeScreen(playtoken: playtoken)
			),
		);

		print(playtoken);
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
