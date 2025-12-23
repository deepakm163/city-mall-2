import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _currentRangeValues = const RangeValues(10, 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Filter & Sort', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Clear All', style: TextStyle(color: Color(0xFFEC4899), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildSortBy(),
          Divider(color: Colors.grey[200]),
          _buildPriceRange(),
           Divider(color: Colors.grey[200]),
          _buildDepartment(),
           Divider(color: Colors.grey[200]),
          _buildBrand(),
           Divider(color: Colors.grey[200]),
          _buildSizeAndColor(),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSortBy() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sort By', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSortChip('Recommended', isSelected: true),
              _buildSortChip('Price: Low to High'),
              _buildSortChip('Price: High to Low'),
              _buildSortChip('Newest'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSortChip(String label, {bool isSelected = false}) {
    return Chip(
      label: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
      backgroundColor: isSelected ? Color(0xFFEC4899) : Colors.grey[200],
      avatar: isSelected ? Icon(Icons.check, color: Colors.white, size: 16) : null,
    );
  }

  Widget _buildPriceRange() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price Range', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('\$${_currentRangeValues.start.round()} - \$${_currentRangeValues.end.round()}', style: TextStyle(color: Color(0xFFEC4899), fontWeight: FontWeight.bold)),
            ],
          ),
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 1000,
            divisions: 100,
            activeColor: Color(0xFFEC4899),
            inactiveColor: Colors.grey[300],
            labels: RangeLabels(
              '\$${_currentRangeValues.start.round()}',
              '\$${_currentRangeValues.end.round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
           Row(
            children: [
              Expanded(child: _buildPriceBox('Min', '\$${_currentRangeValues.start.round()}')),
              SizedBox(width: 16),
               Expanded(child: _buildPriceBox('Max', '\$${_currentRangeValues.end.round()}')),
            ],
           )
        ],
      ),
    );
  }

  Widget _buildPriceBox(String label, String value) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildDepartment() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Department', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildCheckbox('Men', true),
          _buildCheckbox('Women', false),
          _buildCheckbox('Kids', false),
        ],
      ),
    );
  }

  Widget _buildCheckbox(String title, bool value) {
     return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: (bool? newValue) {},
      activeColor: Color(0xFFEC4899),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }

   Widget _buildBrand() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Brand', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search brands...',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
           SizedBox(height: 8),
           _buildCheckbox('Nike', false),
           _buildCheckbox('Adidas', true),
           _buildCheckbox('Puma', false),
        ],
      ),
    );
  }

  Widget _buildSizeAndColor() {
     return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Size', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
           SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _buildSizeChip('XS'),
              _buildSizeChip('S', isSelected: true),
              _buildSizeChip('M'),
              _buildSizeChip('L'),
              _buildSizeChip('XL'),
            ],
          ),
           SizedBox(height: 24),
           Text('Color', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
           SizedBox(height: 8),
           Wrap(
            spacing: 16,
            children: [
              _buildColorCircle(Colors.black, isSelected: true),
              _buildColorCircle(Colors.white, hasBorder: true),
              _buildColorCircle(Colors.blue),
               _buildColorCircle(Colors.red),
                _buildColorCircle(Colors.green),
            ],
           ),
        ],
      ),
    );
  }

   Widget _buildSizeChip(String label, {bool isSelected = false}) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {},
      selectedColor: Color(0xFFEC4899),
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
    );
  }

  Widget _buildColorCircle(Color color, {bool isSelected = false, bool hasBorder = false}) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: isSelected ? Color(0xFFEC4899) : Colors.transparent,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: color,
        child: isSelected ? Icon(Icons.check, color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white) : null,
      ),
    );
  }

   Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.all(16),
       decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Apply Filters (142)', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
           backgroundColor: Color(0xFFEC4899),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
