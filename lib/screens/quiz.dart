import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import '../models/question.dart';
import 'quizend.dart';


class Quiz extends StatefulWidget{

	final String catname;
	final int catid;



	Quiz({Key key, @required this.catname, @required this.catid}) : super(key: key);
	
	@override
	_QuizState createState() => _QuizState();
}


class _QuizState extends State<Quiz>{
	//Future<Question> futureQuestion;
	//List questionData;	
	//Map data;

	List<Question> all_questions = [];

	int qindex = 0;
	int score = 0;
	bool showOptions = true;
	bool showAnswer = false;
	bool correctAnswer = false;
	bool wrongAnswer = false;
	bool showNext = false;
	bool showSubmit = false;


	void checkAnswer(int qind, int opind){
		print("Question Index ${qind}");
		print("Option Index ${opind}");

		setState((){
			showOptions = false;
			showAnswer = true;
		});

		if (qind == 9){
			setState((){
				showNext = false;
				showSubmit = true;
			});
		}else{
		
			setState((){
				showNext = true;
			});
		}

		if (all_questions[qind].answer == all_questions[qindex].options[opind]){
			setState((){
				score++;
				correctAnswer = true;
			});
		}else{
			setState((){
				wrongAnswer = true;
			});
		}
	}

	void nextQuestion(){
		setState((){
			showOptions = true;
			showAnswer = false;
			showNext = false;
			correctAnswer = false;
			wrongAnswer = false;
			qindex++;
		});
	}



	Future<List<Question>> fetchData() async{

		var cid = widget.catid;

		final String api = "https://opentdb.com/api.php?amount=10&category=${cid}&difficulty=easy&type=multiple";

		print("Hello");
		var response = await http.get(
			Uri.encodeFull(api),
			headers: {
				"Accept": "application/json"
			}
		);

		var data = json.decode(response.body);

		for (var q in data["results"]){

			String quest = q["question"];
			String answer = q["correct_answer"];
			List options = q["incorrect_answers"];

			options.add(answer);

			options.shuffle();
			
			Question aq = Question(quest, answer, options);

			//Question aq = Question(q["question"], q["correct_answer"], q["incorrect_answers"]);

			all_questions.add(aq);
		}


		return all_questions;

	}


