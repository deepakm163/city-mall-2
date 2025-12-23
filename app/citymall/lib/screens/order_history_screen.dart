import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Order History', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by product or order ID...',
                prefixIcon: Icon(Icons.search, color: Color(0xFF8B5CF6)),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildOrderItem(
            orderId: '#CM-88231',
            date: 'Oct 24, 2023',
            status: 'Delivered',
            statusColor: Colors.green,
            itemCount: 3,
            total: '45.99',
            imageUrls: [
              'https://lh3.googleusercontent.com/aida-public/AB6AXuB8p1nV3dpwYwKk3laGuUCUE16m8jUgnGrA1zaCs03YUyInrRZlUIh8zXAFs6CLaQSiF2TzkhyvUFEZXdCMJ_knHkayxMCHeeFxx2dw3uUODUWq1BhxZMnMc1dUZm_-r_51RGW2S7t5FxVqSSsfKXbWCUe4wTM8Qb7ukPtSdUv7dhFs44ugz7QubLVjlwruQyi913IsyCVz5F7VziGtSrDTTP-m7QO6Y63rdRmeBxFYOb1P8p27VMl-p1tiGpAKE03a0xYjffobwtk',
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAoYdqz7jOr28mrm2sr9wl7h1XbfdEXugP-6mN8wOC0b2oD2FMMl_xpuzEsD-D94uEilnSJ9GTtPdD86VzDJozJhabPC1a6OL8M3i15WouxuekYu3WrEu0Jng23xBWRIzrJkshUmOQ3bjN5-ChvHmtatkxrVk80fqRuZFFGICQZQDP-JmeYx_3YdLqa-4rGam9owJKXquy4mHqb1xUXXnjyAbzmuP05CWvYUN0crkjHdMBpFbWrUh5Kl7p5I3ry7by4Oy9uc8deaVU',
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDjH6Bo6IFbzL60oPS4DWtZU38p2YHtYmPONw42BHsFbt_Ewd-2pvDm6puiTe_YzSGuN-3oyNKtNc8G7QEsM-MVB46D11MvH4uUqPERtmJ9HiiCMfETo5mwK7wW3SR45-Zso22JsWZ6oI6un85OScZUnalxc-spbAjvkHb-1flzTp0yw6Y2PRBKhw1A4wyaMk23562GBJAbooZt205Yqb4RIDBW-ZNdqyTvOnjNdjkyk28SCBogblxwuOGJvsS7h8S3BSMOofCT5EU',
            ],
            isReorderable: true,
          ),
          SizedBox(height: 16),
           _buildOrderItem(
            orderId: '#CM-77102',
            date: 'Oct 26, 2023',
            status: 'In Transit',
            statusColor: Colors.amber,
            itemCount: 1,
            total: '120.50',
            imageUrls: [
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCn7y0dd1iJFL3kgXUeP3yUrdF9_WI0MPEFiHjANWeN2Ai1A_6K1d9C8FvgMKWn-Y42ETp7zw60NXReFEftUm6rEMlDVW2firUAePsqN2lwcdoUHoZ6h5IgVfWB8Xtl5zKoppN55aEg5EJr9VYfC41LDytMEpFy6QOaUehCdW9C2x3Hy8UPK1U9z-xWOCn1-M907BtMm28YYSl_dBzWLv1XkCRJUnqSAxL6zeEWgNRUf1mXvuXKZ4_Q0WuF1iqZBPCeEqk_lxGghtQ',
            ],
             isReorderable: false,
          ),
           SizedBox(height: 16),
            _buildOrderItem(
            orderId: '#CM-65001',
            date: 'Sep 15, 2023',
            status: 'Cancelled',
            statusColor: Colors.red,
            itemCount: 2,
            total: '12.00',
            imageUrls: [
             'https://lh3.googleusercontent.com/aida-public/AB6AXuBNziEXHwDw59xMia995M_LwO8IiUM2rVaOCjA2YlC66lszCRLHoOsTL6avi4zHCdcUDJ1v-2bQgvkb1t6XlBPKmFXLaa3wsagbNDZ5Bly3q2NDmZ9lKsS9iSYLqV3q9LHG_qpSdbqtZm3pyv_YN4tiPz1mdwEeNKMBXg7t0ZcNBb_UdWcsuL7eu4YL7fos1P3ha3W5y44LTeQDbv4Zt6sMQVr0hiYsFI2A9bVeJKZByVW2LA7pfe6tuKYh_Gh79kg8Cu2s9scAdvU',
             'https://lh3.googleusercontent.com/aida-public/AB6AXuAOI-zYkq-Gz9vFRaOuMrWTbUgNHefSKP33JPmH4gIvG_4bFdW_dPaHNrUYGkP3Gh4aehvTqx505nWSQVZ-InBgFMDJ2FzdGvkN6toto7QIq_TWCeYtHGB6yZqOJzche90o0bn-Zaa3IdIFH1PyAMf3CS9SCoTnjx8LEMc0JNUWCWJd40U6fhfxkLiujhu5wrJ4-fZtXGwzRqFe-7FczB23lRzirAyrcA1GimVUF5rzeZsm0BasS_Rt3GHvGnXESxFNjMu56WCR0Z0',
            ],
             isReorderable: true,
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
            icon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Color(0xFF8B5CF6),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
         onTap: (index) {},
      ),
    );
  }

  Widget _buildOrderItem({
    required String orderId,
    required String date,
    required String status,
    required Color statusColor,
    required int itemCount,
    required String total,
    required List<String> imageUrls,
    bool isReorderable = true,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(date, style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(orderId, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 4, backgroundColor: statusColor),
                      SizedBox(width: 8),
                      Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(imageUrls[index]),
                          fit: BoxFit.cover,
                           colorFilter: status == 'Cancelled' ? ColorFilter.mode(Colors.grey, BlendMode.saturation) : null,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$itemCount Items', style: TextStyle(color: Colors.grey[600])),
                Text('\$$total', style: TextStyle(color: Color(0xFF8B5CF6), fontWeight: FontWeight.bold, fontSize: 18, decoration: status == 'Cancelled' ? TextDecoration.lineThrough : TextDecoration.none)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('View Details'),
                     style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: isReorderable ? () {} : null,
                    icon: Icon(Icons.refresh, size: 18),
                    label: Text('Reorder'),
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8B5CF6),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
