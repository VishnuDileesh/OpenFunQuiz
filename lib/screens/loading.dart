import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return Container(
			color: Colors.cyan,
			child: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(
							"You Quiz is being loaded...",
							style: TextStyle(
								fontSize: 25.0,
								color: Colors.white,
								fontWeight: FontWeight.bold,
							),
						),

						SizedBox(height: 20.0),

						CircularProgressIndicator(backgroundColor: Colors.white,),
					],
				),
			),
		);
	}
}
