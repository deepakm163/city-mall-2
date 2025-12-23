import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Notifications', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Mark all read', style: TextStyle(color: Color(0xFF4F46E5), fontWeight: FontWeight.bold)),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              children: [
                _buildCategoryChip('All', isSelected: true),
                _buildCategoryChip('Orders'),
                _buildCategoryChip('Offers'),
                _buildCategoryChip('System'),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildSectionHeader('Today'),
          _buildNotificationItem(
            icon: Icons.local_shipping,
            iconColor: Colors.green,
            title: 'Order Delivered',
            time: '2m ago',
            message: 'Your order #2938 has been delivered! Tap to rate your experience.',
            isNew: true,
            buttonText: 'Rate Item',
          ),
          SizedBox(height: 16),
           _buildNotificationItem(
            icon: Icons.bolt,
            iconColor: Colors.orange,
            title: 'Flash Sale Alert',
            time: '1h ago',
            message: '50% off on Nike Sneakers starts in 1 hour. Don\'t miss out!',
            isNew: true,
            buttonText: 'Set Reminder',
            isButtonFilled: false
          ),
          SizedBox(height: 24),
           _buildSectionHeader('Yesterday'),
            _buildNotificationItem(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBWNeVP3T4TtyRw6QT5C-K80Hi9yBxcEg6OGEt3sFmfxrnXuIg4Fz6zlCUtrPRPJk5pVWGKTKAiUx7f46uwSWlSXAWT4KMVGghcwC6IIYXwcsBa3vpW1XbD3JhSeVvo1ASVZHYfa2gi3QsZM5owcSZpkoUepX6lXHK76tu8Rnk2CnZHJNmus380JSmYajRMxFsJunhf5Yxh8jiLuMFg_UuPerCOKZN37QQrjZkBi6A9r-FOplhCElVCCZ8cICAp7FGOS3LQQyPFF1wY',
            title: 'Thinking of Blenders?',
            time: 'Yesterday',
            message: 'Based on your recent search, here are top picks for you with free shipping.',
          ),
           SizedBox(height: 16),
           _buildNotificationItem(
            icon: Icons.credit_card,
            iconColor: Colors.blue,
            title: 'Payment Update',
            time: 'Yesterday',
            message: 'Update your payment method to ensure smooth checkout for your next order.',
          ),
           SizedBox(height: 16),
           _buildNotificationItem(
            icon: Icons.percent,
            iconColor: Colors.red,
            title: 'Season Sale Ends Soon',
            time: 'Yesterday',
            message: 'Last chance to grab up to 70% off on winter collection.',
          ),
        ],
      ),
       bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: 3,
        selectedItemColor: Color(0xFF4F46E5),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
         onTap: (index){},
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
     return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        backgroundColor: isSelected ? Color(0xFF4F46E5) : Colors.grey[200],
        shape: StadiumBorder(),
      ),
    );
  }

   Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(title, style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1)),
    );
  }

  Widget _buildNotificationItem({
    IconData? icon,
    String? imageUrl,
    Color? iconColor,
    required String title,
    required String time,
    required String message,
    bool isNew = false,
    String? buttonText,
    bool isButtonFilled = true
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isNew ? BorderSide(color: iconColor!, width: 2) : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(icon != null)
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: iconColor!.withOpacity(0.1),
                    child: Icon(icon, color: iconColor),
                  ),
                if(imageUrl != null)
                   Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          if(isNew) CircleAvatar(radius: 4, backgroundColor: iconColor),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
                      SizedBox(height: 8),
                      Text(message, style: TextStyle(color: Colors.grey[700])),
                    ],
                  ),
                ),
              ],
            ),
             if (buttonText != null) ...[
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(buttonText),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonFilled ? iconColor : iconColor!.withOpacity(0.1),
                    foregroundColor: isButtonFilled ? Colors.white : iconColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
