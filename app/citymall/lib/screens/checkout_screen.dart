import 'package:flutter/material.dart';
import 'package:citymall/screens/payment_method_screen.dart'; // Placeholder for next screen

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F3FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Checkout', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Cancel', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildStepper(),
                _buildShippingAddress(),
                _buildOrderSummary(),
                _buildPaymentMethod(),
                _buildPromoCode(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildStepper() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStep(icon: Icons.check, label: 'Delivery', isCompleted: true),
          _buildStep(number: '2', label: 'Payment', isActive: true),
          _buildStep(number: '3', label: 'Review'),
        ],
      ),
    );
  }

  Widget _buildStep({IconData? icon, String? number, required String label, bool isCompleted = false, bool isActive = false}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: isCompleted || isActive ? Color(0xFF6366F1) : Colors.grey[200],
          child: icon != null
              ? Icon(icon, color: Colors.white, size: 18)
              : Text(number!, style: TextStyle(color: isCompleted || isActive ? Colors.white : Colors.grey, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: isActive || isCompleted ? Colors.black : Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }

  Widget _buildShippingAddress() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shipping Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: Color(0xFF6366F1)),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('John Doe'),
                          Text('123 Market Street, Apt 4B\nSan Francisco, CA 94103\n+1 (555) 123-4567', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                     SizedBox(width: 16),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDgCEsa38BD1CBAf8ixK1YLhHGcFXF0kzc3L_7EvjAgQ-ea6DhCOyx6IWWPNx_TYNMsCQOQwQzT9dfmHS7HwPfLuK_BtWqVF8k9jobmrlJCe2opDiOPPCT9Yxcl9i7dhn6HrgAM5bakADN7rJJ_khPEvIyrhJ2SytS-0LXpPEMpU5ute6lGxoBcT3oOMtEaLlv9Pq219jaDkOhi5g727sjItIc7N-efj8eFmexmRx8jFHu3Av1v2uHa6qbugM2YcA2Gx8oTq_G8rhQ'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(height: 32),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Change Address', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildOrderItem(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB1HKguekTIRrWQ0gACfFKYKC507SXXZdiPTyQHz5FBjanV65BPHV2i4-WjxqZEtcXe2ujZCibJX-9YUXCiybJNCF8KiNFPM5YVKtRU5v-bI07dMfydcq91AmPlhzBW83KWirR3Jt7kc64wMCYoQK68DsmQeDJeV17nJFnRjz6N_jVBA__kfrwW98hz65Ac_inmAJma6cglN5Gg-fXetOEKL6NmrMBtPYlmM7-lID4ApXW__f1W_jp5kon3_UtdYaoDOleXo-WkZOk',
            name: 'Nike Air Max 270',
            details: "Men's Shoes • Size 42",
            price: '120.00',
            quantity: 1,
          ),
           SizedBox(height: 12),
           _buildOrderItem(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDiDKN8t3HYmIVRhyKEjpYL9pTFLnFpZdkgrQZ2N86v2tLV0h9HP6ioOfkcOVY_Kzps9ll3uORlg2dhG70dnwE5kL9v7MRdP3-35y0iQji-cIROk2uS_BWbkQsOUnxgXnB1xbV6jSc4W_0j_7vPoXDnXXrVPG-iE_t0MuH-s89yKcc8HQq3qkz3yBSup3UeEbcoPbT_odZMRusGZb7rk3GUjsu6ODSW_ulaOw7bddwTYmFveF6WKuEKXDQRuI8knHyZlEevfwH51uY',
            name: 'Elite Running Socks',
            details: 'Unisex • Size M',
            price: '14.00',
            quantity: 2,
          ),
        ],
      ),
    );
  }

   Widget _buildOrderItem({required String imageUrl, required String name, required String details, required String price, required int quantity}) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
           Container(
            width: 80,
            height: 80,
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6366F1))),
                  ],
                ),
                 SizedBox(height: 4),
                Text(details, style: TextStyle(color: Colors.grey, fontSize: 12)),
                 SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[200]!)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.remove, size: 16, color: Colors.grey),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('$quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Icon(Icons.add, size: 16, color: Color(0xFF6366F1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Padding(
       padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
           SizedBox(height: 16),
          _buildPaymentOption(
            brand: 'VISA',
            details: 'Visa ending in 4242',
            expiry: 'Expires 12/25',
            isSelected: true,
          ),
          SizedBox(height: 12),
           _buildPaymentOption(
            icon: Icons.apple,
            details: 'Apple Pay',
            isSelected: false,
          ),
           SizedBox(height: 12),
          TextButton.icon(
            icon: Icon(Icons.add_circle),
            label: Text('Add Payment Method'),
            onPressed: () {},
             style: TextButton.styleFrom(
              foregroundColor: Color(0xFF6366F1),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentOption({String? brand, IconData? icon, required String details, String? expiry, bool isSelected = false}) {
    return Container(
       padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isSelected ? Color(0xFF6366F1) : Colors.transparent, width: 2),
      ),
      child: Row(
        children: [
          if(brand != null)
            Container(
              width: 40,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.indigo[900],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(child: Text(brand, style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 10))),
            ),
           if(icon != null)
             Container(
              width: 40,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(icon, color: Colors.white, size: 16)
            ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(details, style: TextStyle(fontWeight: FontWeight.bold)),
                if (expiry != null)
                  Text(expiry, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isSelected ? Color(0xFF6366F1) : Colors.grey[300]!, width: isSelected ? 6: 2),
            ),
          )
        ],
      ),
    );
  }
   Widget _buildPromoCode() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.sell_outlined),
          hintText: 'Enter Promo Code',
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
                backgroundColor: Colors.indigo[50],
                foregroundColor: Color(0xFF6366F1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
       padding: EdgeInsets.fromLTRB(24, 24, 24, 32),
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
         boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 30,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSummaryRow('Subtotal', '\$134.00'),
          _buildSummaryRow('Shipping', 'Free', isFree: true),
           SizedBox(height: 8),
          _buildSummaryRow('Total', '\$134.00', isTotal: true),
           SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
               Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PaymentMethodScreen()),
              );
            },
             style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              shadowColor: Color(0xFF6366F1).withOpacity(0.3),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
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
                    Text('Place Order', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
           SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 12, color: Colors.grey),
              SizedBox(width: 4),
              Text('Secure Payment', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

   Widget _buildSummaryRow(String title, String value, {bool isFree = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: isTotal ? Colors.black : Colors.grey[600], fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, fontSize: isTotal ? 18 : 14)),
          isFree
            ? Text(value, style: TextStyle(color: Colors.green[600], fontWeight: FontWeight.bold))
            : Text(value, style: TextStyle(fontWeight: isTotal ? FontWeight.w800 : FontWeight.normal, color: isTotal ? Color(0xFF6366F1) : Colors.black, fontSize: isTotal ? 20 : 14)),
        ],
      ),
    );
  }
}
