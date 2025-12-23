import 'package:flutter/material.dart';
import 'package:citymall/screens/checkout_screen.dart'; // Placeholder for next screen

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: 'My Cart '),
              TextSpan(
                text: '(3)',
                style: TextStyle(color: Color(0xFF4F46E5)),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildCartItem(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDdVdr96b39h0idXWkYAEUN9AT-WmvdwiFUlp2t91tP1byBOZhFVQ5BXLGHeEeRXprBq9k2dkLZCI4ybkAFa5k9f8Cyrha4jEwUsAtYtczczNRNMIGfwnNRPX1NquK8wl6r5MNPiv2ew8h4vloY8WAOWmowdZ2xMrIc7wp1eERHUv1M9b2juzxbw273JCqH2lpKgEtc-nadRO4IcjYjV7K1z6TyeeedQUOlQSgfRp-xCTWtotNKxvjJGgsuxZFwzAODgiQXaqXm4BA',
                  name: 'Nike Air Zoom Pegasus',
                  details: 'Size: 42 • Black',
                  price: '120.00',
                  quantity: 1,
                ),
                SizedBox(height: 16),
                _buildCartItem(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBMUWN9egDne_oF2WmdB5cs8rneHoSqIjp1AToFGguOzDfrYVW-gVnY5zmBt32yJK8Tpt4vegK69enUaa9bP_nDdUYULzsmBMvJF89NPUKu85AgVLgSk1HYG6iSi4Kv0VApLV7bpeHty1CGWUmjp7jcBwkQZAMQO_HPbTqbLtMpMh1mQd0PV-aywB2_vFBqolx9foH4I4EKsTzEEMmLwEjku4rSrv5eTipL3qVA96oOOP8M6FYYyTWRnn4qIYzyEI-BuJ_YQ9iIwc8',
                  name: 'Apple AirPods Pro',
                  details: 'Noise Cancelling',
                  price: '249.00',
                  quantity: 1,
                ),
                 SizedBox(height: 16),
                _buildCartItem(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAifL9mpkv9tN45WxXFxklVsekq-MhsFAakAImiOFho6S6yMG_749S9WoDc4hoCQb-BTsPr3pHLZOMCPDYeJ1LuSQskWYpLccRyfczbx2zZ4zyZyapYdi33ZNvsmeER4uDK_oMtsfSHxd22zWEAtX46lzCIypOfU81YH4bnghA4EMopbYcpk9R9ONdODfsN95itbGrC3htpEyr6lRtBJQxZtQ7rXCR9Wzks-78hZgc3JCogaE8oo2qjJL3iKwNebb6jgBTA1psCJVk',
                  name: 'Cotton Crew T-Shirt',
                  details: 'Size: M • White',
                  price: '25.00',
                  quantity: 1,
                ),
                SizedBox(height: 24),
                _buildDiscountCodeField(),
                SizedBox(height: 16),
                _buildOrderSummary(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildCartItem({
    required String imageUrl,
    required String name,
    required String details,
    required String price,
    required int quantity,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 112,
            height: 112,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.grey[400]),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(details, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$$price', style: TextStyle(color: Color(0xFF4F46E5), fontWeight: FontWeight.w800, fontSize: 20)),
                    Row(
                      children: [
                        _buildQuantityButton(Icons.remove),
                        SizedBox(width: 12, child: Center(child: Text('$quantity', style: TextStyle(fontWeight: FontWeight.bold)))),
                        _buildQuantityButton(Icons.add, isPrimary: true),
                      ],
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

  Widget _buildQuantityButton(IconData icon, {bool isPrimary = false}) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isPrimary ? Color(0xFF4F46E5) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: isPrimary ? null : Border.all(color: Colors.grey[300]!),
         boxShadow: isPrimary ? [
          BoxShadow(
            color: Color(0xFF4F46E5).withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ] : [],
      ),
      child: Icon(icon, color: isPrimary ? Colors.white : Colors.grey[600], size: 18),
    );
  }

  Widget _buildDiscountCodeField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.sell_outlined, color: Color(0xFF4F46E5)),
        hintText: 'Enter coupon code',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Apply'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4F46E5).withOpacity(0.1),
              foregroundColor: Color(0xFF4F46E5),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildSummaryRow('Subtotal', '\$394.00'),
          _buildSummaryRow('Tax (8%)', '\$31.52'),
          _buildSummaryRow('Shipping', 'Free', isFree: true),
          Divider(height: 32, thickness: 1, color: Colors.grey[200], indent: 8, endIndent: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('\$425.52', style: TextStyle(color: Color(0xFF4F46E5), fontWeight: FontWeight.w800, fontSize: 24)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isFree = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[600])),
          isFree
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(value, style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold, fontSize: 12)),
              )
            : Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 30,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Amount', style: TextStyle(color: Colors.grey[500], fontSize: 12, fontWeight: FontWeight.bold)),
                  Text('\$425.52', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
                ],
              ),
              Text('3 items', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
               Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CheckoutScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              shadowColor: Color(0xFF4F46E5).withOpacity(0.3),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF8B5CF6)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: double.infinity,
                height: 56,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Proceed to Checkout',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
