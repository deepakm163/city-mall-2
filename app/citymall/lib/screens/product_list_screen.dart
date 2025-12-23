import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Apna Dukan', style: TextStyle(color: Color(0xFFFF4757), fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search headphones, shoes...',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  children: [
                    _buildCategoryChip('All', isSelected: true),
                    _buildCategoryChip('Electronics'),
                    _buildCategoryChip('Fashion'),
                    _buildCategoryChip('Home'),
                    _buildCategoryChip('Beauty'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        padding: EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuBz8VKLLzCE6gdwXAZytamH4iwFyRdVA8GPDcnfMHuJpUsaLvJG6KgZLwVSaIZSz2iv4oq7r43YU8uT3Ho7BqLhbtbXb-hVgV8604H8v2fANIQdtJ4tphF4Tx3ySh0DamggHpHO2tc8xojZyZNWxtbx-Ypd3Pl4xi_yIzDdujYuokplTBvoDB5leVv4alwlN_T9SnksXeRqoUO0jM7QlEtTJb9wNLXLUDqb5q26o44pNN8I8FwI3mOXvP7hAZXy4QR0rtVMO3KtcV0', 'Wireless Noise-Canceling Headphones', '129.99', '159.99', isNew: false, discount: '20%'),
          _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuBdSnBgb3Sc8Ea-70S4lVTqflsSsPy8vXHkVjV7dI1mRvGf7xZMWdTgaSVQ4J3CrcYsNwJzMgg6VYJtpsopeR2n42LFQNOtn07Xq-3zBgfEqPypu8gy8gDYpBmQcmfOmnT_vwZ0H_WzxQo46SCLs2ziNcbtbSCw-pfz7FQ0DQrbg1U5dleUO8jU4ZZ58HQI_4-pGBArMUJTtqOPVi8SU10aL_Anu1mY_WX2hj8DtjR_AXCIgzqDgXljzMiUjoo7QAOUWR8IAQCqrWc', 'Smart Series 7 Watch Midnight', '399.00', null, isNew: false),
          _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuDagCRFPNiTpDmKZMTDrLla_J1cC6eamF304Myr4ESVsh9StcZvxpHdafXv9PA6ZEHzJWY299LkOdccirKcFiGJM2LKAYGAVEnw0_rtBKRH3ucGmrq3XxU01hZp43lk_1KTok0Ck_5WOAT6ze4HY84dCR3BZFTnzsfnQI5LIv3YKRp50S6i_VhVY-t3DTl_-KLSft1pg4SDnGWm1HYrCjN3rqH_O1-4_wOW7Yv3ESMI7kHTKpbS_Dx3yLGhxASxQM7hV8XqRKbMRlc', 'Nike Air Zoom Pegasus Running Shoes', '89.99', null, isNew: true),
          _buildProductItem('https://lh3.googleusercontent.com/aida-public/AB6AXuDBxhrhfcKFpV33ofH3JKtOT6CuDhVYpGGACjwjYfgKPrFaxXS15A0Iuz2buAclLtHol4Sptk2QNl_crW5jdMKOchVQyNdDsMFxWVtMxdTVF74hlfOebd56etfMyDHcRLqBB4bkxU1MebhjnG1lIFd_wizDrNHJuLQMJzL1Co0pEAxzQSlLsGdL1KeqtO3Ug4IuucPfKHRmcsKDhL2oJufpvo-VLaPVSmT89x58CnDkdWYytuxUA_hrBlJu-NpF3XVW-qy1WfxYJM0', 'Urban Leather Travel Backpack', '45.00', '60.00', isNew: false),
        ],
      ),
       bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Color(0xFFFF4757),
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
        label: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
        backgroundColor: isSelected ? Color(0xFFFF4757) : Colors.white,
        shape: StadiumBorder(side: BorderSide(color: isSelected ? Color(0xFFFF4757) : Colors.grey[300]!)),
      ),
    );
  }

  Widget _buildProductItem(String imageUrl, String name, String price, String? oldPrice, {bool isNew = false, String? discount}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
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
                if (isNew)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Chip(
                      label: Text('New', style: TextStyle(color: Colors.white, fontSize: 10)),
                      backgroundColor: Color(0xFF3742FA),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                if (discount != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Chip(
                      label: Text('-$discount', style: TextStyle(color: Colors.white, fontSize: 10)),
                      backgroundColor: Color(0xFFFFA502),
                       padding: EdgeInsets.zero,
                    ),
                  ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: Icon(Icons.favorite_border, color: Color(0xFFFF4757)),
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
                Text(name, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFF4757), fontSize: 16)),
                        if (oldPrice != null)
                          Text('\$$oldPrice', style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xFFFF4757),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
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
