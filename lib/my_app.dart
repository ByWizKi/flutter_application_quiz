import "package:flutter/cupertino.dart";
import 'package:flutter_application_quiz/my_page.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon application de quiz',
      routes: {
        '/': (_) => MyPage(),
      },
    );
  }
}