import 'package:flutter/material.dart';
import 'home.dart';

class QuizEnd extends StatelessWidget{

	final int score;

	QuizEnd({Key key, @required this.score}) : super(key: key);

	@override
	Widget build(BuildContext context){
		return Material(
			color: Colors.cyan,
			child: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						/*Text(
							"Great",
							style: TextStyle(
								color: Colors.white,
								fontSize: 80.0,
								fontWeight: FontWeight.bold,
							),
						),
						*/

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
							padding: EdgeInsets.all(8.0),
							splashColor: Colors.cyanAccent,
							onPressed: (){
								Navigator.pushReplacement(
									context,
									MaterialPageRoute(
										builder: (context) => HomeScreen()
									),
								);
							},
							child: Text(
								"Play Again",
								style: TextStyle(
									fontSize: 30.0,
								),
							),
						),

					],
				),
			),
		);
	}
}
