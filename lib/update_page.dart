
import 'package:flutter/material.dart';

class update_page extends StatefulWidget {
  const update_page({Key? key}) : super(key: key);

  @override
  _update_pageState createState() => _update_pageState();
}

class _update_pageState extends State<update_page> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mark_percentage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text('Update'),centerTitle: true,actions: [TextButton(onPressed: (){
          Navigator.pop(context);
        },
          child: Icon(Icons.delete,color: Colors.white,),)],
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(children: [
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
          ),Column(
            children: [
              ElevatedButton(
                  onPressed: () {

                  },
                  child: Text('Save'))
            ],
          )
        ]));
  }
}
