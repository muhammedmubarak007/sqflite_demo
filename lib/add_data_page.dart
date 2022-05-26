import 'package:flutter/material.dart';
import 'helper/helper.dart';
import 'models/Data_models.dart';

class add_data_page extends StatefulWidget {
  int type = 1;
  Employee emp;

  add_data_page(this.type, this.emp);

  @override
  _add_data_pageState createState() => _add_data_pageState(type, emp);
}

class _add_data_pageState extends State<add_data_page> {
  int type = 1;
  Employee emp;
  String heading = "";

  _add_data_pageState(this.type, this.emp);

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mark_percentage = TextEditingController();
  DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    if (this.type == 1) {
      this.heading = "ADD";
    } else {
      this.heading = "EDIT";
      setState(() {
        name.text = this.emp.name.toString();
        age.text = this.emp.age.toString();
        mark_percentage.text=this.emp.mark_percentage.toString();
        designation.text=this.emp.designation.toString();
        address.text=this.emp.address.toString();
      });
    }

    void getUesers() async {
      List<Employee> res = await db.getEmployeeList();
      print(" number of users registered ${res.length}");
    }

    getUesers();

    return Scaffold(
      appBar: AppBar(
          title: Text(heading),
          centerTitle: true,
          actions: [deleteButton(type)],
      leading: BackButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
    ),
    body: ListView(
    children: [
    Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: TextField(
    decoration: InputDecoration(
    hintText: 'Name',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15))),
    controller: name,
    ),
    ),
    Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: TextField(
    decoration: InputDecoration(
    hintText: 'Age',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15))),
    controller: age,
    ),
    ),
    Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: TextField(
    decoration: InputDecoration(
    hintText: 'Address',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15))),
    controller: address,
    ),
    ),
    Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: TextField(
    decoration: InputDecoration(
    hintText: 'Designation',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15))),
    controller: designation,
    ),
    ),
    Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: TextField(
    decoration: InputDecoration(
    hintText: 'Mark percentage',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15))),
    controller: mark_percentage,
    ),
    ),
    Column(
    children: [
    ElevatedButton(
    onPressed: () {
    Employee emp1 = Employee(
    name.text,
    int.parse(age.text),
    address.text,
    designation.text,
    double.parse(mark_percentage.text));
    DatabaseHelper db = DatabaseHelper();
    db.insertUser(emp1);
    getUesers();

    name.clear();
    age.clear();
    address.clear();
    designation.clear();
    mark_percentage.clear();
    updatebutton();
    },
    child: Text('Submit'))
    ]
    ,
    )
    ]
    ,
    )
    );
  }
Widget updatebutton(type){

}
  Widget deleteButton(type) {
    return type == 2
        ? TextButton(
        onPressed: () {}, child: Icon(Icons.delete, color: Colors.white))
        : Container();
  }
}

