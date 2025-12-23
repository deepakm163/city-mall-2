import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0F3),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: ListView(
                children: [
                  _buildIllustration(),
                  _buildHeader(),
                  _buildCurrentLocationButton(),
                  _buildDivider(),
                  _buildPincodeEntry(),
                ],
              ),
            ),
             _buildRecentLocations(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Text('Select Location', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          TextButton(
            onPressed: () {},
            child: Text('Skip', style: TextStyle(color: Color(0xFFFF385C), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildIllustration() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBUGtaitxiSJoVjRDnzHotdR1uGjd5HtJHBFZhGtLx6U6DsdbwRQUzYP8uWcXzGPOFx9vZKMfgpmoTCMqRY6sHmGMZ7Ypeijig1RIDBvykH6Rb8Szi-vdY1xUT0n9PQ8nJmJctVXyYwQeeLMonV1okm3Fvwxfn4CAFwxlyWB6rTuHtBJ5QgPMuPgFwsBIlQ0kdXswy-BRAOz2dNRSXLKLuVeNVhXfv8w1qEvGC1lt1eFTp2bTnkVBRkxlDTSoAb10IPMqDZWYcwfKk'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Text(
            'Set Delivery Location',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
               foreground: Paint()
                ..shader = LinearGradient(
                  colors: [Color(0xFFFF385C), Color(0xFFFFB400)],
                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'We need your location to show you products available in your area.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentLocationButton() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ElevatedButton.icon(
        icon: Icon(Icons.my_location, color: Colors.white),
        label: Text('Use Current Location', style: TextStyle(color: Colors.white)),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 56),
          backgroundColor: Color(0xFFFF385C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          Expanded(child: Divider(color: Colors.grey[300])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('OR', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
          Expanded(child: Divider(color: Colors.grey[300])),
        ],
      ),
    );
  }

  Widget _buildPincodeEntry() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter Pincode', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'e.g. 560034',
                    prefixIcon: Icon(Icons.pin_drop, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                child: Text('Check'),
                 style: ElevatedButton.styleFrom(
                  minimumSize: Size(80, 56),
                  backgroundColor: Color(0xFFFFB400).withOpacity(0.1),
                  foregroundColor: Color(0xFFD97706),
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentLocations() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Locations', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 12)),
          SizedBox(height: 8),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFFF385C).withOpacity(0.1),
              child: Icon(Icons.history, color: Color(0xFFFF385C)),
            ),
            title: Text('Bangalore, Karnataka', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('560034, Indiranagar'),
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
