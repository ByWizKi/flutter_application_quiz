import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_application_quiz/my_quiz.dart";


class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String firstText = "Page d'accueil";
  int score = 0;
  String fistText2 = 'Ton score est de ';
  int numeroQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      navigationBar: const CupertinoNavigationBar(
        middle: Text("Quiz"),
        backgroundColor: Colors.amberAccent,
      ),

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              firstText,
              textAlign: TextAlign.center,
              style: const TextStyle(
              fontSize: 26,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.amberAccent,
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 30,
                    color: Color.fromARGB(255, 104, 102, 102), 
                  ),
                ]
              ),

              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Les règles du quiz",
                    style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    "- Il y aura des questions avec 2 rêponses possible VRAI ou FAUX",
                    textAlign: TextAlign.center,
                  ),
                  Text("- Si bonne réponse +1 point"),
                  Text("- Sinon 0 point"),
                  Text("- À vous de jouer !")
                ]
              ),
            ),

            CupertinoButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (BuildContext ctx)  {
                    if(quizList.length != numeroQuestion){
                      quizList[numeroQuestion].score = score;
                      quizList[numeroQuestion].numeroQuestion = numeroQuestion+1;
                      return quizList[numeroQuestion];
                    }
                    else{
                      numeroQuestion = 0;
                      quizList[numeroQuestion].numeroQuestion = numeroQuestion+1;
                      return quizList[numeroQuestion];
                    }
                  })
                );
              },
              color: Colors.amberAccent,
              child: const Text(
                "Démarrer",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ],
        )
      ) 
    );
  }
} 


