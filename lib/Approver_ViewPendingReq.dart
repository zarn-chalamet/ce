import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: BookingRequestsPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:
            'Poppins-Regular', // Sets Poppins as the default font across the app
        primaryColor: Colors.orange,
        textTheme: TextTheme(),
      ),
    ),
  );
}

class BookingRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("23",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            Text("Wed", style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text("Oct 2024",
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text("Lecturer",
                style: TextStyle(fontSize: 18, color: Colors.orange)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pending Requests",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Manage Booking Requests',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.close, color: Colors.grey),
                filled: true,
                fillColor: Colors.purple[50],
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  BookingRequestCard(
                      room: "Room 1",
                      time: "8:00 - 10:00",
                      name: "Mr. Daniel",
                      id: "653200",
                      imageUrl: 'assets/images/room1.png'),
                  SizedBox(height: 16),
                  BookingRequestCard(
                      room: "Room 3",
                      time: "13:00 - 15:00",
                      name: "Mr. Duke",
                      id: "653206",
                      imageUrl: 'assets/images/room3.png'),
                  SizedBox(height: 16),
                  BookingRequestCard(
                      room: "Room 3",
                      time: "8:00 - 10:00",
                      name: "Ms. Angela",
                      id: "653201",
                      imageUrl: 'assets/images/room3.png'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          // Implement navigation or index change here
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Colors.orange),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: ''),
        ],
      ),
    );
  }
}

class BookingRequestCard extends StatelessWidget {
  final String room;
  final String time;
  final String name;
  final String id;
  final String imageUrl;

  BookingRequestCard({
    required this.room,
    required this.time,
    required this.name,
    required this.id,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color.fromRGBO(236, 230, 240, 1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                width: 123,
                height: 128,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(room,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(time,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 8),
                  Text("$name\nID: $id", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 255, 0,
                              0), // Background color for Reject button
                          foregroundColor:
                              Colors.white, // Text color for Reject button
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text("Reject"),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(52, 199, 89,
                              1), // Background color for Approve button
                          foregroundColor:
                              Colors.white, // Text color for Approve button
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text("Approve"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
