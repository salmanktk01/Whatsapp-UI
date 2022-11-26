/*here we will write the function that we will use in function*/
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model.dart';

class UserController extends GetxController {
  RxList users = <User>[].obs;
  RxInt selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchdata();
  }

  void fetchdata() async {
    await Future.delayed(Duration(seconds: 1));
    var Usersresult = [
      User("Muhammad Salman", "hi there!", "9:45"),
      User("Bilal khan", "bye bye", "2:25"),
      User("Muhammad Ali", "Boom Boom", "1:00"),
      User("Tahir", "haha", "4:00"),
    ];
    users.value =
        Usersresult; /*taking the data of usersresult and putting in Users value*/
  }

  changeIndex(int index) {
    selectedIndex.value = index;
  }

  Widget getIcon() {
    if (selectedIndex.value == 0) {
      return const Icon(Icons.message);
    } else if (selectedIndex.value == 1) {
      return const Icon(Icons.add);
    } else {
      return const Icon(Icons.phone);
    }
  }
}
