import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'otp.dart'; // Import the OTP page

class W1Page extends StatefulWidget {
  @override
  _W1PageState createState() => _W1PageState();
}

class _W1PageState extends State<W1Page> {
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _birthTimeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _birthDateController.text = DateFormat.yMMMd().format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _birthTimeController.text = picked.format(context);
      });
    }
  }

  void _navigateToOTP(BuildContext context) {
    if (_nameController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _birthDateController.text.isNotEmpty &&
        _birthTimeController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpOverlay()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all the details')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SizedBox to push content down from the top
                  SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                  // Welcome Text
                  Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w300, // Light weight
                      color: Color(0xFFFF9933),
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 10),
                  // Detail Sections
                  _buildDetailSection('I am', 'Enter your name', TextInputType.text, null, _nameController),
                  _buildDetailSection('From', 'Enter your location', TextInputType.text, null, _locationController),
                  _buildDetailSection('Born on', 'Enter your birth date', TextInputType.datetime, _selectDate, _birthDateController),
                  _buildDetailSection('At', 'Enter your birth time', TextInputType.datetime, _selectTime, _birthTimeController),
                  SizedBox(height: 10),
                  // Email Section
                  Text(
                    'Please enter your email address to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200, // Extra Light weight
                      color: Color(0xFFFF9933),
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      height: 50,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(color: Color(0xFFFF9933), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(color: Color(0xFFFF9933), width: 2.0),
                          ),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Inter'),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.arrow_forward, color: Color(0xFFFF9933)),
                            onPressed: () => _navigateToOTP(context),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(String label, String hintText, TextInputType keyboardType, Function? onTap, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              child: Text(
                label,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400, // Regular weight
                  color: Color(0xFFFF9933),
                  fontFamily: 'Inter',
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 50,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      borderSide: BorderSide(color: Color(0xFFFF9933), width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      borderSide: BorderSide(color: Color(0xFFFF9933), width: 2.0),
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Inter'),
                  ),
                  keyboardType: keyboardType,
                  style: TextStyle(color: Colors.white, fontFamily: 'Inter'),
                  readOnly: onTap != null,
                  onTap: onTap != null ? () => onTap(context) : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
