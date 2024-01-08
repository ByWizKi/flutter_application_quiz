import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import  'package:flutter_application_quiz/my_quiz.dart';


class QuizPage extends StatefulWidget {

  int score;
  int numeroQuestion;
  String question;
  bool reponseQuestion;
  String texteBonneReponse;
  String texteMauvaiseReponse;
  String pathImageQuestion;

  QuizPage({
    super.key,
    required this.score,
    required this.numeroQuestion,
    required this.question,
    required this.reponseQuestion,
    required this.texteBonneReponse,
    required this.texteMauvaiseReponse,
    required this.pathImageQuestion
    });

  @override
  
  // ignore: no_logic_in_create_state
  State<QuizPage> createState() => _QuizPageState();
}


class _QuizPageState extends State<QuizPage> {

  String textDialog = "Passez a la prochaine question";
  @override 
  void initState() {
    super.initState();
  }

  @override 
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Question numéro ${widget.numeroQuestion}",
          style: const TextStyle(
            fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: Colors.amberAccent,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Ton score est de ${widget.score}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          quizContainer(widget.pathImageQuestion, widget.question),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton(
                color: Colors.amberAccent,
                onPressed: () {
                  if(widget.reponseQuestion == true){
                      showResponseQuestion(
                      context,
                      widget.reponseQuestion,
                      widget.texteBonneReponse,
                    );
                    setState(() {
                      widget.score +=1;
                    });
                  }
                  else{
                    showResponseQuestion(
                      context,
                      widget.reponseQuestion,
                      widget.texteMauvaiseReponse,
                    );
                  }
                },
                child: const Text(
                  "Vrai",
                  style:  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
          
              CupertinoButton(
                color: Colors.amberAccent,
                onPressed: () {                  
                  if(widget.reponseQuestion == false){
                      showResponseQuestion(
                      context,
                      widget.reponseQuestion,
                      widget.texteBonneReponse,
                    );
                    setState(() {
                      widget.score +=1;
                    });
                  }
                  else{
                    showResponseQuestion(
                      context,
                      widget.reponseQuestion,
                      widget.texteMauvaiseReponse,
                    );
                  }
                },
                child: const Text(
                  "Faux",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ],
          )
          
        ]
      ), 

    );
  }

  Container quizContainer(String imagePath, String question){
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath), 
          fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [ 
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 30,
            color: Color.fromARGB(255, 104, 102, 102), 
          ), 
        ],
        border: Border.all(
          color: Colors.amberAccent,
          width: 3,
        )
      ),
    
      child: Align(
        alignment: Alignment.center,
        child: Text(
          question,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      )
    );
  }

  void showResponseQuestion(BuildContext context, bool reponse, String texteReponse){
    showCupertinoModalPopup(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text("La bonne réponse était ${(reponse == true) ? "VRAI" : "FAUX"}"),
        content: Text(
          texteReponse,
        ),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              if(widget.numeroQuestion == quizList.length){
                Navigator.popUntil(context, ModalRoute.withName('/'));
              }
              else{
                quizList[widget.numeroQuestion].score = widget.score;
                quizList[widget.numeroQuestion].numeroQuestion = widget.numeroQuestion +1;
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (BuildContext ctx) {
                      return quizList[widget.numeroQuestion];
                    }
                    
                  )
                );
              }

            },
            child: Text(
              (widget.numeroQuestion == quizList.length) ? textDialog = "C'est fini" : textDialog = "Passez à la question suivante !",
              style: const TextStyle(
                color: Color.fromARGB(255, 196, 148, 4)
              ),
            ),
          ),
        ],

      )
    );
  }
}


