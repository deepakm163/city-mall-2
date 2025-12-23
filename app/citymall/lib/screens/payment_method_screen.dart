import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Color(0xFF6366F1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Payment Method', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildTotalToPay(),
          _buildSavedCards(),
          _buildWallets(),
          _buildMoreOptions(),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildTotalToPay() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        children: [
          Text('Total to pay', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.5)),
          SizedBox(height: 8),
          Text(
            '\$540.00',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              foreground: Paint()
                ..shader = LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Saved Cards', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildPaymentOption(
            icon: Icons.credit_card,
            iconBgColor: Color(0xFF6366F1),
            title: 'Visa ending in 4242',
            subtitle: 'Expires 12/24',
            isSelected: true,
          ),
          SizedBox(height: 12),
          _buildPaymentOption(
            icon: Icons.credit_card,
            iconBgColor: Colors.orange,
            title: 'Mastercard ending in 8899',
            subtitle: 'Expires 08/25',
          ),
          SizedBox(height: 16),
          OutlinedButton.icon(
            icon: Icon(Icons.add_circle),
            label: Text('Add New Card'),
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Color(0xFF6366F1), minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(
                color: Color(0xFF6366F1).withOpacity(0.3),
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWallets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Wallets & UPI', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildPaymentOption(
            icon: Icons.phone_iphone,
            iconBgColor: Colors.black,
            title: 'Apple Pay',
            subtitle: 'Linked to 4242',
          ),
          SizedBox(height: 12),
          _buildPaymentOption(
            icon: Icons.payments,
            iconBgColor: Color(0xFF003087),
            title: 'PayPal',
            subtitle: 'john.doe@example.com',
          ),
        ],
      ),
    );
  }

  Widget _buildMoreOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('More Options', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildPaymentOption(
            icon: Icons.account_balance,
            iconBgColor: Colors.purple,
            title: 'Net Banking',
            subtitle: 'Select your bank',
          ),
          SizedBox(height: 12),
          _buildPaymentOption(
            icon: Icons.attach_money,
            iconBgColor: Colors.green,
            title: 'Cash on Delivery',
            subtitle: 'Pay when you receive',
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    bool isSelected = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isSelected ? Color(0xFF6366F1) : Colors.grey[200]!, width: 1),
         boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: iconBgColor.withOpacity(0.1),
            child: Icon(icon, color: iconBgColor),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Radio(
            value: true,
            groupValue: isSelected,
            onChanged: (bool? value) {},
            activeColor: Color(0xFF6366F1),
          ),
        ],
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
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Icon(Icons.verified_user, size: 16, color: Colors.green[700]),
                SizedBox(width: 8),
                Text('100% Safe & Secure Payment', style: TextStyle(color: Colors.green[800], fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
           SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigate to Payment Status or Confirmation
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              shadowColor: Color(0xFF6366F1).withOpacity(0.4),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                height: 56,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pay Now ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                       decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('\$540.00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
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
