import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Fruitful extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final double fruitprice;
  final bool shippable;

  const Fruitful({
    Key? key,
    required String this.name,
    required String this.description,
    required String this.image,
    required double this.fruitprice,
    required bool this.shippable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconsize = 15;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeOut,
        animationDuration: Duration(milliseconds: 200),
        buttonBackgroundColor: Colors.deepOrange,
        backgroundColor: Colors.green,
        color:Colors.black38,
        index: 0,
        items:[
          IconButton(
        splashRadius: 12.0,
            iconSize: iconsize,
            onPressed: (){},
            icon: Icon(Icons.account_tree_sharp),
          ),
          IconButton(
            iconSize: iconsize,
            onPressed: (){},
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            iconSize: iconsize,
            onPressed: (){},
            icon: Icon(Icons.account_balance_sharp),
          )
        ]
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin:Alignment.topRight, end:Alignment.bottomLeft, colors:[Colors.green, Colors.lightBlue]),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 2),
                      blurRadius: 5.0)
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.elliptical(size.width / 1.1, size.height / 2)),
                color: Colors.green,
              ),
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 100,
                    right: 20,
                    child: shippable? Icon(Icons.shopping_cart):Text(''),
                  ),
                  Positioned(
                    bottom: 0,
                    left: -10,
                    child: Image.asset(
                      'assets/images/fruits/$image',
                      width: 300,
                    ),
                  ),
                  Positioned(
                      bottom: 35,
                      right: 20,
                      child: Text('$fruitprice NGN', style: TextStyle(color:Colors.white, fontSize: 20, fontFamily: 'Montserrat'))),
                  Positioned(
                    bottom: 60,
                    right: 20,
                    child: Text('$name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat')),
                  ),
                  Positioned(
                    top: 50,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.white24,
                        child: Center(
                            child: Icon(Icons.arrow_back_ios, color: Colors.green[800],),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height - 475,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shippable? Row(
                        children: [
                          Icon(Icons.shopping_cart, size: 40,color: Colors.lightBlue,),
                          Text('We ship', style:TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800)),
                          Spacer(),
                          ElevatedButton(
                            child: Text("Buy", style:TextStyle(color:Colors.white)),
                              onPressed: (){

                              }),
                        ],
                      ):Text('Out of Stock', style:TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w900)),
                      SizedBox(height: 20,),
                      Text('$description',
                          style: TextStyle(
                            height: 1.5,
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
