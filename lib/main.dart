import 'package:flutter/material.dart';
import 'add_data_page.dart';
import 'helper/helper.dart';
import 'models/Data_models.dart';
DatabaseHelper db=DatabaseHelper();
void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}




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


  List<Employee> employee_list=[];
  int count=0;
  @override
  Widget build(BuildContext context) {
    getUesersdata();
    return  Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: this.count,

          itemBuilder: (context, index) {
            print("item count from main-->${count}");
           Employee emp=this.employee_list[index];
            print("item name from main-->${emp.name}");
            return Card(
              child: ListTile(
                onTap: () {navigate(2, emp);},
                leading: Icon(Icons.account_circle),
                title: Text(
                  emp.name.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text('Age:${emp.age}'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          navigate(1,Employee.empty());
        },
        tooltip: 'Add data',
        child: const Icon(Icons.add),
      ),
    );
  }


  void getUesersdata() async{
    List<Employee>  employees= await db.getEmployeeList();

    setState(() {

      employee_list=employees;
      count=employees.length;

    });

    print(" number of users registered main--> ${employees.length}");
  }

  void navigate(int type,Employee emp) async{

    bool res= await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => add_data_page(type,emp)));
    if(res==true)
    {
      getUesersdata();
    }

  }


}
