import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'screens/supplier.dart';
import 'screens/fruits.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "",
      theme: ThemeData.light(),
      home: Scaffold(
        body: firstroute(),
      ),
    );
  }
}

class firstroute extends StatelessWidget {
  const firstroute({Key? key}) : super(key: key);

  static final int farmid = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Image.asset('assets/images/tomatoes.jpeg',
                fit:BoxFit.cover,
                height: MediaQuery.of(context).size.height),
          ),
          Positioned(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 180,
              padding: EdgeInsets.only(bottom: 20.0),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color:Colors.black, offset: Offset(0,2.0), blurRadius: 20.0)],
                  borderRadius: BorderRadius.only(
                      bottomRight:Radius.circular(50.0),
                      bottomLeft: Radius.circular(50)),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.greenAccent, Colors.lightGreen]),
                ),
                child:SafeArea(child: Text("Ariyike Farms $farmid", style:TextStyle(color: Colors.teal, shadows: [Shadow(color:Colors.white70, offset: Offset(0,3), blurRadius: 10.0)], fontSize: 30, fontWeight: FontWeight.bold)))
            ),
          ),
          Positioned(
            bottom: 20,
            left:50,
            child: Container(
              padding:EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width - 100,
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: GridView.count(
                childAspectRatio: 1.4,
                  crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: [
                  Menuitem(todo: (){return Fruits();},text: "Fruits", txtcol: Colors.green, bgcolor: Colors.white, context:context),
                  Menuitem(todo: (){return Fruits();},text: "Food items", txtcol: Colors.white, bgcolor: Colors.cyan, context:context),
                  Menuitem(todo: (){return Fruits();},text: "Livestock", txtcol: Colors.white, bgcolor: Colors.teal, context:context),
                  Menuitem(todo: (){return Suppliers();},text: "Suppliers", txtcol: Colors.white, bgcolor: Colors.orange, context:context),
 ],
              )
            ),
          ),
        ]
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.greenAccent.shade100, Colors.green.shade800]),
      ),
    );
  }
}

Widget Menuitem({required String text, required Function todo, required Color txtcol, required Color bgcolor, required BuildContext context}){
  return InkWell(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return todo();
        }),
      );

    },
    child: Container(
      decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(child: Text(text,style: TextStyle(fontSize: 16, color: txtcol, fontWeight: FontWeight.bold),)),
    ),
  );
}