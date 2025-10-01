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
    return Scaffold(
      appBar: AppBar(
        title: Text('Index', style: TextStyle(fontSize: 24, color: Colors.red)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Images/my_pic.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 500),
            Image.asset("assets/Images/Frame 161.png"),
            SizedBox(width: 20),
            Container(
              child: Text(
                ' Click on the + button to add a task',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Task_Screen');
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.red),
            label: 'Calendar',
            //backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule, color: Colors.red),
            label: 'Focus',
            // backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag, color: Colors.red),
            label: 'Priority',
            //backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.red),
            label: 'Settings',
            // backgroundColor: Colors.black87,
          ),
        ],
      ),
    );
  }
}
