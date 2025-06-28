import 'package:first_app/colors.dart';
import 'package:first_app/pages/chats.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/profile.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({required this.email, required this.name, super.key});

  final String email;
  final String name;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: Text("AutoCar", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(10.0), child: _buildHome()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildHome() {
    if (currentIndex == 0) {
      return HomePage(name: widget.name, email: widget.email);
    } else if (currentIndex == 1) {
      return ChatsPage();
    } else {
      return ProfilePage();
    }
  }
}
