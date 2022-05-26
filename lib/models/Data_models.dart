import 'package:flutter/material.dart';


class Employee {
  int? _id;
  String? _name;
  int? _age;
  String? _address;
  String? _designation;
  double? _mark_percentage;

  String? get name => _name;

  int? get age => _age;

  String? get address => _address;

  String? get designation => _designation;

  double? get mark_percentage => _mark_percentage;


  Employee(this._name,this._age,this._address,this._designation,this._mark_percentage);


  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    debugPrint("INSERTING NAME FROM TO MAP$_name");
    map['name'] = _name;
    map['adress'] = _address;
    map['age'] = _age;
    map['mark_percentage'] = _mark_percentage;
    map['designation']=_designation;
    debugPrint("INSERTING NAME FROM TO MAP$map");
    return map;
  }

  // Extract a Note object from a Map object
  Employee.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._address = map['adress'];
    this._age = map['age'];
    this._mark_percentage = map['mark_percentage'];
    this._designation=map['designation'];
  }


}
