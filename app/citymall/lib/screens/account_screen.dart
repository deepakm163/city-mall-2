import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8FAFC).withOpacity(0.8),
        elevation: 0,
        title: Text('My Account', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildProfileHeader(),
          _buildQuickInfoCards(),
          _buildOrderSection(),
          _buildAccountSettings(),
          _buildSignOutButton(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCbPohchAdTqHtEMmizGre0O1oMadY0NCl8HpqtEV-_yifLmjlAgtsRrnTWQpHeEhs9c04EH_FP8qzKUbOKEf7i2iA1tFeRlZDlSqW64n52YsLvwh1KhLe4Rtb_rmEQaI-BQsdytDQRRSIg1EiQLGLor0Zm-dT4IMItcFlR6pOiQqKi_Pf7hanU8W_4WUtZtT7hzvzNEs-iHHOy332d3sBeP8GzN1uTy98gbR6L2bkYQjlH7sGW7uUDqNAsaTp5JjC76_QCFY7B92o'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFF7C3AED),
                  child: Icon(Icons.edit, color: Colors.white, size: 16),
                ),
              )
            ],
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jane Doe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.workspace_premium, color: Colors.amber[700], size: 16),
                    SizedBox(width: 4),
                    Text('Gold Member', style: TextStyle(color: Colors.amber[800], fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQuickInfoCards() {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildInfoCard(
            title: 'Wallet',
            value: '\$45.00',
            icon: Icons.account_balance_wallet,
            gradientColors: [Color(0xFF7C3AED), Color(0xFFD946EF)],
          ),
           SizedBox(width: 16),
          _buildInfoCard(
            title: 'Points',
            value: '1,200',
            icon: Icons.loyalty,
            bgColor: Colors.white,
            iconBgColor: Colors.amber[100],
            iconColor: Colors.amber[600],
          ),
           SizedBox(width: 16),
          _buildInfoCard(
            title: 'Vouchers',
            value: '3',
            icon: Icons.confirmation_number,
            bgColor: Colors.white,
            iconBgColor: Colors.pink[100],
            iconColor: Colors.pink[600],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    List<Color>? gradientColors,
    Color? bgColor,
    Color? iconBgColor,
    Color? iconColor,
  }) {
    bool isGradient = gradientColors != null;
    return Container(
      width: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: isGradient ? LinearGradient(colors: gradientColors) : null,
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
           BoxShadow(
            color: isGradient ? gradientColors.first.withOpacity(0.3) : Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isGradient ? Colors.white.withOpacity(0.2) : iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: isGradient ? Colors.white : iconColor, size: 20)
              ),
              SizedBox(width: 8),
              Text(title, style: TextStyle(color: isGradient ? Colors.white.withOpacity(0.9) : Colors.grey[600], fontSize: 12)),
            ],
          ),
          Text(value, style: TextStyle(color: isGradient ? Colors.white : Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildOrderSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
         padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Orders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('View History', style: TextStyle(color: Color(0xFF7C3AED), fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOrderStatusIcon(Icons.credit_card, 'To Pay', badge: '1'),
                _buildOrderStatusIcon(Icons.package_2, 'To Ship', badge: '2'),
                _buildOrderStatusIcon(Icons.local_shipping, 'To Receive'),
                _buildOrderStatusIcon(Icons.reviews, 'To Rate'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatusIcon(IconData icon, String label, {String? badge}) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.grey[600], size: 28),
            ),
             if (badge != null)
              Positioned(
                top: -4,
                right: -4,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Color(0xFFEC4899),
                  child: Text(badge, style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              )
          ],
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildAccountSettings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
             padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
             child: Text('Account Settings', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1)),
           ),
           Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
            ),
            child: Column(
              children: [
                 _buildSettingsItem(Icons.location_on, 'My Addresses', Colors.blue[600]!),
                 _buildSettingsItem(Icons.credit_card, 'Payment Methods', Colors.green[600]!),
                 _buildSettingsItem(Icons.favorite, 'Wishlist', Colors.red[600]!),
                 _buildSettingsItem(Icons.headset_mic, 'Help Center', Color(0xFF7C3AED), hasBorder: false),
              ],
            ),
           ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, Color iconColor, {bool hasBorder = true}) {
    return Container(
      decoration: BoxDecoration(
         border: hasBorder ? Border(bottom: BorderSide(color: Colors.grey[100]!)) : null,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[300]),
        onTap: () {},
      ),
    );
  }

  Widget _buildSignOutButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: OutlinedButton(
        onPressed: () {},
        child: Text('Sign Out', style: TextStyle(color: Color(0xFFEC4899), fontWeight: FontWeight.bold)),
        style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          side: BorderSide(color: Colors.grey[200]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      currentIndex: 3,
      selectedItemColor: Color(0xFF7C3AED),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) {},
    );
  }
}
