import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildHeader(),
                  _buildDeliveryInfo(),
                  _buildOrderSummary(),
                  _buildHelpLink(),
                ],
              ),
            ),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF7C3AED).withOpacity(0.2),
                  blurRadius: 30,
                ),
              ],
            ),
            child: Icon(
              Icons.check,
              color: Color(0xFF7C3AED),
              size: 56,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Thank you for your order!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 12),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              children: [
                TextSpan(text: "We've sent a confirmation email to "),
                TextSpan(
                  text: 'user@email.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Color(0xFF7C3AED),
              child: Icon(Icons.local_shipping, color: Colors.white),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Estimated Delivery', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Arriving by Friday, Oct 24', style: TextStyle(color: Color(0xFF7C3AED), fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    final List<String> images = [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD5i-AXvTHG5oAbvBY0E7ZgQtR-SSelUT6AxrvPD7n2nlC6cv-v0mR7MWetbplxqMgmOxLBbSRIPxXI-_G_WR2O0IMZT-m-UJl0Ik_yj1NdndNy0Xx6oXqPPNIgB4dhyWZcWdFg7sPqgthMCapraV9uDCbdrr8-BUZAvsDDyY5PE99QwpKQdOwJu6F3n4vWrFErn7PBKOOT4_w8VEQdY8Il0DaopfkwbR5DkDoIC31PL3fEXj1eNl8R1vIhSzefdcsGhXTHbHYbDV4',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDIZw4IW5cNMLxLJrB5Hl3v_EwDUFhQ-nyAtJFz5hHLtEeSXE9FM3-03tNme3hxb9X0YWyV-lV8ywy3JKQ3m79EQPI4sxRKMUSRfUpCvR0q8WHAx1lrJV-RddeewKzpvUTZTEnvd6wQWiWVIur-yzuweTCulbwnO7N2LBUsVU-7o-6li2GhTZgg36dcctz58p0LfMHjBGn5sf9K3kIpgYCwxUp7HRAKuUG1ZuYT0pbKAYzohDoiLA87oLUY1ylibd2GXDCJBP1JXZY',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBAspu2uCQtqnWzxezd7hLHNaOI2QMGlDzGX_QEmFDwdvMaADN6uwqm3WWQk2y28Cvmn4ymvUf8UiPUsQ0GeolroYvXha-DlTEAm09ZKQ4KMCfOTV3rC3jxsMqtNUMlBQL-3xgQ7VkJsG5WmhUZoAP-0YSEpJLLzRUOEGdYZJMdEqu2AaeuIPCAs7q0Rv73ehW02cJgq81aCdAQIBOs14uBahYhWXU3EA7Yva8nRdcFTOarj6T3y1fB2YvV6tp98PmeCYj5if6YfoM',
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Chip(
                  label: Text('3 Items', style: TextStyle(color: Color(0xFF7C3AED), fontWeight: FontWeight.bold, fontSize: 10)),
                  backgroundColor: Color(0xFF7C3AED).withOpacity(0.1),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ...images.map((url) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                )).toList(),
                 Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                         decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text('View All', style: TextStyle(color: Color(0xFF7C3AED), fontWeight: FontWeight.bold, fontSize: 10))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
             Divider(height: 32),
            _buildSummaryRow('Order ID', '#CM-8492', icon: Icons.content_copy),
            _buildSummaryRow('Payment Method', 'Apple Pay •••• 4210'),
            _buildSummaryRow('Shipping', 'Free', isFree: true),
             Divider(height: 32),
            _buildSummaryRow('Total Amount', '\$124.50', isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {IconData? icon, bool isFree = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[600], fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, fontSize: isTotal ? 16 : 14)),
          Row(
            children: [
              if(isFree)
                Text(value, style: TextStyle(color: Colors.green[600], fontWeight: FontWeight.bold))
              else
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: isTotal ? FontWeight.w800 : FontWeight.bold,
                    fontSize: isTotal ? 20 : 14,
                     color: isTotal ? null : Colors.black,
                    foreground: isTotal ? Paint()
                      ..shader = LinearGradient(
                          colors: [Color(0xFF7C3AED), Color(0xFFEC4899)],
                        ).createShader(Rect.fromLTWH(0.0, 0.0, 100.0, 20.0)) : null,
                  ),
                ),
               if(icon != null) ...[
                SizedBox(width: 4),
                Icon(icon, color: Colors.grey, size: 16),
              ]
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelpLink() {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(Icons.help_outline, color: Colors.grey[600], size: 18),
      label: Text('Need help with this order?', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
       padding: EdgeInsets.fromLTRB(24, 16, 24, 32),
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
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              shadowColor: Color(0xFF7C3AED).withOpacity(0.3),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7C3AED), Color(0xFFD946EF)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: double.infinity,
                height: 56,
                alignment: Alignment.center,
                child: Text(
                  'Continue Shopping',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {},
            child: Text('Track Order'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.grey[800], minimumSize: Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              side: BorderSide(color: Colors.grey[300]!),
            ),
          ),
        ],
      ),
    );
  }
}
