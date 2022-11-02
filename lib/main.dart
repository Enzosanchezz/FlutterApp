import 'package:flutter/material.dart';
import 'package:flutter_app/views/detail_view.dart';
import 'package:flutter_app/views/main_view.dart';

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
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: const Color.fromARGB(255, 161, 221, 220),
      ),
      initialRoute: MainView.id,
      routes: {
        MainView.id: (_) => const MainView(),
        DetailView.id: (_) => const DetailView(),
      },
    );
  }
}
