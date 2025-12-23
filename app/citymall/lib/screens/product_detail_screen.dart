import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 1;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.share, color: Colors.black),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBQOXFXsYTvXnPa7Xw_cMK5r_uFnGoH5Nk5ZZndOJ06yvs_YIFM5qUzOnwGDL0Rr2XlBRlA1rda6qKWDgvTET_qN_Ebn03nsKUE5dcZ7pw8ZMvryN4CqUW23rOu2_kAeyYMFQhGg-JXvX-USh1in7LIoleCsmS_TOrmBGY6S11h25OwbDh5akSVXuUfZllWtqU7wz7OnGC4_A4dqdELRp-2MIJ9QbOZNG7sra2s-xzLL4dTCt4ZD9RuiyLoHR5cERxQglhagua7ZXQ',
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == 0 ? Color(0xFFFF0055) : Colors.white.withOpacity(0.6),
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Urban Running Sneaker - Series 5',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFFF0055), size: 20),
                      SizedBox(width: 4),
                      Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Text('(120 Reviews)', style: TextStyle(color: Color(0xFFFF0055), decoration: TextDecoration.underline)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text('\$89.99', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                      SizedBox(width: 16),
                      Text('\$119.00', style: TextStyle(fontSize: 20, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                      SizedBox(width: 16),
                      Chip(
                        label: Text('25% OFF', style: TextStyle(color: Color(0xFFFF0055), fontWeight: FontWeight.bold, fontSize: 12)),
                        backgroundColor: Color(0xFFFF0055).withOpacity(0.1),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text('Color', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildColorOption(0, Color(0xFF3B82F6)),
                      _buildColorOption(1, Colors.black),
                      _buildColorOption(2, Colors.white, borderColor: Colors.grey[300]),
                    ],
                  ),
                   SizedBox(height: 24),
                  Text('Size (US)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildSizeOption(0, '7'),
                      _buildSizeOption(1, '8'),
                      _buildSizeOption(2, '9'),
                      _buildSizeOption(3, '10'),
                      _buildSizeOption(4, '11', isEnabled: false),
                    ],
                  ),
                  SizedBox(height: 24),
                   ExpansionTile(
                    title: Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Designed for city life, the Series 5 features breathable mesh and our signature impact-absorbing sole. Whether you're sprinting for the bus or taking a long weekend walk, these sneakers provide all-day comfort without sacrificing style."),
                      )
                    ],
                   ),
                    ExpansionTile(
                    title: Text('Materials & Care', style: TextStyle(fontWeight: FontWeight.bold)),
                     children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Some text about materials and care."),
                      )
                    ],
                   ),
                    ExpansionTile(
                    title: Text('Shipping & Returns', style: TextStyle(fontWeight: FontWeight.bold)),
                     children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Some text about shipping and returns."),
                      )
                    ],
                   ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.remove), onPressed: () => setState(() => _quantity > 1 ? _quantity-- : null)),
                    Text('$_quantity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    IconButton(icon: Icon(Icons.add), onPressed: () => setState(() => _quantity++)),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag, color: Colors.white),
                label: Text('Add to Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF0055),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorOption(int index, Color color, {Color? borderColor}) {
    bool isSelected = _selectedColorIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedColorIndex = index),
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? Color(0xFFFF0055) : Colors.transparent, width: 2),
        ),
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: borderColor != null ? Border.all(color: borderColor) : null,
          ),
        ),
      ),
    );
  }

  Widget _buildSizeOption(int index, String size, {bool isEnabled = true}) {
    bool isSelected = _selectedSizeIndex == index;
    return GestureDetector(
      onTap: isEnabled ? () => setState(() => _selectedSizeIndex = index) : null,
      child: Container(
        width: 60,
        height: 50,
        decoration: BoxDecoration(
          color: isEnabled ? (isSelected ? Color(0xFFFF0055) : Colors.white) : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isEnabled ? (isSelected ? Color(0xFFFF0055) : Colors.grey[300]!) : Colors.grey[200]!),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: isEnabled ? (isSelected ? Colors.white : Colors.black) : Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
