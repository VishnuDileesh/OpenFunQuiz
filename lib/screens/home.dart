import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/category.dart';
import './quiz.dart';




class HomeScreen extends StatefulWidget{
	
	final String playtoken;

	HomeScreen({Key key, @required this.playtoken}) : super(key:key);

	@override
	_HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>{


	@override
	void initState(){
		var ptoken = widget.playtoken;

		print("Home SCREEEEEEEEEN");

		print(ptoken);
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar(
				title: Text(
					"OpenFunQuiz",
					style: TextStyle(
						color: Colors.white,
					),
				),
				automaticallyImplyLeading: false,
			),

			body: SafeArea(

				child: ListView.builder(
					itemCount: categories.length,
					itemBuilder: (BuildContext context, int index){
						return Card(
							child: InkWell(
								splashColor: Colors.cyan.withAlpha(30),
								onTap: (){

									Navigator.push(
										context,
										MaterialPageRoute(
											builder: (context) => Quiz(catname: categories[index].name, catid: categories[index].id, ptoken: widget.playtoken)
										),
									);
								},

								child: Column(
									children: <Widget>[
										SizedBox(
											height: 20.0
										),
										

										SvgPicture.asset(
											categories[index].icon,
											height: 50.0,
											width: 50.0,
										),
										

										SizedBox(
											height: 20.0,
										),

										Text(
											categories[index].name,
											style: TextStyle(
												fontSize: 25.0,
												fontWeight: FontWeight.bold,
											),
										),

										SizedBox(
											height: 20.0,
										),
									],
								),

							),
						);
					}
				),

			),
		);
	}
}
