import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E0),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 340.0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAsLI3D1vgTufsU-SL9C5rv1mo5kwQUwOvZYhdS2iZz6ZtFWgEviTCmUSCTwTuK2XrZ5iMJjY79fgGZ8T846wj0rdzynsQRuzAvEE6yKb2e7zzSUD4HtthXNxjaFWApSmRZzctS6ae1dCANM4rvKIRgi5l6bOA1Rj9Ygid9-EBPUk-EDVJhg8L6XgdrY4pLHGGV80ld6EyNJAQze0DCYpw6xCHePLNdt7PSf8wXxo-1nSpVzRMSmR56jQMh7VrPyu8NjiR4U6553x4',
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.15),
                    colorBlendMode: BlendMode.darken,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xFFFFF3E0)],
                        stops: [0.6, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    top: kToolbarHeight,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Chip(
                        avatar: Icon(Icons.schedule, color: Color(0xFFFF5722), size: 18),
                        label: Text('Est: 1:45 PM - 2:15 PM', style: TextStyle(color: Color(0xFFFF5722), fontWeight: FontWeight.bold)),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Transform.translate(
                offset: Offset(0, -80),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      _buildOrderInfoCard(),
                      SizedBox(height: 16),
                      _buildCourierCard(),
                      SizedBox(height: 16),
                      _buildTimeline(),
                    ],
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildOrderInfoCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF5722).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('On the way', style: TextStyle(color: Color(0xFFFF5722), fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 8),
                    Text('Order #248291', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                     gradient: LinearGradient(colors: [Color(0xFFFF5722), Colors.orange]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('In Transit', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
             Divider(height: 32),
            Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBU2F86X9R04A4GrFvAfMWD9wNecY9o9QXsmaBAyyAx-xDlmTN0NccsC1GlKIu9pz2XW08LMLsZdaqKJtqfYLaQCaUFO1Kc-rmVUxnIDvqvMthLvW3R-pyEW4qM-qWjS6MBAziKcdhaAN0scSr4le1gaxqrWPCOU4C3R_fH6NI86iXseDQkyfl6KTs1hjp5oEzs48SxZanJyOjlT5OpjozSEHE2nw3Y7Hbe7lopSDTjbZxesHCScsakPJSp8TZ5wgOl69sEDEtAf3o'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nike Air Zoom Pegasus 39', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('& 2 other items', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCourierCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCXO6PMrCXXKw9GlIU9XjDrIvWpqyYS9zj_RhjvRaV6wQ6TozThFYbzkcvTw61E7812R8eXgdhT-poPrnOkw1fxeogADKEFQ5OElr5qJVQBAEdcAYU6lV2KEqh7BhjKuJZNCk_3gJ8aEraNOF61F7MNpCYaq_N31Jo-PnZtbuo1jrL4kPstEtRO0jpHe1Zx1nqK46wcyCh5YpdD1O30mVsZp8eSDblnVxkWgs6B8_CsovZTxhcd4VV6JItTkjQXsAiGYgMjeOOIsmE'),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mike', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                     Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text('4.9', style: TextStyle(fontWeight: FontWeight.bold)),
                     SizedBox(width: 8),
                    Text('Courier', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 24,
              backgroundColor: Color(0xFFFF5722),
              child: Icon(Icons.call, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Card(
      elevation: 4,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
       child: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              Text('Timeline', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              _buildTimelineStep('Order Confirmed', '10:00 AM', isCompleted: true),
              _buildTimelineStep('Shipped', '11:30 AM • Distribution Center NY', isCompleted: true),
              _buildTimelineStep('Out for Delivery', '1:15 PM • Approaching your location', isActive: true),
              _buildTimelineStep('Delivered', 'Estimated 2:00 PM', isLast: true),
           ],
         ),
       ),
    );
  }

  Widget _buildTimelineStep(String title, String subtitle, {bool isCompleted = false, bool isActive = false, bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: isActive ? 16 : 12,
                backgroundColor: isCompleted ? Colors.green.withOpacity(0.2) : (isActive ? Color(0xFFFF5722) : Colors.grey[200]),
                child: Icon(
                  isCompleted ? Icons.check : (isActive ? Icons.local_shipping : Icons.home),
                  color: isCompleted ? Colors.green : (isActive ? Colors.white : Colors.grey),
                  size: isActive ? 20 : 16,
                ),
              ),
               if(!isLast) Expanded(child: Container(width: 2, color: isCompleted ? Colors.green.withOpacity(0.2) : Colors.grey[200]))
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: isActive ? 18 : 16, color: isActive ? Color(0xFFFF5722) : (isCompleted ? Colors.black : Colors.grey))),
                  Text(subtitle, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          )
        ],
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
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Report Issue'),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(0, 50),
                 side: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),
           SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('View Order Details'),
               style: ElevatedButton.styleFrom(
                minimumSize: Size(0, 50),
                 backgroundColor: Color(0xFFFF5722),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
