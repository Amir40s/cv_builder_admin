import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SaveDataProvider with ChangeNotifier{
  TextEditingController _categoryController = TextEditingController();
  // var _categoryName;

  TextEditingController get categoryController => _categoryController;

   // get categoryName => _categoryName ;

  saveData() {
    // var randomId = DateTime.now().microsecondsSinceEpoch;
    String id =FirebaseFirestore.instance.collection("Users").doc().id.toString();
    FirebaseFirestore.instance.collection("Users").doc(id).set({
      "id": id,
      "category": _categoryController.text.toString(),

    }
    );
    notifyListeners();
  }

  // getData() async {
  //   var userUID = FirebaseAuth.instance.currentUser!.uid;
  //   print("My User UID is : $userUID");
  //
  //   await FirebaseFirestore.instance.collection("users").doc(userUID).get().then((value) {
  //     _categoryName = value.get("name");
  //
  //     _categoryController.text =_categoryName;
  //   }).whenComplete(() {});
  //   notifyListeners();
  // }
}