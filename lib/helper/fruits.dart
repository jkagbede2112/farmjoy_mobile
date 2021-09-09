import 'package:flutter/material.dart';

class frtlst{
  String fruitname;
  double fruitprice;
  String fruitdescription;
  bool shippable;
  String image;
  int? id;

  frtlst({required this.image, required this.fruitname, required this.fruitprice, required this.fruitdescription, required this.shippable, this.id});

  Map<String, dynamic> toMap(){
    if (id == null) {
      return {
        'fruitname': fruitname,
        'fruitprice': fruitprice,
        'fruitdescription': fruitdescription,
        'shippable': shippable,
        'image': image,
      };
    }else{
      return {
        'id': id,
        'fruitname': fruitname,
        'fruitprice': fruitprice,
        'fruitdescription': fruitdescription,
        'shippable': shippable,
        'image': image,
      };
    }
  }

  @override
  String toString(){
    return "frtlst{}";
  }
}

List<frtlst> fruit = [
  frtlst(image: "guava.png", fruitname: "Guava", fruitdescription: "Guava is a common tropical fruit cultivated in many tropical and subtropical regions. Psidium guajava is a small tree in the myrtle family, native to Mexico, Central America, the Caribbean and northern South America", fruitprice: 40.5, shippable: true),
  frtlst(image: "bana.png", fruitname: "Apple", fruitdescription: "An apple is an edible fruit produced by an apple tree. Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today", fruitprice: 40.5, shippable: false),
  frtlst(image: "lemon.png", fruitname: "Lemon", fruitdescription: "The lemon is a species of small evergreen tree in the flowering plant family Rutaceae, native to South Asia, primarily Northeast India. The tree's ellipsoidal yellow fruit is used for culinary and non-culinary purposes throughout the world, primarily for its juice, which has both culinary and cleaning uses", fruitprice: 40.5, shippable: true),
  frtlst(image: "tangerine.png", fruitname: "Tangerine", fruitdescription: "The tangerine is a type of orange. Its scientific name varies. It has been treated as a separate species under the name Citrus tangerina or Citrus x tangerina, or treated as a variety of Citrus reticulata. Citrus tangerina is also treated as a synonym of Citrus deliciosa", fruitprice: 40.5, shippable: true),
  frtlst(image: "mango.png", fruitname: "Mango", fruitdescription: "The mango is a member of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed. Olives, dates, and coconuts are also part of this family.", fruitprice: 40.5, shippable: true),
  frtlst(image: "cashew_red.png", fruitname: "Cashew", fruitdescription: "The cashew tree is a tropical evergreen tree that produces the cashew seed and the cashew apple pseudofruit. The tree can grow as high as 14 m, but the dwarf cultivars, growing up to 6 m, prove more profitable", fruitprice: 5.25, shippable: false),
  frtlst(image: "banana.png", fruitname: "Banana", fruitdescription: "Bananas are among the most important food crops on the planet. They come from a family of plants called Musa that are native to Southeast Asia and grown in many of the warmer areas of the world. Bananas are a healthy source of fiber, potassium, vitamin B6, vitamin C, and various antioxidants and phytonutrients.", fruitprice: 40.5, shippable: false),
  frtlst(image: "orange.png", fruitname: "Orange", fruitdescription: "Oranges are a type of low calorie, highly nutritious citrus fruit. As part of a healthful and varied diet, oranges contribute to strong, clear skin and can help lower a person’s risk of many conditions", fruitprice: 40.5, shippable: true),
];
