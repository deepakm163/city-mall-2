import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7F8),
      body: CustomScrollView(
        slivers: [
          _buildHeader(context),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildHelpContent(),
            ]),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250.0,
      backgroundColor: Color(0xFF8B5CF6),
      pinned: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text('Help Center', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text(
                'Hello!\nHow can we help?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for help articles...',
                    prefixIcon: Icon(Icons.search, color: Color(0xFF8B5CF6)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCurrentOrderHelp(),
          SizedBox(height: 24),
          _buildTopics(),
          SizedBox(height: 24),
          _buildTopQuestions(),
           SizedBox(height: 24),
          _buildContactOptions(),
        ],
      ),
    );
  }

  Widget _buildCurrentOrderHelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Need help with this order?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAHv2qX8BSjMbN7F2AJaKFCpQCZ3TFhq52l7gtCmNIVOV5CBu6IF_JZOigS7UVEtCMJxPOQrHDsFXFVRGifZFXfhk-IrJGAc4mrQt9fgFNFtUGDnf3zS0ycqNA9QSi-tNdmdgSQRoVPWInJ-lLztCmjRddCvFuGa8bpI9KUZLhrcSQV06F92C63pBsL4d0P4ae3T3-LcYn0w6V1AojoEhSSXsNodSV-uKvgealVUxvpj6KHUoSGRndtVoylohukNSC4q7M7Fgg_ACo'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order #12345', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                       Row(
                        children: [
                          Icon(Icons.local_shipping, color: Colors.green, size: 16),
                          SizedBox(width: 4),
                          Text('Arriving Today', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        ],
                      ),
                       SizedBox(height: 8),
                       ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.report_problem, size: 16),
                        label: Text('Report Issue'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[100],
                          foregroundColor: Colors.orange[800],
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                 Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopics() {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text('Browse by topic', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
         GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            _buildTopicItem('Returns & Refunds', Icons.assignment_return, Colors.pink),
            _buildTopicItem('Shipping', Icons.local_shipping, Colors.cyan),
            _buildTopicItem('Payments', Icons.credit_card, Colors.purple),
            _buildTopicItem('Account', Icons.person, Colors.amber),
          ],
         )
       ],
     );
  }

  Widget _buildTopicItem(String title, IconData icon, Color color) {
    return Card(
      elevation: 2,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color, size: 28),
            ),
            SizedBox(height: 12),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

   Widget _buildTopQuestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Top Questions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('View all', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
          ],
        ),
         SizedBox(height: 12),
        Card(
           elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
               _buildQuestionTile('How do I return an item?'),
              _buildQuestionTile('Where is my order?'),
              _buildQuestionTile('How do I change my delivery address?'),
              _buildQuestionTile('What payment methods do you accept?', hasBorder: false),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildQuestionTile(String question, {bool hasBorder = true}) {
    return Container(
       decoration: BoxDecoration(
        border: hasBorder ? Border(bottom: BorderSide(color: Colors.grey[200]!)) : null,
      ),
      child: ListTile(
        title: Text(question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        trailing: Icon(Icons.expand_more, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
   Widget _buildContactOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Still need help?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
         SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.chat_bubble, color: Colors.white),
          label: Text('Chat with Us', style: TextStyle(color: Colors.white)),
           style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Color(0xFF8B5CF6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
         SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.mail, color: Color(0xFF8B5CF6)),
                label: Text('Email Us'),
                 style: OutlinedButton.styleFrom(
                  minimumSize: Size(0, 50),
                  foregroundColor: Color(0xFF8B5CF6),
                  side: BorderSide(color: Colors.grey[300]!),
                ),
              ),
            ),
             SizedBox(width: 12),
             Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.call, color: Color(0xFF8B5CF6)),
                label: Text('Call Us'),
                 style: OutlinedButton.styleFrom(
                  minimumSize: Size(0, 50),
                  foregroundColor: Color(0xFF8B5CF6),
                  side: BorderSide(color: Colors.grey[300]!),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
