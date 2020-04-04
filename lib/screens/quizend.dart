import 'package:flutter/material.dart';
import 'home.dart';
import 'package:share/share.dart';

class QuizEnd extends StatelessWidget{

	final int score;
	final String ptoken;

	QuizEnd({Key key, @required this.score, @required this.ptoken}) : super(key: key);

	@override
	Widget build(BuildContext context){
		return Material(
			color: Colors.cyan,
			child: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[

						Text(
							"You Scored:",
							style: TextStyle(
								color: Colors.white,
								fontSize: 60.0,
								fontWeight: FontWeight.bold,
							),
						),

						Text(
							"${score}",
							style: TextStyle(
								color: Colors.white,
								fontSize: 90.0,
								fontWeight: FontWeight.bold,
							),
						),


						SizedBox(height: 20.0),

						FlatButton(
							color: Colors.white,
							textColor: Colors.cyan,
							padding: EdgeInsets.all(12.0),
							splashColor: Colors.cyanAccent,
							onPressed: (){
								Navigator.pushAndRemoveUntil(
									context,
									MaterialPageRoute(
										builder: (context) => HomeScreen(playtoken: ptoken)
									),
									(Route<dynamic> route) => false,
								);
							},
							child: Text(
								"Play Again",
								style: TextStyle(
									fontSize: 30.0,
								),
							),
						),

						SizedBox(height: 90.0),

						FlatButton(
							color: Colors.white,
							textColor: Colors.cyan,
							padding: EdgeInsets.all(12.0),
							splashColor: Colors.cyanAccent,
							onPressed: (){
								Share.share("I scored ${score}/10 in OpenFunQuiz, Go and try out your geniusness");
							},
							child: Text(
								"Share Score",
								style: TextStyle(
									fontSize: 25.0,
								),
							),
						),

					],
				),
			),
		);
	}
}
