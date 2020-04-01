import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/category.dart';


class HomeScreen extends StatefulWidget{
	@override
	_HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>{
	

	List<Category> categories = [
		Category("General Knowledge", 9, "assets/icons/brain.svg"),
		Category("Film", 11, "assets/icons/popcorn.svg"),
		Category("Video Games", 15, "assets/icons/game-controller.svg"),
		Category("Computers", 18, "assets/icons/translation.svg"),
		Category("Sports", 21, "assets/icons/volleyball.svg"),
		Category("Geography", 22, "assets/icons/globe.svg"),
		Category("Celebrities", 26, "assets/icons/star.svg"),
		Category("History", 23, "assets/icons/history.svg"),
		Category("Animals", 27, "assets/icons/lion.svg"),
		Category("Vehicles", 28, "assets/icons/jeep.svg"),

	];

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
			),

			body: SafeArea(
				//alignment: Alignment.center,

				child: ListView.builder(
					itemCount: categories.length,
					itemBuilder: (BuildContext context, int index){
						return Card(
							child: InkWell(
								splashColor: Colors.cyan.withAlpha(30),
								onTap: (){
									print(categories[index].id);
									print(categories[index].icon);
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

								/*
								child: Padding(
									//height: 50.0,
									padding: const EdgeInsets.all(10.0),
									child: Center(
										child: Text(
											categoriesindex.name,
											style: TextStyle(
												fontSize: 25.0,
												fontWeight: FontWeight.bold,
											),
										),
									),
								),

								*/
							),
						);
					}
				),

				/*
				child: Card(
					child: InkWell(
						splashColor: Colors.cyan.withAlpha(30),
						onTap: (){
							print("Hello");
						},

						child: Container(
							height: 50.0,
							width: 300.0,
							padding: const EdgeInsets.all(10.0),
							child: Center(
								child: Text(
									"Hello World",
									style: TextStyle(
										fontSize: 25.0,
										fontWeight: FontWeight.bold,
									),
								),
							),
						),
					),
				),
				*/
			),
		);
	}
}
