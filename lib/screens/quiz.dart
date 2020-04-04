import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';

import 'dart:async';
import 'dart:convert';
import '../models/question.dart';
import 'quizend.dart';
import 'loading.dart';


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
	String playtoken = "";
	bool showOptions = true;
	bool showAnswer = false;
	bool correctAnswer = false;
	bool wrongAnswer = false;
	bool showNext = false;
	bool showSubmit = false;
	bool qloading = true;


	@override
	void initState(){
		super.initState();
		fetchData();
	}

	void checkAnswer(int qind, int opind){
//		print("Question Index ${qind}");
//		print("Option Index ${opind}");

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

	Future<void> fetchToken() async{

			final String tokenapi = "https://opentdb.com/api_token.php?command=request";

			var tokenres = await http.get(tokenapi);

			var tokendata = json.decode(tokenres.body);

			setState((){
				playtoken = tokendata["token"];
			});

			print(playtoken);


	}

	Future<List<Question>> fetchData() async{

		var cid = widget.catid;

		if(playtoken == ""){
			fetchToken();

		}

		final String api = "https://opentdb.com/api.php?amount=10&category=${cid}&difficulty=easy&type=multiple&token=${playtoken}";

		var response = await http.get(
			Uri.encodeFull(api),
			headers: {
				"Accept": "application/json"
			}
		);

		print("Helloooooo");

		var data = json.decode(response.body);

		print(data["response_code"]);



		var unescape = new HtmlUnescape();


		for (var q in data["results"]){

			String quest = unescape.convert(q["question"]);
			String answer = unescape.convert(q["correct_answer"]);
			List options = [];

			String op1 = unescape.convert(q["incorrect_answers"][0]);
			String op2 = unescape.convert(q["incorrect_answers"][1]);
			String op3 = unescape.convert(q["incorrect_answers"][2]);

			options.add(op1);

			options.add(op2);

			options.add(op3);

			options.add(answer);

			options.shuffle();
			
			Question aq = Question(quest, answer, options);

			//Question aq = Question(q["question"], q["correct_answer"], q["incorrect_answers"]);

			all_questions.add(aq);
		}

		setState((){
			qloading = false;
		});


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
				automaticallyImplyLeading: false,
			),

			body: Container(
					child: LoadingScreen(),
				),

		);
	}
}











