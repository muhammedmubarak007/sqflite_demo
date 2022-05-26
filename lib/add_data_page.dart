import 'package:flutter/material.dart';
import 'helper/helper.dart';
import 'models/Data_models.dart';


class add_data_page extends StatefulWidget {
  const add_data_page({Key? key}) : super(key: key);

  @override
  _add_data_pageState createState() => _add_data_pageState();
}

class _add_data_pageState extends State<add_data_page> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mark_percentage = TextEditingController();
  DatabaseHelper db=DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    void getUesers() async{
      List<Employee>  res= await db.getEmployeeList();
      print(" number of users registered ${res.length}");
    }
    getUesers();

    return Scaffold(
        appBar: AppBar(title: Text('Add'),centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
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
                      Employee emp1=Employee(name.text,int.parse(age.text),
                          address.text,designation.text,double.parse(mark_percentage.text));
                      DatabaseHelper db=DatabaseHelper();
                      db.insertUser(emp1);
                      getUesers();

                      name.clear();
                      age.clear();
                      address.clear();
                      designation.clear();
                      mark_percentage.clear();
                    },
                    child: Text('Submit'))
              ],
            )
          ],
        ));
  }
}
