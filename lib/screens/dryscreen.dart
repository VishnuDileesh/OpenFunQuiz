import 'package:flutter/material.dart';
import 'home.dart';

class DryScreen extends StatelessWidget{

	final String ptoken;

	DryScreen({Key key, this.ptoken}) : super(key: key);

	@override
	Widget build(BuildContext context){
		return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			crossAxisAlignment: CrossAxisAlignment.center,
			children: <Widget>[
				SizedBox(height: 150.0),
				Center(
					child: Text(
					"You Are Rocking",
					style: TextStyle(
						fontSize: 30.0,
						fontWeight: FontWeight.bold,
						color: Colors.cyan,
						),
					),
				),

				SizedBox(height: 30.0),

				Center(
					child: Text(
					"You Dried The Category",
					style: TextStyle(
						fontSize: 30.0,
						fontWeight: FontWeight.bold,
						color: Colors.cyan,
						),
					),
				),

				SizedBox(height: 50.0),

						FlatButton(
							color: Colors.cyan,
							textColor: Colors.white,
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
								"Try Other Categories",
								style: TextStyle(
									fontSize: 30.0,
								),
							),
						),



			],
		);
	}
}
