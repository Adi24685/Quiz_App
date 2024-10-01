import "package:flutter/material.dart";
void main() {
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return const MaterialApp(
debugShowCheckedModeBanner: false,
home: QuizApp(),
);
}
}
class QuizApp extends StatefulWidget {
const QuizApp({super.key});
@override
State createState() => _QuizAppState();
}
class _QuizAppState extends State {
 
List<Map> allQuestions = [
{
      "question": "Who is called IronMan of India?",
      "options":["Sarojini Naidu", "Sardar Vallabhbhai Patel", "Lokmanya Tilak", "CV Raman"],
      "correctAnswer": 1,
       },
       {
        "question": "Which is latest Movie of Srk?",
        "options":["Munjya", "Jawan", "Stree2", "Animal"],
         "correctAnswer":1,
       },
       {
        'question':"Who Wrote Merchant of Venice?",
         'options':["ShaksSphere", "Rudyard Kipling","Anton Chekhov", "Aniee Disusa"],
         'correctAnswer':0
       },
       {
        'question':'Which is one of Wonder of India?',
         'options':["Taj Mahal", "Red Fort", "PratapGad","Taj Hotel"],
         'correctAnswer':0
       },
       {
        'question':'Who wrote the Epic Ramayan?',
        'options':[' Maharshi Valmiki','Maharshi vedvyas','Shree Ganesha','Maharshi Kashyap'],
        'correctAnswer':0,
       }

];
int currentQuestionIndex = 0;
int selectedAnswerIndex = -1;
 int score=0;
WidgetStateProperty<Color?> checkAnswer(int answerIndex) {
if (selectedAnswerIndex != -1) {
if (answerIndex ==
allQuestions[currentQuestionIndex]["correctAnswer"]) {
return const WidgetStatePropertyAll(Colors.green);
} else if (selectedAnswerIndex == answerIndex) {
return const WidgetStatePropertyAll(Colors.red);
} else {
return const WidgetStatePropertyAll(null);
}
} else {
return const WidgetStatePropertyAll(null);
}
}
bool questionPage = true;
@override
Widget build(BuildContext context) {
return isQuestionScreen();
}
Scaffold isQuestionScreen() {
if (questionPage == true) {
return Scaffold(
appBar: AppBar(
title: const Text(
"Quiz App",
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.w900,
color: Colors.white,
),
),
centerTitle: true,
backgroundColor: Colors.blue,
),
body: Column(
children: [
const SizedBox(
height: 30,
),
/// QUESTION NUMBER
Row(
children: [
const SizedBox(
width: 130,
),
Text(
"Question : ${currentQuestionIndex +
1}/${allQuestions.length}",
style: const TextStyle(
fontSize: 30,
fontWeight: FontWeight.w700,
),
),
],
),
const SizedBox
(
  height: 50,
),
/// QUESTION
SizedBox(
width: 380,
height: 50,
child: Text(
allQuestions[currentQuestionIndex]["question"],
style: const TextStyle(
fontSize: 25,
fontWeight: FontWeight.w600,
color: Colors.purple,
),
),
),
const SizedBox(
height: 50,
),
/// OPTION 1
SizedBox(
height: 50,
width: 350,
child: ElevatedButton(
style: ButtonStyle(
backgroundColor: checkAnswer(0),
),
onPressed: () {
if (selectedAnswerIndex == -1) {
selectedAnswerIndex = 0;
setState(() {});
}
},
child: Text(
"A.${allQuestions[currentQuestionIndex]['options'][0]}",
style: const TextStyle(
fontSize: 20,
fontWeight: FontWeight.w500,
color: Colors.black,
),
),
),
),
const SizedBox(
height: 25,
),
/// OPTION 2
SizedBox(
height: 50,
width: 350,
child: ElevatedButton(
style: ButtonStyle(
backgroundColor: checkAnswer(1),
),
onPressed: () {
if (selectedAnswerIndex == -1) {
selectedAnswerIndex = 1;
setState(() {});
}
},
child: Text(
"B.${allQuestions[currentQuestionIndex]['options'][1]}",
style: const TextStyle(
fontSize: 20,
fontWeight: FontWeight.w500,
color: Colors.black,
),
),
),
),
const SizedBox(
height: 25,
),
/// OPTION 3
SizedBox(
  height: 50,
width: 350,
child: ElevatedButton(
style: ButtonStyle(
backgroundColor: checkAnswer(2),
),
onPressed: () {
if (selectedAnswerIndex == -1) {
selectedAnswerIndex = 2;
setState(() {});
}
},
child: Text(
"C.${allQuestions[currentQuestionIndex]['options'][2]}",
style: const TextStyle(
fontSize: 20,
fontWeight: FontWeight.w500,
color: Colors.black,
),
),
),
),
const SizedBox(
height: 25,
),
/// OPTION 4
SizedBox(
height: 50,
width: 350,
child: ElevatedButton(
onPressed: () {
if (selectedAnswerIndex == -1) {
selectedAnswerIndex = 3;
setState(() {});
}
},
style: ButtonStyle(
backgroundColor:checkAnswer(3),
),
child: Text(
"D.${allQuestions[currentQuestionIndex]['options'][3]}",
style: const TextStyle(
fontSize: 20,
fontWeight: FontWeight.w500,
color: Colors.black,
),
),
),
),
],
),
floatingActionButton: FloatingActionButton(
onPressed: () {
 
if (selectedAnswerIndex != -1) {

  if(allQuestions[currentQuestionIndex]['correctAnswer'] == selectedAnswerIndex){
  score++;

 } 
/// THIS CHECK THE CONDITION AND SHOWS THE RESULT SCREEN
if (currentQuestionIndex < allQuestions.length - 1) {
currentQuestionIndex++;
} else {
questionPage = false;
}
selectedAnswerIndex = -1;
setState(() {});
}
},
backgroundColor: Colors.blue,
child: const Icon(
Icons.forward,
color: Colors.white,
),
),
);
} else {
return Scaffold(
appBar: AppBar(
title: const Text(
"Quiz Result",
style:TextStyle(
  fontSize: 28,
fontWeight: FontWeight.w900,
color: Colors.white,
),
),
centerTitle: true,
backgroundColor: Colors.blue,
),
body:  Center(
  child: 
 Column(
 mainAxisAlignment: MainAxisAlignment.center,
children: [
   const Text(
    "Test Result",
      style: TextStyle(
        fontSize: 40,
        color: Colors.purple
      ),
  ),
  

Image.network("https://t4.ftcdn.net/jpg/05/93/91/27/360_F_593912714_6pEIEP3YlFQkbwknHEYxQzbne5ZN6BlE.jpg",
height: 200,
),
const SizedBox(height: 30),
const Text(
"Congratulations",
style: TextStyle(
fontSize: 30,
fontWeight: FontWeight.w900,
color: Colors.orange,
),
),
const SizedBox(height: 10),
 Text("Score: $score / ${allQuestions.length}",
 style: const TextStyle(
  fontSize: 20,
 )),
],
),
),

floatingActionButton: FloatingActionButton(onPressed: () =>{
  questionPage=true,
  score=0,
  currentQuestionIndex=0,
  setState(() { }),
  
},
 child:const Icon(Icons.home),
),

);
}
}
}
