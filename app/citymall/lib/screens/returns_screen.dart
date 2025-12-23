import 'package:flutter/material.dart';

class ReturnsScreen extends StatelessWidget {
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
        title: Text('My Returns', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(12),
                fillColor: Color(0xFF6366F1),
                selectedColor: Colors.white,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Active Requests'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Start a Return'),
                  ),
                ],
                isSelected: [true, false],
                onPressed: (int index) {},
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildReturnItem(),
          SizedBox(height: 20),
          _buildReturnItemSimple(),
           SizedBox(height: 20),
          _buildRefundPolicy(),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildReturnItem() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order #24819', style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Purchased on Oct 12, 2023', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                Chip(
                  label: Text('Processing', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                  backgroundColor: Colors.orange.withOpacity(0.1),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBXurUBZIRNkHti1pQraeYUDsfrtormhg9Dj3zYs5l_1zYdkhY-Q1VZaBQ7EUaznQY6AoU-2jfr97-heTf-1aj0YYJqUlg1-SMycTU5nBxTVaZvBt_1r-xYukzVOy_jlHjwcwxp94Kxfmpwb3Rd_QRrRPKYSVyCtKzBa9rVclzo6DzP36mdZhx84pdkkyLJgTl955JaKwGZZYXJXS0DbM1gXhgU5TTwuNtJ6TIN5i39BJ32t0pmvtxA8NCKuj1t702U7OE1lahXoIo'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nike Air Zoom Pegasus 38', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Size 10 • Red/White', style: TextStyle(color: Colors.grey, fontSize: 12)),
                       SizedBox(height: 8),
                      Text('Refund Est. \$120.00', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildTimeline(),
          Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text('View Details', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(width: 1, height: 48, color: Colors.grey[200]),
                 Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Track Shipment', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

   Widget _buildTimeline() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTimelineStep('Return Requested', 'Oct 15, 10:30 AM', isCompleted: true),
          _buildTimelineStep('Pickup Successful', 'Oct 16, 2:15 PM', isCompleted: true, isActive: true),
          _buildTimelineStep('Received at Warehouse', 'In Progress', isCurrent: true),
          _buildTimelineStep('Refund Initiated', '', isLast: true),
        ],
      ),
    );
  }

   Widget _buildTimelineStep(String title, String subtitle, {bool isCompleted = false, bool isActive = false, bool isCurrent = false, bool isLast = false}) {
     return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(
                isCompleted ? (isActive ? Icons.local_shipping : Icons.check_circle) : (isCurrent ? Icons.inventory_2 : Icons.currency_exchange),
                color: isCompleted || isCurrent ? Color(0xFF6366F1) : Colors.grey[300],
                size: 20,
              ),
              if (!isLast) Expanded(child: Container(width: 2, color: isCompleted ? Color(0xFF6366F1).withOpacity(0.3) : Colors.grey[200]))
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isCompleted || isCurrent ? Colors.black : Colors.grey)),
                   if (subtitle.isNotEmpty) Text(subtitle, style: TextStyle(color: isCurrent ? Color(0xFF6366F1) : Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReturnItemSimple() {
     return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAnzTD0g0wXHnx1_x_RH0GOlM0PTrgssii2N5iLA6QXsJt1iFVZVKoWj0fesTtsuVNRKnFnm0AB_0D2heWPDuAJFN0MGFBvfanYMH_cdsq8t8TAT9PkpiDjuAfnaFlaOXDazoC6gejxudTxORG9Z0OUU7QJgQS1L7LkDo2W5CH_ATBxsx51BNiQmdlUBeUguuBgbCksCOcW7NGGbeSugCUU_vgYHAqhpfKXAL7ufsjcleqEHqyI5pkLo9aBgq72eGkgiqCsB2dZhu0'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order #24110', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          Chip(label: Text('Requested', style: TextStyle(color: Colors.blue, fontSize: 10)), backgroundColor: Colors.blue.withOpacity(0.1)),
                        ],
                      ),
                       SizedBox(height: 8),
                      Text('Sony WH-1000XM4', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Black • Wireless', style: TextStyle(color: Colors.grey, fontSize: 12)),
                       SizedBox(height: 8),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$348.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('View Status', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
   Widget _buildRefundPolicy() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF6366F1).withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF6366F1).withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.info, color: Color(0xFF6366F1))),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Refund Policy', style: TextStyle(fontWeight: FontWeight.bold)),
                 SizedBox(height: 8),
                Text('Refunds are processed to your original payment method within 5-7 business days after approval.', style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                 SizedBox(height: 8),
                 Text('Read full policy', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 12)),
              ],
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
      child: ElevatedButton.icon(
        icon: Icon(Icons.add_circle, color: Colors.white),
        label: Text('Start a New Return', style: TextStyle(color: Colors.white)),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 56),
          backgroundColor: Color(0xFF6366F1),
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
