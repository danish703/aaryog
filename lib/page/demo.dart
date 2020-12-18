import 'package:aarogya/widget/doctor.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  List<String> doctorName = [
    'Ram Kumar Shrestha',
    'Aashis Gautam',
    'Ravi kumar jha',
    'Hari Kumar Gautam'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo page"),
      ),
      body: ListView.builder(
        itemCount: doctorName.length,
        itemBuilder: (BuildContext c, int i) {
          return Doctor(doctorName[i]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Navigator.of(context).pushNamed(CreatePatient.routeName);
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg'))),
                  ),
                  Text(
                    "Mr. Rk Dahal",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            Divider(
              height: 10,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            Divider(
              height: 10,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            Divider(
              height: 10,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favorite"),
            ),
            Divider(
              height: 10,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
            ),
            Divider(
              height: 10,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
