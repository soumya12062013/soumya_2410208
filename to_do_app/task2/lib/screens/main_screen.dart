import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    backgroundColor: Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Index',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: AssetImage('Assets/Images/my_pic.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: Center(child: Container(
        child:Text('')
      )),
    );
  }
}
