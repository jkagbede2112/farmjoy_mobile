import 'package:flutter/material.dart';

class Fnames{
  String fruitname;
  String price;
  String deliverable;

  Fnames({required this.fruitname, required this.price, required this.deliverable});
}

class Fruits extends StatefulWidget {
  const Fruits({Key? key}) : super(key: key);
  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  List<Fnames> fruits = [
    Fnames(fruitname: "Guava", price: "24.5", deliverable:"Yes"),
    Fnames(fruitname: "Mango", price: "14.5", deliverable:"Yes"),
    Fnames(fruitname: "Tangerine", price: "63.5", deliverable:"No"),
    Fnames(fruitname: "Apples", price: "15.24", deliverable:"Yes"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snacks"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
      ),
    );
  }
}
