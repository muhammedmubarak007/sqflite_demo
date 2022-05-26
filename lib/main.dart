import 'package:flutter/material.dart';
import 'package:sqflite_demo/update_page.dart';
import 'add_data_page.dart';
import 'helper/helper.dart';
import 'models/Data_models.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

List names = [
  'mubarak',
  'mushthaq',
  'mahboob',
  'mubarak',
  'mushthaq',
  'mahboob',
];
List age = [
  '18',
  '16',
  '13',
  '18',
  '16',
  '13',
];


class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:home_page());
  }
}

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  @override
  Widget build(BuildContext context) {
    DatabaseHelper db=DatabaseHelper();
    void getUesersdata() async{
      List<Employee>  res= await db.getEmployeeList();

      print(" number of users registered ${res.length}");
    }
    getUesersdata();
    return  Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => update_page()));},
                leading: Icon(Icons.account_circle),
                title: Text(
                  names[index],
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text('Age:${age[index]}'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => add_data_page()));
        },
        tooltip: 'Add data',
        child: const Icon(Icons.add),
      ),
    );
  }
}
