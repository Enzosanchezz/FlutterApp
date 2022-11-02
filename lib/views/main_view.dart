import 'package:flutter/material.dart';
import 'package:flutter_app/views/detail_view.dart';

class MainView extends StatelessWidget {
  static String id = 'main_view';
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 221, 220),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome 👋🏻!',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            const Text('if you want to see the Users press "Continue"'),
            SizedBox(
              height: size.height * 0.05,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, DetailView.id);
                },
                child: const Text("Let's go!"))
          ],
        ),
      ),
    );
  }
}
