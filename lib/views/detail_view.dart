import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_app/models/User.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

Future<List<User>> _getUser() async {
  try {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    List<User> users = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var id in jsonData) {
        users.add(User(id["name"], id["email"], id["address"]["city"],
            id["company"]["name"]));
      }
      return users;
    } else {
      throw Exception('falló');
    }
  } catch (Exc) {
    print(Exc);
  }
  throw Exception('Falló');
  // return _getUser();
}

class DetailView extends StatefulWidget {
  static String id = 'detail_view';
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late Future<List<User>> _listUser;
  @override
  void initState() {
    super.initState();
    _listUser = _getUser();
  }

  final picker = ImagePicker();

  String? imagePath;

  void pickMedia() async {
    XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      imagePath = file.path;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User App',
      home: Scaffold(
          backgroundColor: const Color.fromARGB(137, 154, 154, 154),
          appBar: AppBar(
              title: const Text('Users'),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 26, 20, 42)),
          body: FutureBuilder(
            future: _listUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                  crossAxisCount: 1,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 7,
                  childAspectRatio: 2,
                  children: <Widget>[
                    ..._listadoU(snapshot.data!),
                  ],
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return const Text('Error');
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }

  List<Widget> _listadoU(List<User> dataUser) {
    List<Widget> users = [];

    for (var u in dataUser) {
      users.add(Card(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Name: ${u.name}'),
          ),
          const SizedBox(
            height: 5,
          ),
          Text('Email: ${u.email}'),
          const SizedBox(
            height: 3,
          ),
          Text('City: ${u.city}'),
          const SizedBox(
            height: 3,
          ),
          Text('Company: ${u.nameCompany}'),
          const SizedBox(
            height: 40,
          ),
          (imagePath == null) ? Container() : Image.file(File(imagePath!)),
          CustomButton(
              title: 'Pick from Gallery',
              icon: Icons.account_circle_rounded,
              onClick: pickMedia),
        ],
      )));
    }
    return users;
  }
}

Widget CustomButton(
    {required String title,
    required IconData icon,
    required VoidCallback onClick}) {
  return Container(
    width: 190,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 104, 53, 113),
      ),
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(title)
        ],
      ),
    ),
  );
}
