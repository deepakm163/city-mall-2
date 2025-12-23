import 'package:flutter/material.dart';

class ProductGalleryScreen extends StatefulWidget {
  @override
  _ProductGalleryScreenState createState() => _ProductGalleryScreenState();
}

class _ProductGalleryScreenState extends State<ProductGalleryScreen> {
  int _currentIndex = 0;
  final List<String> _images = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuCqMc5BGHbrYJAUjsQreg7-wugJZEPFbJJTp1CMStdZwzDdwikPptsXhKHorTwpPE_i2LeK_IhPQ5OchGe-USEaForPgGPDjsTsW8_WokHbYlQYW8a7crocYu-rH72if4scuygfQV2c3S2_3d2g1T8zrfpNIqme7T5Lc1IyCHygxe_xb-2uppjd9lqgPJNBQ7or_GryqW7rnbhDehgDN86v_lIMb15WWNmicul89zt-V_zffi8UkrN2Y6yCfdD8VCMHELkX1IU8zw0',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuArkzh5KDXCmhN7zb5PnI7X7MpTyLld_mWW6ZnSLpuXubtI2nH0fljc0Z5qA2uNVCZkfm2IYqHOOukQ3we1tIbGZ6c_TqJ4LKGl07C_LCwgEQZYfgcM32SbPNy6K1FbudCJG2QO4mdDZzWDmZdyQwi6rfBiIHVYB6Mti63u4CULrcFlDoGtakYwjdXBE7KFKgb3VXv_iVexuXZmuOGfUSjHQrClT5iG3fxf3_z0Zm9mboMeMYAySpLUCKmHxldnHeZL-_N3Ujhd3-w',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuATD3Ho7d2i8KOFZ8C-gjjL2Rcb_0sU8RxzJrl5YWBh6GseeYa8Z50IreI8yj_BLevex6hwZ7LafgILZ-pkCiyNdwV-Ild35zAtkIb95uBefwkMamJL7LTWY1W4ZRSxp7H_GNKFrIlgWCrr4HNWinE73LunjRxV23BYnBDhniFV0rPuTgBHejkYIqrZzeGzGRGUsVDEmnO4Xe5LmHS1C2iORegn-RohYDYCunu2FBrC3O9JNnv29PrZLHwjdJ5TuikCoh9mz0xPYsY',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAbCW3ZqoxCK20SZUIW2dc2r_x1U9j2yruv-ePmW9pulgBvII6CyaiJzEmsugebuWbkYBKogVnqJiJVHnGi-TOJnO3zeFNGuVGsp118nyq5_804Uic8ZTYeeDTDNdkBe-i6eOZqSgVfuTNVgPOu9HsmkyUAieIe2Xnb2lsxGId0khRYftj8pAbT68FA-lyeSJbvbiZ2ET4lXsWCX_IT02Pbx397MUUQ_j7GPj1JTXo1s40qxq__GZwl8DPerM4yVEOnoPeMUjp9zAw',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuArek_6c-llI6zhNgvJ28Ti7POOnYxTPbcrjQ4t8SjMgi_SE6xVWavna6jf8sd3dp_pdiFzz8wms3u1lq5EnO62xS116gB7xUGDGWgDBpOAK_jyeNAtfo5wtdFkV1hKmtKi3pvEq6dyqZokbAiqfLnWe4z6TAE-ndDQLYmsbuqNPYl2djjEo8aswWAM4aUUh3Rh4tJfmBQ44Cp8NpbWODBoAWlR2TwYAI3piaS2u2holVb3PfUgX0G7j3qYf58xOh9sAbNmIXmkVVc',
  ];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0F3),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(_images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _buildIndicator(),
            _buildThumbnails(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.8),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.8),
                child: IconButton(
                  icon: Icon(Icons.favorite_border, color: Color(0xFFFF385C)),
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 12),
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.8),
                child: IconButton(
                  icon: Icon(Icons.share, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: _currentIndex == index ? 24 : 8,
            height: 8,
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: _currentIndex == index ? Color(0xFFFF385C) : Colors.pink[100],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildThumbnails() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _currentIndex == index ? Color(0xFFFF385C) : Colors.transparent,
                  width: 3,
                ),
                image: DecorationImage(
                  image: NetworkImage(_images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

   Widget _buildBottomBar() {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             IconButton(
              onPressed: (){},
              icon: Icon(Icons.chat_bubble_outline),
              color: Color(0xFFFFB400)
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag, color: Colors.white),
              label: Text('Add to Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF385C),
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
