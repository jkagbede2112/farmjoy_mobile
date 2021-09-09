import 'package:farmjoy/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:farmjoy/db_constants.dart';

class suppliers{
  String sup_name;
  String sup_phone;
  String sup_address;
  String sup_cac;

  suppliers({required this.sup_address, required this.sup_cac, required this.sup_name, required this.sup_phone});

  Map<String, dynamic> toMap(){
    return {
      'supplier_name': db_const.tb_sup_name,
      'supplier_phone':db_const.tb_sup_phone,
      'supplier_address':db_const.tb_sup_address,
      'supplier_cac':db_const.tb_sup_cac
    };
  }

  Map<String, dynamic> tojson(){
    return {

    };
  }
/*
  suppliers.fromMap(Map<String, dynamic> map){
      sup_name = Map['Supplier_name'];
      sup_address = Map['sup_address'];
      sup_address = Map['sup_address'];
  }
*/
  @override
  String toString(){
    return 'Supplier{supplier_name: $sup_name, supplier_phone: $sup_phone, supplier_address: $sup_address}';
  }
}