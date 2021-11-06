import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzler/screens/quiz_brain.dart';
import 'package:quizzler/screens/result.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain = QuizBrain();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(Quizzler());
  });
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  List <Widget> scorekeeper = [];
  int score=0;
  int question_num = 1;
  // List <String> questionset = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List <bool> answers = [
  //   false,
  //   true,
  //   true,
  // ];
  //
  // Questions q1 = Questions(q: 'You can lead a cow down stairs but not up stairs.', a:false,);

  void checkanswer(String ans)
  {
    setState(() {
      if(quizBrain.isfinish() == true)
      {
        int s=score;
        Navigator.push(context, MaterialPageRoute(builder: (context)
        {
          return result(s);
        }));
        // Alert(
        //   context: context,
        //   type: AlertType.success,
        //   title: "Sucessfully Finished",
        //   desc: "Your Score $score",
        //   buttons: [
        //     DialogButton(
        //       child: Text(
        //         "Restart",
        //         style: TextStyle(color: Colors.white, fontSize: 20),
        //       ),
        //       onPressed: () => Navigator.pop(context),
        //       width: 120,
        //     )
        //   ],
        // ).show();
        // setscore();
        score = 0;
        question_num = 1;
        quizBrain.reset();
        scorekeeper = [];
      }
      else {
        if (quizBrain.getanswers() == ans) {
          question_num++;
          score++;
          scorekeeper.add(
            Icon(Icons.check, color: Colors.green,),
          );
        }
        else {
          question_num++;
          scorekeeper.add(
            Icon(Icons.close, color: Colors.red,),
          );
        }
        quizBrain.NextQuetion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          //resizeToAvoidBottomInset: false;
          image: DecorationImage(
            // matchTextDirection: true,
            image: AssetImage("lib/images/12.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "${question_num}/${quizBrain.total_question_number()}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "Your Current Score $score",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    quizBrain.getquestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: Text(
                    quizBrain.op1(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    checkanswer(quizBrain.op1());
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: Text(
                    quizBrain.op2(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    checkanswer(quizBrain.op2());
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                  child: Text(
                    quizBrain.op3(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    checkanswer(quizBrain.op3());
                  },
                ),
              ),
            ),
            Row(
              children: scorekeeper,
            )
          ],
        ),
      ),
    );
  }
}