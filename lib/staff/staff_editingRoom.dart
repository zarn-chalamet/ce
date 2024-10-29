import 'package:flutter/material.dart';
import 'package:midterm/pages/staff_bottom_nav.dart';
import 'package:midterm/staff/staff_addNewRoom.dart';
import 'package:midterm/staff/staff_logout.dart';

class RoomBookingScreen extends StatefulWidget {
  @override
  _RoomBookingScreenState createState() => _RoomBookingScreenState();
}

class _RoomBookingScreenState extends State<RoomBookingScreen> {
  int _selectedIndex = 1;
  // Initial status for each room and slot
  Map<String, List<String>> roomStatuses = {
    'Room 1': ['Free', 'Free', 'Free', 'Free'],
    'Room 2': ['Pending', 'Free', 'Free', 'Pending'],
    'Room 3': ['Reserved', 'Free', 'Free', 'Disabled'],
    'Room 4': ['Reserved', 'Free', 'Free', 'Free'],
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to update room status
  void updateRoomStatus(String roomName, int index, String newStatus) {
    setState(() {
      roomStatuses[roomName]![index] = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                children: [
                  Text(
                    '23',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Wed', style: TextStyle(fontSize: 16)),
                      Text('Oct 2024', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'Staff',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StaffLogout())),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Editing Rooms',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 1, color: Colors.grey[300]),
              const SizedBox(height: 10),

              // Table Header
              const Row(
                children: [
                  Expanded(
                      child: Text('Time',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Text('08:00', textAlign: TextAlign.center)),
                  Expanded(child: Text('10:00', textAlign: TextAlign.center)),
                  Expanded(child: Text('13:00', textAlign: TextAlign.center)),
                  Expanded(child: Text('15:00', textAlign: TextAlign.center)),
                ],
              ),
              const SizedBox(height: 10),

              // Room Booking Table
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: roomStatuses.keys.map((roomName) {
                      return buildRoomRow(roomName, roomStatuses[roomName]!);
                    }).toList(),
                  ),
                ),
              ),

              // Add New Rooms Button
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddRoomScreen()));
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text('Add new rooms',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Function to build each room row with status dropdowns
  Widget buildRoomRow(String roomName, List<String> statuses) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(roomName,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
          ...statuses.asMap().entries.map((entry) {
            int index = entry.key;
            String status = entry.value;
            return Expanded(
              flex: 2,
              child: Center(
                child: buildStatusDropdown(roomName, index, status),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  // Function to build the status dropdown button with consistent size

  Widget buildStatusDropdown(String roomName, int index, String currentStatus) {
    List<String> statuses;

    // Check if the current status is Pending or Reserved
    if (currentStatus == 'Pending' || currentStatus == 'Reserved') {
      // No dropdown for Pending or Reserved
      return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 8, vertical: 4), // Reduced padding
        decoration: BoxDecoration(
          color: currentStatus == 'Pending' ? Colors.orange : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            currentStatus,
            style: const TextStyle(
                color: Colors.white, fontSize: 10), // Reduced font size
          ),
        ),
      );
    } else {
      // Only Free and Disabled options for Free and Disabled status
      statuses = ['Free', 'Disabled'];
    }

    Color getStatusColor(String status) {
      switch (status) {
        case 'Free':
          return Colors.green;
        case 'Disabled':
          return Colors.grey;
        default:
          return Colors.grey;
      }
    }

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: currentStatus,
        icon: const Icon(Icons.arrow_drop_down, size: 12), // Reduced icon size
        elevation: 16,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10), // Reduced font size
        onChanged: (String? newValue) {
          if (newValue != null) {
            updateRoomStatus(roomName, index, newValue);
          }
        },
        items: statuses.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 4), // Reduced padding
              decoration: BoxDecoration(
                color: getStatusColor(value),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  value,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 10), // Reduced font size
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
