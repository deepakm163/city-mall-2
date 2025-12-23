import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBarAndFilters(),
            Expanded(
              child: ListView(
                children: [
                  _buildRecentSearches(),
                  _buildPopularSearches(),
                  _buildResults(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSearchBarAndFilters() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: Icon(Icons.search, color: Color(0xFFFF5722)),
                    suffixIcon: Icon(Icons.mic, color: Colors.grey[500]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Text('Cancel', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 12),
          Container(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildFilterChip(label: 'Filters', icon: Icons.tune, isPrimary: true),
                _buildFilterChip(label: 'Price', icon: Icons.expand_more),
                _buildFilterChip(label: 'Brand: Nike', icon: Icons.close, isSelected: true),
                _buildFilterChip(label: 'Top Rated'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFilterChip({required String label, IconData? icon, bool isPrimary = false, bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label, style: TextStyle(color: isPrimary || isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
        avatar: icon != null && isPrimary ? Icon(icon, color: Colors.white, size: 18) : null,
        labelPadding: EdgeInsets.symmetric(horizontal: 8),
        backgroundColor: isPrimary ? Color(0xFFFF5722) : (isSelected ? Color(0xFFFF5722) : Colors.white),
        shape: StadiumBorder(side: BorderSide(color: isSelected ? Color(0xFFFF5722) : Colors.grey[300]!)),
        deleteIcon: icon != null && !isPrimary ? Icon(icon, size: 18) : null,
        onDeleted: isSelected ? () {} : null,
      ),
    );
  }

  Widget _buildRecentSearches() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Searches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildRecentSearchItem('Air Jordan 1 Low'),
          _buildRecentSearchItem('Running socks mens'),
          SizedBox(height: 8),
          Text('Clear History', style: TextStyle(color: Color(0xFFFF5722), fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildRecentSearchItem(String query) {
     return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.orange[50],
        child: Icon(Icons.history, color: Color(0xFFFF5722)),
      ),
      title: Text(query, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Icon(Icons.close, color: Colors.grey[400]),
    );
  }

  Widget _buildPopularSearches() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Right Now', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildPopularChip('Sneakers', Icons.trending_up, Colors.red),
              _buildPopularChip('Headphones', null, Colors.blue),
              _buildPopularChip('Smart Watches', null, Colors.green),
              _buildPopularChip('Sportswear', null, Colors.amber),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPopularChip(String label, IconData? icon, Color color) {
    return Chip(
      avatar: icon != null ? Icon(icon, color: color, size: 18) : null,
      label: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      backgroundColor: color.withOpacity(0.1),
      shape: StadiumBorder(side: BorderSide(color: color.withOpacity(0.2))),
    );
  }

   Widget _buildResults() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Results for "Nike"', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Chip(label: Text('124 items'), backgroundColor: Colors.grey[200])
            ],
          ),
          SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
               _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuCeDwUevMNciEU0ZzZzfD44JbO1ST8Qu7_oTOw57lLlsJuqhHJSNUoeeTIsggag-KRmQxri5WLyZirrx96-52jsvXmS-3cxLwkKTNs2xZ5B79gSs29TTXhzhbTnF3-PskGtjxwZkDBJqBoFF3GQtaItz0e43m1vAU4BWPv2B5H_v-gT9lUxPcvcRKqT5ximVyD5fKmkELDQuMYLjRK3Y1eyvfigxQ-JUBburDvZQdUxumW2biCDB7iz1eXVy0crPlBlybl9jsE72Jc', 'Nike Air Zoom Pegasus 39', '120.00'),
               _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuCIVzNMtE-mrVR-zJA8ILU_mlSHmacYhnSDIqUedJqeTRfFK_SfI2h2b_4gtKaOZZ7kRIr4_eAlP5NGXMTabNmVki9iG1LddWM4UGF2sBP23OTwktw_m__DZqHOa9JIT63S4UuVYEIOWR3G5NPkjtUM136sXacCuiBboglJGrjfVZgbc2Xj6pmfBB66k0tl_poPhECke6SaB_s1AeeAMFQyccBa1sbwXAW0892uUUb5OMQUT_YetN99u0tJsUYffAwTKFyPr6JtACE', 'Nike Court Vision Low', '75.00'),
               _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuA2CUet6vgFpwfmpvPVbi3rbmUqbwc4gqT21iaT6UkDq8K55ara5TZ7QbuFYXrT5osJefo0FasIk5OtzgtZZp9EQHeYWKEOVrp6o6vxRzc46m0D1F-0BHYCLqwVCsNGmyUQmXO0apAdHlLc7jpDNySlCQigRIkm8rkKH7abFj8agAYrRt4syUQqXmwpvs5ktZ1445XR0jOKCqkdR2wYUYwycZrndPrxi4HYEgbBeVCYfzfh1a7gKHREYecMwocQ2Jk1GdF-p81JoBY', 'Nike Dunk High Retro', '100', oldPrice: '125'),
               _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuAg0s022p8nyUyg8BiPaTkqcnMsBYoQHe9fIl5es1TAmW0wgRQgnpbqxiIXcHzT_VklT8M3SyxpQRrKDzat4VXzk25QEsfr-vEo0uXtKXe_x1iK7sWyEXM-QYYLU9EdwxCSLngif3StOXmWnLe10dUPG9fPYDoYITd19GdNwFKet1iwhkHhaiwrSAol6T66UaxOOfipv8aYmxZUHGBJ3rD3Jbrp5NXQSrrHt7TKLK6fdxrYihSl2cTD21QPKyVOHhq53HmO_N-jo3M', 'Nike Air Max 90', '130.00'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(String imageUrl, String name, String price, {String? oldPrice}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                 Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                 Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: Icon(Icons.favorite_border, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text('4.9', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
                 SizedBox(height: 4),
                Text(name, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                 SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFF5722), fontSize: 16)),
                        if (oldPrice != null) Text('\$$oldPrice', style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xFFFF5722),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
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
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Color(0xFFFF5722),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
         onTap: (index) {},
      );
  }
}
