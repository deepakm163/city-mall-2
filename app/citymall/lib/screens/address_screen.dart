import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int _viewIndex = 1; // 0 for Saved, 1 for New

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Shipping Address', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildToggleButtons(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildContactDetails(),
                SizedBox(height: 24),
                _buildLocationDetails(),
                 SizedBox(height: 24),
                _buildAddressType(),
                 SizedBox(height: 24),
                _buildDefaultAddressToggle(),
              ],
            ),
          )
        ],
      ),
       bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildToggleButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _viewIndex = 0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: _viewIndex == 0 ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                     boxShadow: _viewIndex == 0 ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)] : [],
                  ),
                  child: Center(child: Text('Saved Addresses', style: TextStyle(fontWeight: FontWeight.bold, color: _viewIndex == 0 ? Color(0xFF7C3AED) : Colors.grey[600]))),
                ),
              ),
            ),
             Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _viewIndex = 1),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: _viewIndex == 1 ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                     boxShadow: _viewIndex == 1 ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)] : [],
                  ),
                  child: Center(child: Text('Add New Address', style: TextStyle(fontWeight: FontWeight.bold, color: _viewIndex == 1 ? Color(0xFF7C3AED) : Colors.grey[600]))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        _buildTextField('Full Name', 'John Doe'),
        SizedBox(height: 16),
         _buildTextField('Mobile Number', '123 456 7890', prefix: '+1'),
      ],
    );
  }

  Widget _buildTextField(String label, String placeholder, {String? prefix}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 14)),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: placeholder,
            prefixText: prefix,
            prefixStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
             focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF7C3AED)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationDetails() {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Location', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        Container(
          height: 128,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
             image: DecorationImage(
              image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDazM6WtMR_Dc4OYgKuboPgBRYxIi4Pd3Imlnhzp9a_jfzesLNYHsbjDexrpYk1dxQupnDKK5Gpm0UG2ny-voCEdeNVtUx5fZmpnBzQfAZjRPXpcej2ItaMOS7Txg1U0ehxL4rNCEAcUvko8J9rh7tcNLFm1pAmEkhcZTaDJnvbQFzwYR8IoFut2WlqxWEc-_yrl9u1vGsihEuFHw1mDclVn2C-l5gddkqkFzTljdwdvbdnlE2hb95AwT_YVqgUVD5o2eB64biPEQA'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken)
            ),
          ),
          child: Center(
            child: ElevatedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.my_location),
              label: Text("Use Current Location"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF7C3AED),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
         Row(
          children: [
            Expanded(child: _buildTextField('Zip Code', '10001')),
            SizedBox(width: 16),
            Expanded(child: _buildTextField('State', 'NY')),
          ],
        ),
         SizedBox(height: 16),
         _buildTextField('City', 'New York City'),
         SizedBox(height: 16),
         _buildTextField('House No., Building Name', 'Apt 4B, The Skyline'),
         SizedBox(height: 16),
          _buildTextField('Road Name, Area, Colony', '123 Broadway St'),
      ],
    );
  }

  Widget _buildAddressType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Save Address As', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 14)),
        SizedBox(height: 12),
        Row(
          children: [
            _buildTypeChip('Home', Icons.home, isSelected: true),
            _buildTypeChip('Work', Icons.work),
            _buildTypeChip('Other', Icons.location_on),
          ],
        )
      ],
    );
  }

  Widget _buildTypeChip(String label, IconData icon, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: ChoiceChip(
        label: Text(label),
        avatar: Icon(icon, size: 16),
        selected: isSelected,
        onSelected: (bool selected) {},
        selectedColor: Color(0xFF7C3AED),
        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
        backgroundColor: Colors.grey[200],
      ),
    );
  }

   Widget _buildDefaultAddressToggle() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text('Set as Default Address', style: TextStyle(fontWeight: FontWeight.bold)),
                 Text('Use this address for all future orders', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Switch(
            value: true,
            onChanged: (bool newValue){},
            activeColor: Color(0xFF7C3AED),
          )
        ],
      ),
    );
  }

   Widget _buildBottomBar() {
     return Container(
       padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: BoxDecoration(
        color: Colors.white,
         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Save Address', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 56),
           backgroundColor: Color(0xFF7C3AED),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
