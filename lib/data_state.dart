import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/User.dart';

class DataState with ChangeNotifier {
  bool isLoading = false;
  int totalPages = 0;
  int currentPage = 0;
  List<User> items = [];
}
