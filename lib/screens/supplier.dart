import 'package:farmjoy/database_helper.dart';
import 'package:flutter/material.dart';

class Suppliers extends StatefulWidget {
  const Suppliers({Key? key}) : super(key: key);

  @override
  _SuppliersState createState() => _SuppliersState();
}

class _SuppliersState extends State<Suppliers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: supplier(context),
    );
  }
}

Widget supplier(BuildContext context) {
  final _formkey = GlobalKey<FormState>();
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.orange, Colors.deepOrange]),
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  )),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/images/livestock/catfish.png',
                        height: 150),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                  text: "Suppliers Wanted\n\n",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  children: [
                    TextSpan(
                        text:
                            "We are the largest aggregator of farm produce in West Africa! fill the form below to join our network",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.5)),
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white24,
              ),
              child: formfilling(),
            ),
          ],
        ),
      ),
    ),
  );
}

class formfilling extends StatefulWidget {
  const formfilling({Key? key}) : super(key: key);

  @override
  _formfillingState createState() => _formfillingState();
}

class _formfillingState extends State<formfilling> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Your company name'),
              validator: (value){
                if (value!.isEmpty){
                  return "Company name is required";
                }
                return null;
              },
            ),
            TextFormField(
              validator: (value){
                if (value!.isEmpty){
                  return "Your phone number is required";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Your phone number",
              ),
            ),
            TextFormField(
              validator: (value){
                if (value!.isEmpty){
                  return "Your phone number is required";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "",
              ),
            ),
            ElevatedButton(
              onPressed: () async{

                List<Map<String, dynamic>> sups = await dbhelper.dbcon.readsupplier();

                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$sups'),));
                }
              },
              child: Text("Save Submission")
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[]
            ),
          ],
        ),
      ),
    );
  }
}

class suppliers extends StatefulWidget {
  const suppliers({Key? key}) : super(key: key);

  @override
  _suppliersState createState() => _suppliersState();
}

class _suppliersState extends State<suppliers> {
  Future<List<Map<String, dynamic>>> gt = dbhelper.dbcon.readsupplier();
  @override
  Widget build(BuildContext context) {
    return Row(
    );
  }
}
