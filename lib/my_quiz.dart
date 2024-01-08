import 'package:flutter_application_quiz/quiz_page.dart';

QuizPage quiz1 = QuizPage(
  score: 0,
  numeroQuestion : 1,
  question: "Les dinosaures ont coexisté avec les humains.",
  reponseQuestion: false,
  texteBonneReponse : "BRAVO ! Les dinosaures ont disparu bien avant l'apparition des humains sur Terre.",  texteMauvaiseReponse : "INCORRECT. Les dinosaures ont existé il y a des millions d'années, bien avant l'humanité.",
  pathImageQuestion : "assets/dino.jpeg"
);


QuizPage quiz2 = QuizPage(
  score: 0,
  numeroQuestion : 1,
  question: "Le diamant est la substance la plus dure de la planète.",
  reponseQuestion: true,
  texteBonneReponse : "BRAVO ! Le diamant est en effet la substance naturelle la plus dure que l'on connaisse.",  texteMauvaiseReponse : "INCORRECT. Dommage, c'est vrai. Le diamant est extrêmement dur.",
  pathImageQuestion : "assets/diamant.jpeg"
);

QuizPage quiz3 = QuizPage(
  score: 0,
  numeroQuestion : 1,
  question: "La Grande Muraille de Chine est visible depuis l'espace.",
  reponseQuestion: false,
  texteBonneReponse : "BRAVO ! Contrairement à la croyance populaire, la Grande Muraille de Chine n'est généralement pas visible à l'œil nu depuis l'espace.",
  texteMauvaiseReponse : "INCORRECT, ce n'est pas correct. La Grande Muraille de Chine n'est pas facilement visible depuis l'espace.",
  pathImageQuestion : "assets/murailleChine.jpeg"
);

List<QuizPage> quizList= [quiz1, quiz2, quiz3];