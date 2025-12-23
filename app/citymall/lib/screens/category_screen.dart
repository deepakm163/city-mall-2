import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.checkroom, 'label': 'Fashion'},
    {'icon': Icons.star_outline, 'label': 'For You'},
    {'icon': Icons.local_grocery_store, 'label': 'Grocery'},
    {'icon': Icons.devices, 'label': 'Electronics'},
    {'icon': Icons.chair, 'label': 'Home'},
    {'icon': Icons.face_3, 'label': 'Beauty'},
    {'icon': Icons.toys, 'label': 'Toys'},
    {'icon': Icons.sports_soccer, 'label': 'Sports'},
  ];

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
        title: Text('Categories', style: TextStyle(color: Color(0xFFFF5722), fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: Icon(Icons.search, color: Color(0xFFFF5722)),
                suffixIcon: Icon(Icons.mic_none),
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
      body: Row(
        children: [
          _buildSideNavigation(),
          Expanded(
            child: _buildMainContent(),
          ),
        ],
      ),
       bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSideNavigation() {
    return Container(
      width: 100,
      color: Colors.grey[50],
      child: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                border: isSelected ? Border(left: BorderSide(color: Color(0xFFFF5722), width: 4)) : null,
              ),
              child: Column(
                children: [
                   Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.orange[50] : Colors.transparent,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Icon(category['icon'], color: isSelected ? Color(0xFFFF5722) : Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    category['label'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Color(0xFFFF5722) : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainContent() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Container(
          height: 144,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBzz5lD_rO6x6ZikAcaCham8xktWp-19xRHEsQzw3oflX4mWLKGbnYknAWp9W7rg-137q4ggzp8Kimtn-A-Rr6iOtxNE99EQh85dfgj05nRWsfyLv1IMrY1eGlp3BIxYQuveZPv_yMHIVCzGmui3m65RFJKwDtrsBtTrZuXyo0u1ht8jZtev0qGub0uR8CTHu5L4Tyj85wCLsbK3TR02pSCZMXLVJ2IsDekodWH3CeXXlOyQwmBCVYSXkZhiTL7_PKenpYsR3PtCTE'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 24),
        _buildSubCategorySection('Popular', [
          {'name': 'Sneakers', 'items': '2.1k items'},
          {'name': 'T-Shirts', 'items': '5k+ items'},
        ]),
         SizedBox(height: 24),
         _buildSubCategorySection("Men's Fashion", [
          {'name': 'Hoodies'},
          {'name': 'Jeans'},
          {'name': 'Suits'},
           {'name': 'Shorts'},
          {'name': 'Polos'},
          {'name': 'Underwear'},
        ]),
      ],
    );
  }

  Widget _buildSubCategorySection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (title != 'Popular') Text('See All', style: TextStyle(color: Color(0xFFFF5722), fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: title == 'Popular' ? 2 : 3,
            childAspectRatio: title == 'Popular' ? 2.5 : 0.8,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return title == 'Popular'
                ? _buildPopularItem(items[index]['name']!, items[index]['items']!)
                : _buildGridItem(items[index]['name']!);
          },
        ),
      ],
    );
  }

  Widget _buildPopularItem(String name, String itemCount) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.local_offer, color: Colors.orange)),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(itemCount, style: TextStyle(color: Color(0xFFFF5722), fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }
   Widget _buildGridItem(String name) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.image, color: Colors.grey[300], size: 40),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
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
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.local_mall),
            label: 'Mall',
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
