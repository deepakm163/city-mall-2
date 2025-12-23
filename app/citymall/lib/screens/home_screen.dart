import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCP74mQDsF-dvk_fhb84dqpXqvvS_jJImr9LiZTJj_X4J5sNMOI86VO6CPxcBLVSrhvYm6768o2OVrkEjxsC2D7SmiJKHnbHPm6dSLdSEsBUEeJMaTTq9WSAq4ocSXfYnyTtEUkrx8ecSN-NEuB7ST9Cp69kq6bWhPm7zaAldQIXjoQ_ufFeBFoS2wRhoeXn1qx_Ks0sZtpBtM1uiqAiHzIa0h7qxDUdrfXtC4nK6DOA91qG5WOGCCThbO567HCwoDTG1WRrhpZq4o'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning!', style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text('Biswa Mandal', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find products, brands...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic_none),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // Banner
          Container(
            height: 200,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Color(0xFFFF3D00), Color(0xFF6200EA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Summer Sale', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Up to 50% off on vibrant collections', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Shop Now'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFFFF3D00), backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 16),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryItem(Icons.checkroom, 'Fashion'),
                _buildCategoryItem(Icons.devices, 'Tech'),
                _buildCategoryItem(Icons.chair, 'Home'),
                _buildCategoryItem(Icons.face, 'Beauty'),
                _buildCategoryItem(Icons.sports_soccer, 'Sports'),
              ],
            ),
          ),
          // Flash Sale
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.bolt, color: Color(0xFFFF3D00)),
                SizedBox(width: 8),
                Text('Flash Sale', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Text('See All', style: TextStyle(color: Color(0xFFFF3D00), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFlashSaleItem('https://lh3.googleusercontent.com/aida-public/AB6AXuAMXEYbfVgry48LU7-HB0OiKJ3-DkPcykStXIZzKjzx8hWvReV7b96nv-YiYPRxAGSYR78K-AYPoS5hUDaUt0dqaTKLFBlaX6cqn_W-8Ib87WOB-hsis1HlSAvrVouQUCTIGBcyZ81lXw9yWh4bDqwCMUhW6hpCkaOGk2m31I2u1sL5JkK5RI3VrCuK-wTQvHj-Rr0H-DuIOCF03E8nYSjPhPeB8v_oovdm3mpujpTlzfwZOx_Ey8qHBTjzzewirB5StSijDg3bXCM', '129.00', '215.00', 60),
                _buildFlashSaleItem('https://lh3.googleusercontent.com/aida-public/AB6AXuAPLHkMH91lvJGfWHvZi0MOi5vlH2r2uyZ7MFvBg_aa4ACeYgazXLaLtxvx8aj2PBv2usW66SVQJs-IU0VbIZmzTO03ayCkp3Y3X5-zZ6TJQVh__mASApXPC9RL-czG5Q5rCjOxkLFqebSpDt5YrUBlB4f8yx7Vj5OCfdH5cMKdLVzgfNzBfQxdmvp-l7MgKedyfLxpyx5HYAysGC8fJgqZvhQDNuS_cros4_BWNwSpErb-RWUgf3DiGdsMPIdLe-6mdajBl2L7tss', '149.99', '199.99', 85),
                _buildFlashSaleItem('https://lh3.googleusercontent.com/aida-public/AB6AXuA0XieWYoFy0UwET4LV7wXdJ7ZygvfQiko2D3SfwFlcisL0uK69w2T1ky0kMxyzRY0uvS8OPmKtwKgH1OBMbbRnpGNOuk1Tr6vPS_4N5blAcGP22o_rMk3lxqJLbAknolv8HwyxYsFBhvz_VgbIq9jbNndLDrptxqX1irlIKudJLuMVwy1zdZxkTTB-xHUYMFkYjhKMioLg1nYw0h1Z266l4E3GK02uCmTw9zOW-d69pVKrb7gcOzWEw8hHnM7KzPNPu-eO8kKkCCY', '59.50', '119.00', 40),
              ],
            ),
          ),
          // Just for you
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Just for You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
           GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            padding: EdgeInsets.symmetric(horizontal: 16),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuCBYWZFDawxnl_Ed3GsSAUqkUJoLm7-PcuEPmt25dEfmC8NlGhiY9mes1nDepoI8WFkpbIfAId-2DoJx9zduACcI1cSTv-AsjJvcUeJuG26KJx3U7PIuV0fHUMtru8ME0CV2X5R-IvIelSNqXc2wSMqwl3kDh6hlo55Rj8yLaXACYqhEvpTXAqAEAWRJq_BmFI_An1NomZP99atG80sKM1uFGxicrrbL6Mm_vsiPkwSr7ThCZpeOnbnHtgAs8U9LemdYXuqlAY90jM', 'Classic Minimalist Everyday Backpack', '45.00'),
              _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuCdmCFehKmW2DbtoeJcSMUxUdB1gw3tH3f0w9wSs38vKG85qdKrKLz2vocZd4HMJoDjxBHLqXRZC50lJNAOTqYl4cRuqF5c-5f4cXoqYtnSbU6EjUK2OnE6J7y2B7zzxUcHwW4wgwpc03tx7kFC6trw_A3raWPcU_nalyhOnvFBGJ5ed2c8iPwx2VYUdhf855Age1AeRMzwsWAXPJC_CmV2J08fAA_s3TSIkgJ7o4zpmcp26YqDG2nugi6cDUC8Fzm1zqotgVr5LNA', 'Aviator Classic Gold Frame', '154.00'),
              _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuA3CUaevA0FOhzZUn1n9hZx3Ov_8ntuoFZMF0ZdoIi7JMCfhmLkGoDD-AmyanbmzBL-fBckx6It94STmLDQZktv7Q0-SHL5T1q8ol-TOU8aAVBKYagP95wMZpNd72O6u2GPy2y4IlYKIOPUPNFfKP8MnJnsDH-4Q0z4ftJQcyjO-yzUq0R7qDTEEaqDmXeBOlo1vBwGHZepTJ-6A4bVL5TAJsSKw-ZpaoC-PLPXDkrQ3TnjQvUX-VVNklVrokiUF_TEjarwvnclL6s', 'Vertuo Next Coffee and Espresso Machine', '169.00'),
              _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuDeQCnnvfBZIMQiXVfXRxKdNZJHonkv8puarycphcInNvFp2plMNvy1xAJZzOk8mnniWGt6qzjsfmky7ldlTkLKpURN0VakqXZB2P_XumVET3_G0R-aLyLN-fykeLynZc0fKIM9ZKQsDjcHvkWU9Z6hZSus1zrBbFTrTKCLsTifNVJw6MYRpmK8mktaPOTUya3WH6N2JAUtV8K1j2ZH2cIWEDS4lsROGZBBBp1wOxS_REiU2Ksc_j-pWK0I6WG6FRwsLcDkqgycZSs', 'Original Trucker Jacket - Vintage Wash', '89.50'),
            ],
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
            icon: Icon(Icons.shopping_bag),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Color(0xFFFF3D00),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index){},
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.shopping_bag),
        backgroundColor: Color(0xFFFF3D00),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Container(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 32, color: Color(0xFFFF3D00)),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

   Widget _buildFlashSaleItem(String imageUrl, String price, String oldPrice, int soldPercentage) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$$oldPrice', style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: soldPercentage / 100,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF3D00)),
                ),
                 SizedBox(height: 4),
                Text('$soldPercentage% Sold', style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(String imageUrl, String name, String price) {
    return Container(
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFF3D00))),
                    Icon(Icons.add_shopping_cart, color: Color(0xFFFF3D00)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
