import 'package:farmjoy/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:farmjoy/helper/fruits.dart';
import 'package:farmjoy/helper/fruitful.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:sqflite/sqflite.dart';

class Fnames {
  String fruitname;
  String price;
  String deliverable;

  Fnames(
      {required this.fruitname,
      required this.price,
      required this.deliverable});
}

class Fruits extends StatefulWidget {
  const Fruits({Key? key}) : super(key: key);
  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {

  static int gt = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Stack(
              children: [
                Positioned(
                    top: 40,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_back_ios,
                              color: Colors.green, size: 20,),
                        ),
                      ),
                    )),
                Positioned(
                    top: 150,
                    child: InkWell(
                      onTap: () async{

                        int gtg = await dbhelper.dbcon.savesupplier({
                          'NAME':'Ibrahim Ologun',
                          'ADDRESS': 'Ilorin',
                          'PHONE':'07055518205',
                          'CAC':'62348823'
                        });
                        setState(() {
                          gt = gtg;
                        });
                        print('State now set');
                      },
                      child: Text("Fruits $gt",
                          style: TextStyle(color: Colors.white, fontSize: 40)),
                    )),
                Positioned(
                  bottom: -40,
                  right: -10,
                  child: Image.asset(
                    "assets/images/mangoes.png",
                    width: 300,
                  ),
                ),
              ],
            ),
            width: size.width,
            height: size.height / 2,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 5.0, offset: Offset(1.0, 5.0))],
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(150.0, 100),
                  bottomLeft: Radius.elliptical(150, 100)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.green, Colors.lightBlue]),
            ),
          ),
          Container(
            height: size.height / 2,
            width: size.width,
            padding: EdgeInsets.all(20),
            child: Center(

              child: SingleChildScrollView(
                /*
                child: ListWheelScrollView(
                  itemExtent: 20,
                  children: fruit.map((q){
                    return frtmap(description: '${q.fruitdescription}', fruitname: '${q.fruitname}', image: '${q.image}', fruitprice: q.fruitprice, shippable: q.shippable, context: context, size: size);
                  }).toList(),),
                */
                child: Column(
                  children: fruit.map((q){
                    return frtmap(description: '${q.fruitdescription}', fruitname: '${q.fruitname}', image: '${q.image}', fruitprice: q.fruitprice, shippable: q.shippable, context: context, size: size);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget frtmap({required String description, required String fruitname, required String image, required double fruitprice, required bool shippable, required BuildContext context, required Size size}){
  return InkWell(
    onTap:(){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Fruitful(name:fruitname, description: description, image: image, fruitprice: fruitprice, shippable: shippable);
      }));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 10.0),
      width: size.width-40,
      height: (size.width/4) + 10,
      padding: EdgeInsets.all(5),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child:Image.asset("assets/images/fruits/"+image, width: 100,),
          ),
          Positioned(
            top: 60,
            left: 10,
            child:shippable? Row(children: [Icon( Icons.shopping_cart, color: Colors.white, size: 25,), Text("  Shippable", style: TextStyle(color: Colors.white, fontSize: 14))]) : Text('')
          ),
          Positioned(
            left: 10,
              top:20,
              child: RichText(
                maxLines: 3,
                text: TextSpan(
                  text: '$fruitname',
                  style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.w800),
                  children: [
                    TextSpan(text: '  NGN $fruitprice', style:TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16, shadows: [Shadow(color: Colors.black, blurRadius: 10.0, offset: Offset(0,2))])),
                  ]
                )
              ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color:Colors.black38, blurRadius: 3.0, offset: Offset(0,4.0))],
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        gradient: LinearGradient(begin:Alignment.topRight, end: Alignment.bottomLeft, colors: [Colors.lightGreenAccent, Colors.cyan]),
        color: Colors.greenAccent,
),
    ),
  );
}