import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
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
        title: Text('Home & Living', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildSearchBar(),
          _buildPromoBanner(),
          _buildCategoryGrid(),
          _buildBrandList(),
          _buildTrendingNow(),
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
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Color(0xFFF97316),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search in Home & Living...',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 180,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDwH1WSs_aLSf63OBYVUAaXi20ElGh39xLc80dADtjwYliFPHa5PmLEjWML1yaDRgaiK1SC1kn49rU64-UB-Wf12XrABz4-nA-Kaltry12QYTMaN2BuHU_Eq6cE5OPhUL2JhNyDRWJbJAUIfw2E-H9MLfekijVJxmyHCx7bkFAdv0TFaWiymDqKxyJ165w6VhYqRTQdKFvFvNcXh23grsUdbZK7pYotUcKoduIZ1BIUfoOiSHtiPo10mGVdgV5WdtcNbAniqSFnXwY'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('LIMITED OFFER', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 8),
            Text('20% off Kitchenware', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Upgrade your cooking experience today', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    final categories = [
      {'name': 'Furniture', 'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAzqTM9tuxUGkVNDHcx3kjiaIbvWbJuxtJkl33jX0_Hy-5gWoXp1tAcUYUuPVI4ZYz5Flqm3ObL_GPanOsGdgMaH1dxFJS5RoJ0hCd-UlvxyvCzpDf0a6kpnF-7-hZITnZIomaYOj_vyeWiKaKoojFZdNUOlW_NTKRK5b60Lv4OTTOP3_B8jcDL9YKJHRCmVpgET6S_dDXgipTkiWF9WoY7sFhd-oj03LcKjou6jD1l7BD4IxGn3K2zRQZen6qI3LwVsCgslStTEhQ'},
      {'name': 'Decor', 'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBvoSD4NOjR8lcgePC6qPtygFzQtKsG_PWsv4TdldCPGWEz-crk7GJrTSJXWKizwM-8l5UbBYxvh6eFlMe68U6f6PubnGxTQH9ZrhviFKPDuJRm4kpBAYqm4YiEspHgn2dWRCOUGWKTxDiRmMtiSdR7BCAg2ZdXAu4784kLPYCEltmeyOaQBjQTcqWWE_uUPiPxCWQdvMYlVQD9ZrEOry9_ZSCi0z7x3WyV66LydTRLRJgF0EqorZIpXDaLc0dqsTpNQ3JETxAA_zk'},
      {'name': 'Lighting', 'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAIxM78HjUV3U1OUofPOYFojb0OwEJ1T-4XbbhsVVANAUXboHRzxpzHSCtdBRxwp4whtdsdIItoTc5MzVNNXTzOgIbZZUTIng32PdLpfyPdcTaHs5LqDrCWFuIxk1WlGhL271yx9zJ4wM9K04qbrpUbk51LiRdDqOu783J7MtILIC9IVReE-9aZH6Oyw7oCcI-5iM9fidca-8-9mEQw4-tvTYeQSLHu3l87u6Xco4TduyRS_Jj60Qh0Q6tjRFKgKubYYTq4tyHBZ4Y'},
       {'name': 'Kitchen', 'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB60p2VEqdgOSJtj5Cylvw5Gk2bZi4ci378RPR7UrJTgFKLk6SAsP1yOJ0V8rn9MoM9wnW9ivW2I6ozTv9aHXlbi7kGYgr23NJVNDGOr5hWfYobT6DtEli--GE6RL0QlzkhgPxJGW5IQMuac_gVwDBKj4av6GYqn-ngrxkhzkv9-ifmpy0m7N_3_9gwadox_fMk1dTwqhO3Z1okJYh1EkPbgltOWqaLQmtbufJte491YQpf8o13ukEiSf08wBSgFYQ0a2Enwj9Wg3g'},
        {'name': 'Bedding', 'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAXAYVy0zXWlEIJa5cMGTOEYXumNaiJzDNIx3R4yQ9YdOUeZG9vlZuL7ZzTndYy3Jq9yEQSiwan-StDvrDbLquUPmrWu0eWnIUzRXh95dmCnDXmC4gSgReybJzpqsHUUOGl9p3NUpNiiOpWRuGu03A4Zd_ygXA-04YOyAPsd6RdmFX9nn3x7oIM4is4NKc99k9RVCEKDlKhNSC6kG1HHiMSx7KrvS1D8UQb1KBhgCTeEzdpS6WFn_6jRAzn-GWJdyqaRT-h61-j6X8'},
         {'name': 'Storage', 'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuAdt-rlyDCRhU7_J68o72-5wVzJguFi4C4M5RumX0ldH9FLlgaBjmqvslDqtfUVkaxYQ0ClKXJ4c7hEYD_AOWPfeGkBsAXDMzt1oMtVjXXVvME2NiDtTv77mA9l0oUgVkJg12x5PRWpX0IUpVSaBvUb2r8A_LV8wXEoYLtKSd7ugADeYkBKrJltiOx6mjPiZlbffnxUA3I2D5xXk9MklGSaSJGYjFuPkmvxsAFkZ27zc-5kFkUrhX5qAacEUznEPg26jHGvQVVJPe4'},
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shop by Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                         image: DecorationImage(
                          image: NetworkImage(categories[index]['imageUrl']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(height: 8),
                  Text(categories[index]['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildBrandList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shop by Brand', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('See All', style: TextStyle(color: Color(0xFFF97316), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildBrandLogo('https://lh3.googleusercontent.com/aida-public/AB6AXuAUVZPmU_sdyM7EbVbSC44wa1gV2JQlHOzRLBB7vDuHIfV9sQ3JsbhnlZEIylrAD3Mttpp_dwlHGJa7X3KYrYJJDFop4VhZ4wnd_XCslDVXjlZTXeOnMq7pJ_bPwpCMgAvKaNKGPUnpwx88q6iKW-7EQdBOyjGKf0aaB5_Rk6grRyX4ZfkY53DzRPbTgM97UTC3ISKqtmCiZabfLKZHc2M8rTId4ulM-tYIMa8-p5okAxNHjZDCUl0Lc4-Ebe-UU6A5miMB3QbyuQQ', 'IKEA'),
                 _buildBrandLogo('https://lh3.googleusercontent.com/aida-public/AB6AXuAu6rLsKfmginlZLHnEOxpKityGaKYX9DE_fCpHkqSAs-uGnqGhDzrO1e7lO9NG96Lo3p4zi3-QnNtrnSEH4Y45xGQMuo_hyFzDvhgIysnfAVdTXh3Mst3i2x9UnckRneTB9eEcs-6Y0ff5st5CuG2-r0r-qDc45_prUgkhuW4mGa6pk7SEvYoW3boRUDAbdOJ99mCsQyfVW1GX1DzzNfDN6aDrcvZ3FzHeo0J5wZgwckK1LuKVa4iGdrGCr-Xd7M9qukXG0r4xxRQ', 'Philips'),
                  _buildBrandLogo('https://lh3.googleusercontent.com/aida-public/AB6AXuC077laGd59o9tGb5Ba7RbaHfo_3ygfCew4X-mSoDyLJodyipbYDRBMbaQsw_It2en-1AvpzxOCBT6-thZYQqSCXKjl2K0235yfHJZMJGFSZDs-w3krwCl_oFjNxzjmcYi7MYFTsuU0E1pgTyFYf8vRImWat4Z02psb8AWCub8lSro24ze5RpQzRENra2zlZYkL_zr8s1Gz-FMWvfurPSScqB6Fleh1hSfkZ6asEPrlZ-XyR1-0GNE9Z9eiEcmYaZ_97QyCqK5QUV4', 'Samsung'),
                   _buildBrandLogo('https://lh3.googleusercontent.com/aida-public/AB6AXuCKxNzJ9S-AW2Ul4OpEjLDn2bfbJ6tyigAlaeOg2kGBc8ONMMDFslGdmY9VMbH4cY5zXZ-18UAnTY83ErfSNJWLMYtXuupyoVcKVpjx5UHJQslgi6O0tFZ8yYT3lDqh58Y6oq-c-pvGT-C5rIQl19ed611gRYhYrSoUUpJ-Pn4LUvi3F5RabmkT9-BjfxDNyN-O-WWA1kh0DuGtVmF4Cg7rWEfV1DLFRWGrEwuaNkr8KsoFgrFrWDhE9kcbkoUkup5vl4KeH6PJYgY', 'Xiaomi'),
              ],
            ),
          )
        ],
      ),
    );
  }

   Widget _buildBrandLogo(String imageUrl, String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(imageUrl),
            ),
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildTrendingNow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Trending Now', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
           GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
            children: [
              _buildTrendingItem('https://lh3.googleusercontent.com/aida-public/AB6AXuCj7TiBH-BR2jHYr27_qpLFCAp7KltTg5WSfnISqeM_aKSpDKl4Y1ysnaeJF1v0zP-ww1cV6GFsXif8US3Lxtl2nupLngKB6J-vAEnRX6DhwEpOWfgE050clKz3e-mJ3tdrglkkw0G6D2lVGy1pxJC9fS5IKKTY_HgocGSTYtjsImVku108oXNjLHE3R6GIZAXIacdJAFdzYyToaodRJeggjycG6BX3oTEYMcqOOimU03n_fLC-Okoo60v0aOpxNBELFFIIWVzdiUk', 'Minimalist Beige 3-Seater Sofa', '499'),
              _buildTrendingItem('https://lh3.googleusercontent.com/aida-public/AB6AXuA29bbeyFk9a-zJKD5nIH6jHcRsePw2QXFr9icIZFAvzIfmJr6UyhiAJgsRRcvixnuMrcQD8l5F2aZaTFnrBJvE3ybiVeAW4fPDhbkCXJrFcjHJNcyEoxLEB4oM6qllKwHhEHgWw3ftuHgAoWuEpNQ0stuc9bBjLhvco8xGOqWGT1Ym-jpJxgauyg7p8GyVusJgruo6LXTYy9OX33HvqLoaUrnJfhE_ZcHIO_Ae4GUunEVAlK6438aW_Sl3wNyztI1ffy0V_KgKqNk', 'Smart Ambient Table Lamp', '85'),
            ],
           ),
        ],
      ),
    );
  }

    Widget _buildTrendingItem(String imageUrl, String name, String price) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                Text(name, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF97316), fontSize: 16)),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Color(0xFFF97316),
                      child: Icon(Icons.add, color: Colors.white, size: 18),
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
