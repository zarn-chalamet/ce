//lib/custom_bottom_nav.dart

import 'package:flutter/material.dart';
import 'package:midterm/staff/Dashboard.dart';
import 'package:midterm/staff/staff_browse_room_list.dart';
import 'package:midterm/staff/staff_editingRoom.dart';
import 'package:midterm/staff/staff_history.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>
      onItemTapped; // Updated to use ValueChanged for better clarity

  const CustomBottomNav({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped, // Make sure this is in the constructor
  }) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    // Prevents reloading the same page
    if (index == selectedIndex) return;

    // Define the corresponding page to navigate to
    late final Widget page;
    switch (index) {
      case 0:
        page = StaffBrowseRoomList();
        break;
      case 1:
        page = RoomBookingScreen();
        break;
      case 2:
        page = const StaffHistory();
        break;
      case 3:
        page = DashboardScreen();
        break;
      default:
        page = DashboardScreen();
    }

    // Navigate to the selected page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );

    // Call the onItemTapped callback to notify the parent widget
    onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Requests',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      backgroundColor: const Color(0xFFF9F9F9),
    );
  }
}
