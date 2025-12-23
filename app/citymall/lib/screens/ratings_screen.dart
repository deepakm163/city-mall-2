import 'package:flutter/material.dart';

class RatingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Ratings & Reviews', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSummary(),
          _buildFilterChips(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildReviewItem(
                  name: 'Sarah Jenkins',
                  time: '2 days ago',
                  rating: 5,
                  review: 'Absolutely love this item! The delivery was fast and the quality exceeded my expectations. I will definitely be buying more from this seller in the future.',
                   images: [
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCtDvsgDeUpkKuJLA2KL8Pi-n1ircJNvQVU6Qo6UQh5skG9LV0m_Jcm4mla0dOod5p0-0eVg94WHjj-_-FiwmISs2WXkuA-bk2CA7cAzQsxLgQYcahaWZtCc1r5uh-fTdCShTLll5qM0e6xV11WBSBjtwUGOSeLOZq0TeZZjigr-2xmBmTxHTMn0UX4zkxq8HlzulXcYgOGqX6wsUkk1gDTcnN6tJp7RCH2LOIl84iRvvmM8FYZXHMX6wt2Q040uwiMhuq4scHl8EM',
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDoGQKP-cujTUK_hno0F1zmBFl0RixouabQVwtQtGRaGr4rF2B8s6_ZI5h6dYf2oVFaqm2IYx3JHzqZSOpqq0T276bA0jmo1eel39jzUe0WsXa08EygOo6IhX9kOnqgCfZfCUqMiBHRT9dlEQtWuC8xK5MBI-qn_buEwMCGyBBnbC7wUYu9n9DlBzHWh1is9IVdk7xR3INUI5C0NdNU4lacpr8ZWNiAzAVSQULZgcWHUHk2VhSyju_yK1jzcn5lXJl3E0uy_K1MWKM'
                  ],
                  helpfulCount: 12,
                ),
                SizedBox(height: 16),
                _buildReviewItem(
                  name: 'Mike T.',
                  time: '1 week ago',
                  rating: 4,
                  review: 'Good product but the shipping took a little longer than expected. Otherwise, the quality is decent for the price.',
                  helpfulCount: 5,
                ),
                SizedBox(height: 16),
                _buildReviewItem(
                  name: 'Jessica L.',
                  time: '3 weeks ago',
                  rating: 5,
                  review: 'Perfect fit and great material. Highly recommended! The size chart was very accurate.',
                   helpfulCount: 24,
                ),
              ],
            ),
          )
        ],
      ),
       bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSummary() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.red[100]!))
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text('4.8', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
              Row(
                children: List.generate(5, (index) => Icon(Icons.star, color: Color(0xFFFF9500), size: 20)),
              ),
              SizedBox(height: 8),
              Text('1,240 reviews', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                _buildRatingBar(5, 80),
                _buildRatingBar(4, 10),
                _buildRatingBar(3, 5),
                _buildRatingBar(2, 2),
                _buildRatingBar(1, 3),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRatingBar(int star, int percentage) {
    return Row(
      children: [
        Text('$star', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF9500)),
          ),
        ),
        SizedBox(width: 8),
        Text('$percentage%', style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

   Widget _buildFilterChips() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
       decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.red[100]!))
      ),
      child: Row(
        children: [
          _buildChip('All', isSelected: true),
          _buildChip('With Photos', icon: Icons.photo_camera),
          _buildChip('5 Stars'),
        ],
      ),
    );
  }

  Widget _buildChip(String label, {IconData? icon, bool isSelected = false}) {
     return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        avatar: icon != null ? Icon(icon, color: Colors.purple, size: 16) : null,
        backgroundColor: isSelected ? Color(0xFFFF3B30) : Colors.grey[200],
        shape: StadiumBorder(),
      ),
    );
  }

  Widget _buildReviewItem({
    required String name,
    required String time,
    required int rating,
    required String review,
    List<String>? images,
    required int helpfulCount,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  // Placeholder for user image
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) => Icon(Icons.star, color: index < rating ? Color(0xFFFF9500) : Colors.grey[300], size: 16)),
            ),
             SizedBox(height: 16),
            if (images != null)
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(images[index], width: 80, height: 80, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
               if (images != null) SizedBox(height: 16),
            Text(review, style: TextStyle(color: Colors.grey[700])),
             SizedBox(height: 16),
             Divider(color: Colors.grey[200], thickness: 1, height: 1),
             SizedBox(height: 8),
             TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.thumb_up, color: Colors.grey[600], size: 18),
              label: Text('Helpful ($helpfulCount)', style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
     return Container(
       padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: BoxDecoration(
        color: Colors.white,
         boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 30,
          ),
        ],
      ),
      child: ElevatedButton.icon(
        icon: Icon(Icons.edit_square, color: Colors.white),
        label: Text('Write a Review', style: TextStyle(color: Colors.white)),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 56),
          backgroundColor: Color(0xFFFF3B30),
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
