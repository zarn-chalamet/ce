import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:midterm/pages/staff_bottom_nav.dart';
import 'package:midterm/staff/staff_editRoomInfo.dart';
import 'package:midterm/staff/staff_logout.dart';

enum RoomStatus { free, reserved, pending, disabled }

class StaffBrowseRoomList extends StatefulWidget {
  const StaffBrowseRoomList({super.key});

  @override
  _StaffBrowseRoomListState createState() => _StaffBrowseRoomListState();
}

class _StaffBrowseRoomListState extends State<StaffBrowseRoomList> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _getStatusColor(RoomStatus status) {
    switch (status) {
      case RoomStatus.free:
        return Color(0xFF4DC591);
      case RoomStatus.reserved:
        return Color(0xFFFF0000);
      case RoomStatus.pending:
        return Color(0xFFFFB948);
      case RoomStatus.disabled:
        return Color(0xFF88889D);
      default:
        return Colors.grey;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                child: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {}); // Update the UI
                        },
                      )
                    : null,
                hintText: 'Browse room name',
                filled: true,
                fillColor: Color(0xFFECE6F0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (text) {
                setState(() {}); // Update the clear button visibility
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatusLabel('Free', Color(0xFF4DC591)),
                _buildStatusLabel('Reserved', Color(0xFFFF0000)),
                _buildStatusLabel('Pending', Color(0xFFFFB948)),
                _buildStatusLabel('Disabled', Color(0xFF88889D)),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditRoomScreen())),
                    child: _buildRoomCard('Room 1', '8 People', 'Free Wifi',
                        'assets/images/room1.png'),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditRoomScreen())),
                    child: _buildRoomCard('Room 2', '10 People', 'Free Wifi',
                        'assets/images/room2.png'),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditRoomScreen())),
                    child: _buildRoomCard('Room 3', '4 People', 'Free Wifi',
                        'assets/images/room3.png'),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditRoomScreen())),
                    child: _buildRoomCard('Room 4', '6 People', 'Free Wifi',
                        'assets/images/room4.png'),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditRoomScreen())),
                    child: _buildRoomCard('Room 5', '12 People', 'Free Wifi',
                        'assets/images/room5.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildStatusLabel(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildRoomCard(
      String roomName, String capacity, String wifi, String imagePath) {
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
              Container(
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Room name without the forward arrow
                    Text(roomName,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.people, size: 12, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(capacity,
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        SizedBox(width: 12),
                        Icon(Icons.wifi, size: 12, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(wifi,
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: [
                        Row(
                          children: [
                            _buildTimeSlot('08:00 - 10:00', RoomStatus.free),
                            _buildTimeSlot(
                                '10:00 - 12:00', RoomStatus.reserved),
                          ],
                        ),
                        Row(
                          children: [
                            _buildTimeSlot('13:00 - 15:00', RoomStatus.pending),
                            _buildTimeSlot(
                                '15:00 - 17:00', RoomStatus.disabled),
                          ],
                        )
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

  Widget _buildTimeSlot(String time, RoomStatus status) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        height: 20,
        padding: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: _getStatusColor(status),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