	@override
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar(
				title: Text(
					widget.catname,
					style: TextStyle(
						color: Colors.white,
					),
				),
			),
			body: Container(
				child: FutureBuilder(
					future: fetchData(),
					builder: (BuildContext context, AsyncSnapshot snapshot){
						if(snapshot.data == null){
							return Material(
								color: Colors.cyan,
								child: Center(
									child: Column(
										mainAxisAlignment: MainAxisAlignment.center,
										children: <Widget>[
											Text(
												"Your Quiz is being loaded...",
												style: TextStyle(
													color: Colors.white,
													fontSize: 25.0,
													fontWeight: FontWeight.bold,
												),
											),

											SizedBox(height: 20.0,),

											CircularProgressIndicator(backgroundColor: Colors.white,),
										],
									),
								),
							);
						}else{
							return Container(
								child: Column(
									children: <Widget>[
										SizedBox(height: 20.0),

										Center(
											child: Card(
												child: Padding(
													padding: EdgeInsets.all(16.0),
													child: Text(
														snapshot.data[qindex].quest,
														style: TextStyle(
															fontSize: 25.0,
															fontWeight: FontWeight.bold,
														),
													),
												),
											),								
										),

										SizedBox(height: 90.0),

										Visibility(
											visible: correctAnswer,
											child: Text(
												"You Answered Correct",
												style: TextStyle(
													color: Colors.green,
													fontSize: 30.0,
													fontWeight: FontWeight.bold,
												),
											),
										),

										Visibility(
											visible: wrongAnswer,
											child: Text(
												"You Answered Wrong",
												style: TextStyle(
													color: Colors.red,
													fontSize: 30.0,
													fontWeight: FontWeight.bold,
												),
											),
										),

										SizedBox(height: 40.0),


										Visibility(
											visible: showAnswer,
											child: Text(
												"Answer: ${snapshot.data[qindex].answer}",
												style: TextStyle(
													fontSize: 25.0,
													fontWeight: FontWeight.bold,
												),
											),
										),

										SizedBox(height: 25.0),

										Visibility(
											visible: showNext,
											child: FlatButton(
												color: Colors.cyan,
												textColor: Colors.white,
												padding: EdgeInsets.all(8.0),
												splashColor: Colors.cyanAccent,
												onPressed: (){
													nextQuestion();
												},
												child: Text(
													"Next Question",
													style: TextStyle(fontSize: 20.0),
												),
											),
										),

										Visibility(
											visible: showSubmit,
											child: FlatButton(
												color: Colors.cyan,
												textColor: Colors.white,
												padding: EdgeInsets.all(8.0),
												splashColor: Colors.cyanAccent,
												onPressed: (){
													Navigator.push(
														context,
														MaterialPageRoute(
															builder: (context) => QuizEnd(score: score),
														),
													);
												},

												child: Text(
													"End Quiz",
													style: TextStyle(fontSize: 20.0),
												),
											),
										),

										Visibility(
											visible: showOptions,
											child: 

										Container(
											child: Column(
											children: <Widget>[
											Center(
											child: Card(
												child: Padding(
													padding: EdgeInsets.all(16.0),
													child: InkWell(
														splashColor: Colors.cyan.withAlpha(30),
														onTap: (){
															checkAnswer(qindex, 0);
														},

														child: Text(
															snapshot.data[qindex].options[0],
														),
													),
												),
											),
										),


										Center(
											child: Card(
												child: Padding(
													padding: EdgeInsets.all(16.0),
													child: InkWell(
														splashColor: Colors.cyan.withAlpha(30),
														onTap: (){
															checkAnswer(qindex, 1);
														},

														child: Text(
															snapshot.data[qindex].options[1]
														),
													),
												),
											),
										),


										Center(
											child: Card(
												child: Padding(
													padding: EdgeInsets.all(16.0),
													child: InkWell(
														splashColor: Colors.cyan.withAlpha(30),
														onTap: (){
															checkAnswer(qindex, 2);
														},

														child: Text(
															snapshot.data[qindex].options[2]
														),
													),
												),
											),
										),


										Center(
											child: Card(
												child: Padding(
													padding: EdgeInsets.all(16.0),
													child: InkWell(
														splashColor: Colors.cyan.withAlpha(30),
														onTap: (){
															checkAnswer(qindex, 3);
														},

														child: Text(
															snapshot.data[qindex].options[3]
														),
													),
												),
											),
										),



												],
											),
										),
									),
	

									],
								),
							);
						}
					},
				)
			),
			/*body: Container(
				child: 
			body:	FutureBuilder(
					future: fetchData(),
					builder: (BuildContext context, AsyncSnapshot snapshot){
						//print(snapshot.data);
						if(snapshot.data == null){
							return Container(
								//color: Colors.cyan,
								//child: Container(
									child: Column(
										mainAxisAlignment: MainAxisAlignment.center,
										crossAxisAlignment: CrossAxisAlignment.center,
										children: <Widget>[
											Text(
												"Your Quiz is being loaded",
												style: TextStyle(
													color: Colors.white,
													fontSize: 25.0,
													fontWeight: FontWeight.bold,
												),
											),

											SizedBox(height: 20.0),

											CircularProgressIndicator(backgroundColor: Colors.white,),
										],
									),
								//),
							);
						}else{
							return Column(
								children: <Widget>[
									Card(
										child: Text(
											snapshot.data[qindex].quest,
										),
									),

									Card(child: Text(snapshot.data[qindex].answer,),),
								],
								//child: Text(snapshot.data[qindex].quest),
							);
						/*
							return ListView.builder(
								itemCount: snapshot.data.length,
								itemBuilder: (BuildContext context, int index){
									return ListTile(
										title: Text(snapshot.data[index].quest),
									);
								},
							);
						*/
						}
					},
				),
			),*/
		);
	}
}











