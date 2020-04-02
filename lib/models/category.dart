import 'package:flutter/material.dart';

class Category{
	String name;
	int id;
	String icon;

	Category(this.name, this.id, this.icon);
}



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

