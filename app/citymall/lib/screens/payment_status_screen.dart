import 'package:flutter/material.dart';

class PaymentStatusScreen extends StatelessWidget {
  final bool isSuccess;

  PaymentStatusScreen({this.isSuccess = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSuccess
                ? [Color(0xFF06B6D4), Color(0xFF3B82F6), Color(0xFF6366F1)]
                : [Color(0xFFF43F5E), Color(0xFFEF4444), Color(0xFFE11D48)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStatusIcon(),
                      SizedBox(height: 24),
                      _buildStatusText(),
                      SizedBox(height: 32),
                      if(isSuccess) _buildOrderDetails(),
                      if(!isSuccess) _buildFailureDetails(),
                    ],
                  ),
                ),
              ),
              _buildBottomActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.2),
          child: IconButton(
            icon: Icon(isSuccess ? Icons.close : Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIcon() {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.2),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
      ),
      child: Icon(
        isSuccess ? Icons.check_circle : Icons.priority_high,
        color: Colors.white,
        size: 56,
      ),
    );
  }

  Widget _buildStatusText() {
    return Column(
      children: [
        Text(
          isSuccess ? 'Order Placed!' : 'Payment Failed',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w800,
            shadows: [Shadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12),
        Text(
          isSuccess
              ? 'Thanks for shopping with CityMall. Your order has been successfully confirmed.'
              : "We couldn't process your payment. Please check your details or try a different payment method.",
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildOrderDetails() {
    return Container(
      padding: EdgeInsets.all(20),
       decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
      ),
      child: Column(
        children: [
           Row(
            children: [
               Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAoQpZzzbQaDc1ZhsiTENj3dh6FvHJsQfqE4XQHckysy03RS54-ERb8Gexl7OvWnE1tnK3RElnXuWXGKlnwBa2xwNzyYq2gd7-jkVD02T-A9_ATG6uYEZrZ2UaGCGJDKH2ohHybRYEMRCqLrrlhaL4kIQJEu2W09Llbu-1_zmdP38Lc39nxTo7FHYlB3Ok1BTjw8mPxRBHnx0Q9_oh3vFzVnyyDUUKNL_EAJQbdQ1GSJdgVmRkWFktTMXbN-cAeL5nFkOmqQ7Tt6oA'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nike Air Max 270', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Blue/White • Size 10', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          Divider(height: 32),
          _buildDetailRow('Order ID', '#CM-88219'),
          _buildDetailRow('Payment Method', 'Visa •• 4242', icon: Icons.credit_card),
          Divider(height: 32),
           _buildDetailRow('Total Amount', '\$145.00', isTotal: true),
        ],
      ),
    );
  }

   Widget _buildFailureDetails() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
        border: Border(left: BorderSide(color: Color(0xFFEF4444), width: 4)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.error, color: Color(0xFFEF4444)),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Transaction Declined', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Reason: Insufficient funds in the account ending in 4242.', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
           Divider(height: 32),
          _buildDetailRow('Total to pay', '\$145.00', isTotal: true),
        ],
      ),
    );
  }


  Widget _buildDetailRow(String title, String value, {IconData? icon, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[600], fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, fontSize: isTotal ? 16: 14)),
          Row(
            children: [
              if(icon != null) Icon(icon, color: Colors.grey[600], size: 16),
              if(icon != null) SizedBox(width: 4),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isTotal ? 20 : 14,
                  color: isTotal ? (isSuccess ? Color(0xFF4F46E5) : Color(0xFFEF4444)) : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if(isSuccess)
            ElevatedButton(
              onPressed: () {},
              child: Text('Track Order'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFF4F46E5), backgroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          if(!isSuccess)
             ElevatedButton(
              onPressed: () {},
              child: Text('Retry Payment'),
               style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFFEF4444), backgroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          SizedBox(height: 12),
          TextButton(
            onPressed: () {},
            child: Text(isSuccess ? 'Continue Shopping' : 'Change Payment Method', style: TextStyle(color: Colors.white.withOpacity(0.9))),
             style: TextButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.white.withOpacity(0.3))
              ),
            ),
          ),
        ],
      ),
    );
  }
}
