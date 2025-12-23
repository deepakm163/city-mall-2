import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Best Offers', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search specific stores...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
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
        children: [
          _buildFilterChips(),
          _buildHeroOffer(),
          _buildSectionHeader('Hot Coupons'),
          _buildCouponItem('Nike Store', '\$20 Off on orders above \$100', 'NIKE20'),
           SizedBox(height: 16),
          _buildCouponItem('Starbucks', 'Buy 1 Get 1 Free on Frappuccinos', 'Activate Deal', isDeal: true),
           SizedBox(height: 24),
          _buildInviteBanner(),
           SizedBox(height: 24),
           _buildSectionHeader('Trending Now'),
           _buildTrendingItem("H&M", "15% Student Discount"),
           _buildTrendingItem("Best Buy", "\$50 Off Apple Watch"),
        ],
      ),
       bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: [
          _buildChip('All', icon: Icons.local_fire_department, isSelected: true),
          _buildChip('Food'),
          _buildChip('Fashion'),
          _buildChip('Electronics'),
          _buildChip('Beauty'),
        ],
      ),
    );
  }

  Widget _buildChip(String label, {IconData? icon, bool isSelected = false}) {
     return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        avatar: icon != null ? Icon(icon, color: Colors.white, size: 16) : null,
        backgroundColor: isSelected ? Color(0xFFFF2E63) : Colors.white,
        shape: StadiumBorder(side: BorderSide(color: isSelected ? Color(0xFFFF2E63) : Colors.grey[300]!)),
      ),
    );
  }

  Widget _buildHeroOffer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 220,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBun-mwvFCfpHitgkRPI4eo7u3UlrXQzN_qhzgTL_chI9ZVsFKbrV-gaQDhQMVUDIh8N9zzJDP22UYtA1FdT7VeZfW1YkjWTIvXPph5n2AAxlVXhK7VTJajv3tgqDucB_KCNRiYWCTfMYweCPoYoWwjm9zcyjO5GawBoR1cLTxlUwkjoYvQ1qd9uR6yY4lorUZQgdzTzlsyq2g41v9dp3nFfqoRuOTzevAwOWVYxm5l1LmXCeyAtpiFiDo6_WPV37dUMLGebJAOg60'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken)
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Chip(
              label: Text('12h Left', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              avatar: Icon(Icons.timer, color: Colors.white, size: 14),
              backgroundColor: Colors.white.withOpacity(0.2),
            ),
             SizedBox(height: 8),
            Text('50% Off Summer', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            Text('Limited time offer on all summer wear', style: TextStyle(color: Colors.white.withOpacity(0.9))),
             SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Shop Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF2E63),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

   Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
           Text('View All', style: TextStyle(color: Color(0xFFFF2E63), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildCouponItem(String store, String offer, String code, {bool isDeal = false}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                 CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[100],
                  // Placeholder for store logo
                  child: Icon(Icons.store, color: Colors.grey),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(store, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: offer.split(' ').first),
                          TextSpan(
                            text: ' ${offer.split(' ')[1]} ${offer.split(' ')[2]}',
                            style: TextStyle(color: Color(0xFFFF2E63), fontWeight: FontWeight.bold)
                          ),
                           TextSpan(text: ' ${offer.substring(offer.indexOf('Free') + 4)}'),
                        ]
                      )
                    ),
                  ],
                ),
              ],
            ),
             Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Chip(
                  label: Text('Exp: 24 Aug', style: TextStyle(color: Colors.orange, fontSize: 10)),
                  avatar: Icon(Icons.schedule, color: Colors.orange, size: 14),
                  backgroundColor: Colors.orange.withOpacity(0.1),
                ),
                isDeal
                    ? ElevatedButton(
                        onPressed: () {},
                        child: Text(code),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF2E63),
                          foregroundColor: Colors.white,
                        ),
                      )
                    : OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.content_copy, size: 14),
                        label: Text(code),
                         style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xFFFF2E63),
                           side: BorderSide(color: Color(0xFFFF2E63).withOpacity(0.3), style: BorderStyle.solid, width: 2)
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInviteBanner() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Color(0xFFFF2E63), Color(0xFF08D9D6)],
          ),
        ),
        child: Column(
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Invite a friend & get \$10', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Give \$10, Get \$10. Everyone wins!', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12)),
                  ],
                ),
                 Icon(Icons.card_giftcard, color: Colors.white, size: 32),
              ],
            ),
             SizedBox(height: 16),
             ElevatedButton(
              onPressed: () {},
              child: Text('Invite Now'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40),
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFFFF2E63),
              ),
            ),
          ],
        ),
      ),
    );
  }
   Widget _buildTrendingItem(String store, String offer) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(Icons.store, color: Colors.grey),
        ),
        title: Text(store, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(offer),
        trailing: OutlinedButton(
          onPressed: () {},
          child: Text('Apply'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Color(0xFFFF2E63),
            side: BorderSide(color: Color(0xFFFF2E63).withOpacity(0.2)),
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
            icon: Icon(Icons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Color(0xFFFF2E63),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
         onTap: (index) {},
      );
  }
}
