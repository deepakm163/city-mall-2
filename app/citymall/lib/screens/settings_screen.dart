import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Settings', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildProfileCard(),
          _buildSectionHeader('Preferences'),
          _buildSwitchTile('Order Updates', Icons.notifications, Colors.orange, true),
          _buildSwitchTile('Promotions & Sales', Icons.local_offer, Colors.pink, false),
          _buildNavigationTile('Language', Icons.language, Colors.indigo, 'English'),
          _buildNavigationTile('Currency', Icons.attach_money, Colors.teal, 'USD'),
          _buildSectionHeader('Privacy & Security'),
          _buildSwitchTile('FaceID for Purchases', Icons.face, Colors.blue, true),
           _buildNavigationTile('Location Services', Icons.location_on, Colors.purple, 'While Using'),
           _buildSectionHeader('Support'),
            _buildNavigationTile('Help Center', Icons.help, Colors.cyan),
            _buildNavigationTile('Rate CityMall', Icons.thumb_up, Colors.yellow),
            _buildLogoutButton(),

        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF3366).withOpacity(0.05), Color(0xFF7C3AED).withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCQO3U_zAO9I10b31J7pPU3VY0FnkTjae7b27p5v36ZPvLlfHbZKJJURH0TwosZjwej8Au3x52QsOAajtcdzvXrLh3z4xOOSaJrYV4KOmiGvB2t65VqD4SNpdiUyAX5bf352xbziOLbNUs9spl44IqYWt7JtGssfMfWI1go1q4GnhqT5PfP8kQfAthYwSkswenCwqoxPtOkEnQ6DU8j-dnZ9_zjmrgv6PHrSGdNTVh09uoxbT5Yf43mRfqVn_vHy9rQ7Heeph26LrY'),
                  ),
                   Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.check, color: Colors.white, size: 14),
                    ),
                  )
                ],
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Alex Johnson', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('alex.j@citymall.com', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
           SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text('Edit Profile'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
               backgroundColor: Color(0xFFFF3366),
               foregroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Text(title, style: TextStyle(color: Color(0xFFFF3366), fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.5)),
    );
  }

  Widget _buildSwitchTile(String title, IconData icon, Color iconColor, bool value) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.1),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Switch(
        value: value,
        onChanged: (bool newValue) {},
        activeColor: Colors.green,
      ),
    );
  }

  Widget _buildNavigationTile(String title, IconData icon, Color iconColor, [String? value]) {
     return ListTile(
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.1),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value != null) Text(value, style: TextStyle(color: Colors.grey)),
          SizedBox(width: 8),
          Icon(Icons.chevron_right, color: Colors.grey[400]),
        ],
      ),
      onTap: () {},
    );
  }

   Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () {},
            child: Text('Log Out', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              side: BorderSide(color: Colors.red[100]!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
           SizedBox(height: 16),
          Text('CityMall v2.4.1', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
        ],
      ),
    );
  }
}
