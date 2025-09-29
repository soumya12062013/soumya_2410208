import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  DateTime? _selectedDate;
  void _onItemTapped(int index) async {
    if (index == 0) {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Selected date: ${pickedDate.toLocal()}")),
        );
      } else {
        setState(() {
          _selectedIndex = index;
        });
      }
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor:
    Colors.black;
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
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 500),
            Image.asset('/assets/Images/Frame 161.png'),
            SizedBox(width: 20),
            Container(
              child: Text(
                'What do you want to do today?',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.white),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule, color: Colors.white),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, color: Colors.blue),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
