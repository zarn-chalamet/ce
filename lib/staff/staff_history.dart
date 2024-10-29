import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:midterm/staff/staff_logout.dart';

enum RoomApprovalStatus { approved, rejected }

class StaffHistory extends StatefulWidget {
  const StaffHistory({super.key});

  @override
  _StaffHistoryState createState() => _StaffHistoryState();
}

class _StaffHistoryState extends State<StaffHistory> {
  DateTime? _selectedDate; // Added to manage selected date
  final String userRole = 'Staff';

  Color _getApprovalColor(RoomApprovalStatus status) {
    return status == RoomApprovalStatus.approved ? Colors.green : Colors.red;
  }

  void _clearFilter() {
    setState(() {
      _selectedDate = null; // Clear the selected date
    });
  }

  // Sample room data
  List<Map<String, dynamic>> rooms = [
    {
      'name': 'Room 1',
      'capacity': '8 People',
      'wifi': 'Free Wifi',
      'status': RoomApprovalStatus.approved,
      'lecturerName': 'Dr. Smith',
      'bookingDate': '2024-10-23', // Date in YYYY-MM-DD format
      'bookingTime': '08:00 - 10:00',
    },
    {
      'name': 'Room 2',
      'capacity': '10 People',
      'wifi': 'Free Wifi',
      'status': RoomApprovalStatus.rejected,
      'lecturerName': 'Prof. Miller',
      'bookingDate': '2024-10-25', // Date in YYYY-MM-DD format
      'bookingTime': '13:00 - 15:00',
    },
    // Add more rooms as needed
  ];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String dayOfMonth = DateFormat('d').format(now);
    String dayOfWeek = DateFormat.EEEE().format(now);
    String monthYear = DateFormat('MMMM yyyy').format(now);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              dayOfMonth,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dayOfWeek,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  monthYear,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StaffLogout())),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Role: $userRole',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter by Date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate; // Store selected date
                          });
                        }
                      },
                      child: Text('Select Date'),
                    ),
                    SizedBox(width: 10),
                    if (_selectedDate != null)
                      GestureDetector(
                        onTap: _clearFilter,
                        child: Icon(
                          Icons.cancel, // Updated icon
                          color: Colors.red, // Icon color
                          size: 30, // Icon size
                        ),
                      ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children:
                    _buildFilteredRoomCards(), // Updated method to get filtered rooms
              ),
            ),
          ],
        ),
      ),
    );
  }

  // New method to filter and build room cards based on the selected date
  List<Widget> _buildFilteredRoomCards() {
    return rooms.where((room) {
      // Filter logic based on selected date
      if (_selectedDate != null) {
        DateTime roomDate = DateTime.parse(room['bookingDate']);
        return roomDate.isAtSameMomentAs(
            _selectedDate!); // Check if room date matches selected date
      }
      return true; // If no date is selected, show all rooms
    }).map((room) {
      return _buildRoomCard(
        room['name'],
        room['capacity'],
        room['wifi'],
        room['status'],
        room['lecturerName'],
        room['bookingDate'],
        room['bookingTime'],
      );
    }).toList();
  }

  Widget _buildRoomCard(
      String roomName,
      String capacity,
      String wifi,
      RoomApprovalStatus status,
      String lecturerName,
      String bookingDate,
      String bookingTime) {
    // Remove spaces from the room name to create a valid image path
    String imageName = roomName.toLowerCase().replaceAll(' ', '');

    return Container(
      width: 300,
      height: 160,
      child: Card(
        color: Color(0xFFECE6F0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Left-side image section
              Container(
                width: 90,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/$imageName.png'), // Dynamic image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(roomName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.people, size: 10, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(capacity,
                            style: TextStyle(color: Colors.grey, fontSize: 10)),
                        SizedBox(width: 12),
                        Icon(Icons.wifi, size: 10, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(wifi,
                            style: TextStyle(color: Colors.grey, fontSize: 10)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booked by',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                          decoration: BoxDecoration(
                            color: _getApprovalColor(status),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            status == RoomApprovalStatus.approved
                                ? 'Approved by'
                                : 'Rejected by',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Student Name',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700]),
                        ),
                        Text(
                          lecturerName,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date:',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700]),
                        ),
                        Text(
                          bookingDate,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Time:',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700]),
                        ),
                        Text(
                          bookingTime,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
