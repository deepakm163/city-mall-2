import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Wishlist (5)', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.tune, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your Saved Items (5)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: Text('Edit List', style: TextStyle(color: Color(0xFF8B5CF6), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          _buildWishlistItem(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAX_jofXjuDsA5ZlvzuNNsXhpVXaty8EZbdF8uk7ZHpE5KNil2XietXE0S55tlZIzAkzy0cmxPCAmT8GJE2zKd3M2vwjPVRuOuRG2hEq7W1VC7LisXXFkaUvUCBfefzujzrl8DYl1Q7pWfEOZ-94YIk0_M8d1hT5X_KsYv1RXS8auFnWPapiZmdFgs-jEU34BqOlof8JZYB1aSoS0nbupHBO8qUFe-X8h1puCT5ak1oJacSRpxeabcbXI9eG6oCRL4xQkXRbxigMo0',
            name: 'Nike Air Zoom Pegasus 39',
            details: 'Running • Size 10',
            price: '120.00',
          ),
          _buildWishlistItem(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCD16m3uJxbY6SK5uBGACYCNiYVaPgj_hTuBfbMcBdKIHBvENC1W2fOr_Xp2yL_rMA-pYYB1BQOJgQv4zSS7WK_2Tgk3b7KSFGOepHroNmJI6OD5U6HgVq9D1D_j9MrINKK3z_XJ45uiBmhd8obvAkU0rP1NwBdIp7djBisWOO34HwTD6MIqCmWBr-S64Sj7n2wtHqLsA9SzpostB8aCSIzS-qkCWjnBeCiVmd0FGD9auCmbAepTnFEJUqGFvF4z_QQ3inAbzgyZm0',
            name: 'Vintage Leather Backpack',
            details: 'Low Stock',
            price: '45.50',
            oldPrice: '60.00',
            discount: '24% OFF'
          ),
          _buildWishlistItem(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCWgpx5yM6Q7gkM-kv5sA6m2wwloab7gIM1l-IDsc7rQjpJ6Hb6SLs-L0k6hJs8MnFg7AaRB55GiJKc6u_7erfXaBdiEVUG1UvcmN9d_2Ob1diKqntmsF7kGRWk7yXdjPnwx4SP-K36sVjjK2xi-zRf9DSbz-Xj5nljxuthGV4J-avy0g7jqI9rpKlpThcOR4tPDZBMn5yEGRyRWnIJzmhN-AukJ1bb6NnVRf94KEYn69Sa9-AADoOzkulzNCPgLtRCudBESv3pCHg',
            name: 'Sony WH-1000XM5 Wireless',
            details: 'Out of Stock',
            price: '299.00',
            isOutOfStock: true
          ),
           _buildWishlistItem(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC8ogDZdNxDH40EoEdvT7Lx7xoV7ckz_0IGGM49lJNu8JbPmEk6dtDe5HNXL_zbu7FC_rAn1nho7qJOH3PQ-vwVSy7QVPtkywKqf1LU35do0rlMf_Ood-__3rIKvy03vcu0suUm4h5bECuK3VfE4TQUgwC1awlDdqept15Y3TbCD-tix0s6itYdqT0RPo8Bmi96Mpt_oVHYVnVKVJ9cCsHpaLqejCgMpvN77s_Ry2fl4yuoZNstxJ4STwzfgSAs4iYxEA_aNa7L0Ck',
            name: 'Analog Watch Classic',
            details: 'Accessories',
            price: '180.00',
          ),
          _buildRecommendations(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildWishlistItem({
    required String imageUrl,
    required String name,
    required String details,
    required String price,
    String? oldPrice,
    String? discount,
    bool isOutOfStock = false,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Stack(
              children: [
                 Container(
                  width: 112,
                  height: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                      colorFilter: isOutOfStock ? ColorFilter.mode(Colors.grey, BlendMode.saturation) : null,
                    ),
                  ),
                ),
                if(discount != null)
                   Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12))
                    ),
                    child: Text(discount, style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Expanded(child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                       Icon(Icons.delete, color: Colors.grey[400]),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(details, style: TextStyle(color: isOutOfStock || details == 'Low Stock' ? Colors.red : Colors.grey, fontSize: 12)),
                   SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                           if(oldPrice != null) Text('\$$oldPrice', style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: isOutOfStock ? null : () {},
                        icon: Icon(isOutOfStock ? Icons.notifications : Icons.shopping_cart, color: isOutOfStock ? Colors.grey : Colors.white, size: 16),
                        label: Text(isOutOfStock ? 'Notify' : 'Add', style: TextStyle(color: isOutOfStock ? Colors.grey : Colors.white)),
                         style: ElevatedButton.styleFrom(
                           backgroundColor: isOutOfStock ? Colors.grey[200] : Color(0xFF8B5CF6),
                           shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendations() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Based on your wishlist', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('View all', style: TextStyle(color: Color(0xFF8B5CF6), fontWeight: FontWeight.bold)),
            ],
          ),
           SizedBox(height: 16),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecommendationItem('https://lh3.googleusercontent.com/aida-public/AB6AXuCGCgcjDqs-7Auww6nRjG89jyWJ1kH6ihKoTnqjYDUeFxjipaIpa0d4IKHkuNnb0uNuB8oEFToexmOqcJNdkSPTLBisw0CmrM8d1qbr9E1CKUxbZIZzn8YB1tuirWEhFSA5xj5R4uIodJHkC8uBcih5F5moUzr2JI6kZ8Qj3t_C2t7LJCXWskq-r7PboweqGjxF2V2oli7rDZT2jiDRrR7dhjlyholx42youycWCxuV_tisWAtj56ymMjAhrH8VAlr9L8-02XfUf5I', 'Denim Jacket', '89.99'),
                _buildRecommendationItem('https://lh3.googleusercontent.com/aida-public/AB6AXuALlJ_7hkoc-LNtofq_pUfSbuVyjwGyzUQXi7SjIZChNrowudVcoGtiXCIdrgS_0rja1eP4dTd4YQjzKTIPqA1usHtPpLFh3hbqtnUzBsKgWE5tib1C_uK6pmPeG1AOrYcl_wwhgtk1vfLVbWf7YjxaxYLo8VIV9T-Us2GpM_F1a7zeZs2GOSlj1PyHtdcgT_JlNbMI-e6XcjoRIrHP7D8isEtWoZBUg468sucLSXKeB37Yc1uelpQjTETy7SFlJY4YYP1LEPyKP3g', 'Air Force 1', '110.00'),
                 _buildRecommendationItem('https://lh3.googleusercontent.com/aida-public/AB6AXuDinKIwhiIf9wiu5HVC8jjah5hcOXuOiUHbLMP2c_kQVgDVOjPIpeIboHy3tFX2_7BMM6XShzNXpv9TdfwBxOCJ9QFfD_3AR5eb_nsyN-Lm4rNmP_43jcKFJ3oJXC87wdqh6h2y0bMYjY2D-57LrzSSXdbpNAKPrt7a2n3ybg65riqVTvxIjAOP75qqohTQyaGEHly64DxgF6qKJB3gUBsXKSGkpJ4K12ZZdV_WdE7zUxSR2TW-sF28NtRw3qws8SYyLM3a9uuUku4', 'Ray-Ban Aviator', '150.00'),
              ],
            ),
          )
        ],
      ),
    );
  }
   Widget _buildRecommendationItem(String imageUrl, String name, String price) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  Text('\$$price', style: TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
            ),
          ],
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
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
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
    );
  }
}
