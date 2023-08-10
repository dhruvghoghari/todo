import 'package:flutter/material.dart';

import 'Addnote.dart';
import 'ConfirmLogin.dart';
import 'CreatLogin.dart';
import 'EditAddNote.dart';
import 'SplashScreen.dart';
import 'TitleScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TitleScreen(),
    );
  }
}
