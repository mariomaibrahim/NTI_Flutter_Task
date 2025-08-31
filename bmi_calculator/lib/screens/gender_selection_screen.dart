import 'package:flutter/material.dart';
import 'bmi_input_screen.dart';

class GenderSelectionScreen extends StatefulWidget {
  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Color(0xFFFF9800),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Please choose your gender',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40),
            // Male option
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'male';
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: selectedGender == 'male' 
                      ? Color(0xFFE8F5E8) 
                      : Color(0xFFE8F5E8),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedGender == 'male' 
                        ? Color(0xFF4CAF50) 
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4CAF50),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFF2196F3),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.male,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Female option
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'female';
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                  color: selectedGender == 'female' 
                      ? Color(0xFFFFF3E0) 
                      : Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedGender == 'female' 
                        ? Color(0xFFFF9800) 
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF9800),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFE91E63),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.female,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            // Continue button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedGender != null ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIInputScreen(gender: selectedGender!),
                    ),
                  );
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4CAF50),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

